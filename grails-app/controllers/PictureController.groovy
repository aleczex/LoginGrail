class PictureController {
	def scaffold = true 
	
	def list = {
	        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
	        if(params.folderid == null) {
	        	redirect(controller:'folder')
	        }
	        [pictureInstanceList: Picture.findAll( "from Picture as p where p.folder.id=?", new Long(params.folderid)), pictureInstanceTotal: Picture.count() ]
	}
	          
	def beforeInterceptor = [action:this.&checkUser,except:
	['index','list','show']]
	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}
	def save = {
		def f = request.getFile('myFile')

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
            f.transferTo( new File('D:\\workspace\\LoginGrails\\web-app\\images\\'+p.filename) )
			redirect(action:'list')
		} else {
			flash.message = 'file cannot be empty'
			render(view:'create')
			return false
		}
	}
	
	def delete = {
		def p = Picture.get(params.id)	
		def f = new File('D:\\workspace\\LoginGrails\\web-app\\images\\' + p.filename)
		if(f) {
			f.delete()
			p.delete()
			redirect(action:'list')
		}
	}
}
