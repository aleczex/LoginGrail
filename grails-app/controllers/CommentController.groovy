class CommentController {
	def scaffold = true
	
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
		if(!commentInstance.hasErrors() && commentInstance.save()) {
			flash.message = "Komentarz '${commentInstance.description}' dodany"
			redirect(controller:'picture', action:'list', id:params.folderid)
		} else {
			render(view:'create',model:[commentInstance:commentInstance])
		}
	}
	
}
