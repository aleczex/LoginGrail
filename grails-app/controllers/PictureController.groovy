class PictureController {
	def scaffold = true 

	def beforeInterceptor = [action:this.&checkUser,except:
		['index','list']]

	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}

	def list = {
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		
		def folderInstance = Folder.get( params.id )
		
		if(!folderInstance) {
			flash.message = "Folder not found with id ${params.id}"
			redirect(controller:'folder')
		}
		else {
			[folderInstance: folderInstance, pictureInstanceList: Picture.findAll( "from Picture as p where p.folder.id=?", folderInstance.id), pictureInstanceTotal: Picture.count(),
			 commentInstanceList: Comment.findAll( "from Comment as c where exists (from Picture as p where p.id=c.picture.id and p.folder.id=?)", folderInstance.id)]
		}
	}
	
	def save = {
		def f = request.getFile('myFile')
		def basePath = grailsAttributes.getApplicationContext().getResource("/images/upload/").getFile().toString()

		if(!f.empty) {
			if(params.caption.empty) {
				flash.message = 'caption cannot be empty'
				render(view:'create')
				return false
			}
			def p = new Picture(params)
			p.filename = "fake"
			p.save(flush:true)
			p.filename = session.user.email + "_"+ p.id + ".jpg"
			p.save()
			f.transferTo( new File(basePath+'/'+p.filename) )
			redirect(action:'list')
		} else {
			flash.message = 'file cannot be empty'
			render(view:'create')
			return false
		}
	}
	
	def delete = {
		def basePath = grailsAttributes.getApplicationContext().getResource("/images/upload/").getFile().toString()
		def p = Picture.get(params.id)	
		def f = new File(basePath +'/'+ p.filename)
		if(f) {
			f.delete()
			p.delete()
			redirect(action:'list')
		}
	}
	
    def create = {
			def folderInstance = Folder.get( params.id )
	        def pictureInstance = new Picture()
	        pictureInstance.properties = params
			if(!folderInstance) {
				flash.message = "Folder not found with id ${params.id}"
				redirect(action:'list')
			}
			else {
		        return [folderInstance: folderInstance, 'pictureInstance':pictureInstance]
			}
			
	}
}
