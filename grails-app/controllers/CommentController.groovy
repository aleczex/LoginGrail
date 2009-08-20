class CommentController {
	def scaffold = true
    def index = { }
	
    def create = {
			def pictureInstance = Picture.get( params.id )
	        def commentInstance = new Comment()
	        commentInstance.properties = params
			if(!pictureInstance) {
				flash.message = "Picture not found with id ${params.id}"
				redirect(action:'list')
			}
			else {
		        return [pictureInstance: pictureInstance, 'commentInstance':commentInstance]
			}
			
	}
}
