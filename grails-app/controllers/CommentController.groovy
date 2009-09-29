class CommentController {
	def scaffold = true
	
	def beforeInterceptor = [action:this.&checkUser,except:
	['create', 'save']]
	
	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}
	
	def create = {
		def pictureInstance = Picture.get( params.id )
		def commentInstance = new Comment()
		commentInstance.properties = params
		if(!pictureInstance) {
			flash.message = "Picture not found with id ${params.id}"
			redirect(controller:'picture', action:'list')
		}
		else {
			return [pictureInstance: pictureInstance, 'commentInstance':commentInstance]
		}
		
	}
	
	def list = {
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		[ commentInstanceList: Comment.findAll( "from Comment as c order by c.dateCreated asc"), commentInstanceTotal: Comment.count() ]
	}
	
	def save = {
		def pictureInstance = Picture.get(params.picture.id)
		def commentInstance = new Comment(picture: pictureInstance)
		commentInstance.properties = params
		if(!commentInstance.hasErrors() && commentInstance.save()) {
			flash.message = "Comment ${commentInstance.id} created"
			redirect(controller:'picture', action:'list', id:params.folderid)
		}
		else {
			render(view:'create',model:[commentInstance:commentInstance])
		}
	}
	
}
