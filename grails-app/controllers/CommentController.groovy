class CommentController {
	def jcaptchaService
	
	def create = {
		def pictureInstance = Picture.get( params.id )
		def commentInstance = new Comment()
		commentInstance.properties = params
		if(!pictureInstance) {
			flash.message = "Picture not found with id ${params.id}"
			redirect(controller:'picture', action:'list')
		} else {
			return [pictureInstance: pictureInstance, 'commentInstance':commentInstance]
		}
		
	}
	
	def list = {
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		def offset = params.offset ? params.offset.toInteger(): 1
		[ commentInstanceList: Comment.findAll( "from Comment as c order by c.dateCreated asc", [max: params.max, offset: offset]), commentInstanceTotal: Comment.count() ]
	}
	
	def save = {
		def pictureInstance = Picture.get(params.picture.id)
		def commentInstance = new Comment(picture: pictureInstance)
		commentInstance.properties = params
		def subject = org.jsecurity.SecurityUtils.getSubject()
		if(subject && subject.principal) {
			commentInstance.user = Users.findByUsername(subject.principal)
		}
		
		if (commentInstance.description && 
		jcaptchaService.validateResponse("image", session.id, params.response)
		&& !commentInstance.hasErrors() && commentInstance.save()) {
			flash.message = "Komentarz '${commentInstance.description}' dodany"
			redirect(controller:'picture', action:'list', id:params.folderid)
		} else {
			flash.message = "Nie udało się dodać komentarza, spróbuj jeszcze raz"
			render(view:'create',model:[pictureInstance:pictureInstance, commentInstance:commentInstance])
		}
	}
	
	def delete = {
		def commentInstance = Comment.get( params.id )
		if(commentInstance) {
			try {
				commentInstance.delete(flush:true)
				flash.message = "Comment \${params.id} deleted"
				redirect(action:list)
			}
			catch(org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "Comment \${params.id} could not be deleted"
				redirect(action:show,id:params.id)
			}
		}
		else {
			flash.message = "Comment not found with id \${params.id}"
			redirect(action:list)
		}
	}
	
	def edit = {
		def commentInstance = Comment.get( params.id )
		
		if(!commentInstance) {
			flash.message = "Comment not found with id \${params.id}"
			redirect(action:list)
		}
		else {
			return [ commentInstance : commentInstance ]
		}
	}
	
	def update = {
		def commentInstance = Comment.get( params.id )
		if(commentInstance) {
			if(params.version) {
				def version = params.version.toLong()
				if(commentInstance.version > version) {
					commentInstance.errors.rejectValue("version", "${lowerCaseName}.optimistic.locking.failure", "Another user has updated this Comment while you were editing.")
					render(view:'edit',model:[commentInstance:commentInstance])
					return
				}
			}
			commentInstance.properties = params
			if(!commentInstance.hasErrors() && commentInstance.save()) {
				flash.message = "Comment \${params.id} updated"
				redirect(action:show,id:commentInstance.id)
			}
			else {
				render(view:'edit',model:[commentInstance:commentInstance])
			}
		}
		else {
			flash.message = "Comment not found with id \${params.id}"
			redirect(action:list)
		}
	}
}
