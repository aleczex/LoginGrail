import java.security.*;
import java.math.*;


class PictureController {
	def pictureService
	def authorizationService
	def list = {
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		
		def folderInstance = Folder.get( params.id )
		
		if(!folderInstance) {
			flash.message = "Folder not found with id ${params.id}"
			redirect(controller:'folder')
		}
		else {
			def investmentInstance = Investment.find( "from Investment as i where i.id=:folderid", [folderid: folderInstance.investment.id] )
			if(!investmentInstance) {
				flash.message = "Investment not found with id ${params.id}"
				redirect(action:list)
			}           
			def userPictureList = authorizationService.getLoggedUserPictureListForInvestmentAndFolder(investmentInstance, folderInstance)
			def investmentOwner = authorizationService.isLoggedUserInvestmentOwner(investmentInstance)

			[investmentOwner: investmentOwner, userPictureList: userPictureList, investmentInstance: investmentInstance, folderInstance: folderInstance, pictureInstanceList: Picture.findAll( "from Picture as p where p.folder.id=:folderid order by p.dateCreated asc", 
			 [folderid: folderInstance.id]), pictureInstanceTotal: Picture.count(),
			commentInstanceList: Comment.findAll( "from Comment as c where exists (from Picture as p where p.id=c.picture.id and p.folder.id=:folderid) order by c.dateCreated asc", [folderid: folderInstance.id])]
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
			def subject = org.jsecurity.SecurityUtils.getSubject()
		    def userInstance = Users.findByUsername(subject.principal)
		    p.user = userInstance

			p.filename = "fake"
			if( !p.save(flush:true) ) {
				p.errors.each {
					println it
				}
			}
			p.filename = hashIt(userInstance.email + "_"  + p.id) + p.id
			p.save()
			f.transferTo( new File(basePath+'/'+p.filename) )
			def link="/picture/list/"+params.folder.id.encodeAsHTML() + "#" + p.id.encodeAsHTML()
			if(!pictureService.uploadPicture(basePath+'/'+p.filename)) {
				p.delete(flush:true)
				flash.message = 'Nie udało się dodać obrazka'
				redirect(uri: link)
			}
			def file = new File(basePath +'/'+ p.filename)
			if(file) {
				file.delete()
			}
	    
			redirect(uri: link)
		} else {
			flash.message = 'file cannot be empty'
			render(view:'create')
			return false
		}
	}
	
	def delete = {
		def basePath = grailsAttributes.getApplicationContext().getResource("/images/upload/").getFile().toString()
		def p = Picture.get(params.id)	
		def folderid = p.folder.id
		if(pictureService.deletePicture(basePath+'/'+p.filename)) {
			p.delete()
			redirect(action:'list', id: folderid)
		}
	}
	
	def create = {
		def subject = org.jsecurity.SecurityUtils.getSubject()
		def userInstance
		if(subject && subject.principal) {
			userInstance = Users.findByUsername(subject.principal)
		}
		def folderInstance = Folder.get( params.id )
		def investmentInstance = Investment.find( "from Investment as i where i.id=:investmentid", [investmentid: folderInstance.investment.id] )
		def pictureInstance = new Picture()
		pictureInstance.properties = params
		pictureInstance.caption = 'opis zdjęcia';
		
//        if(session.user.id != investmentInstance.user.id && !session.user.isAdmin) {
//            flash.message = "Nie możesz edytować nie swojej inwestycji"
//            redirect(id:params.id, action:list)
//        }
        println params;
		if(!folderInstance) {
			flash.message = "Folder not found with id ${params.id}"
			redirect(action:'list')
		}
		else {
			return [folderInstance: folderInstance, 'pictureInstance':pictureInstance, userInstance: userInstance]
		}
		
	}
	
	def update = {
		println "in update"
		def pictureInstance = Picture.get( params.id )
		println "pictureInstance: " + pictureInstance
		if(pictureInstance) {
			if(params.version) {
				println "in params.version: " + params.version
				def version = params.version.toLong()
				if(pictureInstance.version > version) {
					
					pictureInstance.errors.rejectValue("version", "picture.optimistic.locking.failure", "Another user has updated this Picture while you were editing.")
					render(view:'edit',model:[pictureInstance:pictureInstance])
					return
				}
			}
			println "params: " + params
			pictureInstance.properties = params
			if(!pictureInstance.hasErrors() && pictureInstance.save()) {
				flash.message = "Picture ${params.id} updated"
				redirect(action:list,id:pictureInstance.folder.id)
			}
			else {
				render(view:'edit',model:[pictureInstance:pictureInstance])
			}
		}
		else {
			flash.message = "Picture not found with id ${params.id}"
			redirect(action:list)
		}
	}	
	
	def edit = {
		def pictureInstance = Picture.get( params.id )
		def subject = org.jsecurity.SecurityUtils.getSubject()
		if(!subject) return null
		def userInstance = Users.findByUsername(subject.principal)
		
		if(!pictureInstance) {
			flash.message = "Picture not found with id ${params.id}"
			redirect(action:list)
		}
		else {
			def folderInstance = Folder.find("from Folder as f where exists (from Picture as p where f.id = p.folder.id and p.id=:pictureid)", [pictureid: pictureInstance.id]);
			return [ folderInstanceList: Folder.findAll( "from Folder as f where f.investment.id =:investmentid order by f.dateCreated asc)", [investmentid: folderInstance.investment.id]), 
			         pictureInstance : pictureInstance,
			         folderInstance: folderInstance,
			         investmentInstance: folderInstance.investment,
			         userInstance: userInstance]
		}
	}
	
	def String hashIt(String s) {
		MessageDigest m = MessageDigest.getInstance("MD5")
		m.update(s.getBytes(), 0, s.length())
		s = new BigInteger(1, m.digest()).toString(16)
		if (s.length() == 31) {
			s = "0" + s
		}
		return s
	}
	
}
