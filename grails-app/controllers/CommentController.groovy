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
	
	def save = {
		def commentInstance = new Comment(params)
		if(!commentInstance.hasErrors() && commentInstance.save()) {
			flash.message = "Folder ${commentInstance.id} created"
			redirect(controller:'picture', action:'list', id:params.folderid)
		}
		else {
			render(view:'create',model:[commentInstance:commentInstance])
		}
	}
	
}
