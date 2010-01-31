import org.jsecurity.authz.permission.WildcardPermission

class AuthorizationService { 
	
	def isInvestmentOwner(investmentInstance, userInstance) {
		if(hasAdministratorRole(userInstance)) {
			return true
		}
		if(investmentInstance.user == userInstance) {
			return true
		} else {
			return false
		}
	}
	
	def isLoggedUserInvestmentOwner(investmentInstance) {
		return isInvestmentOwner(investmentInstance, getLoggedUser())
	}
	
	def isFolderOwner(folderInstance, userInstance) {
		def investmentInstance = Investment.findByInvestment(folderInstance.investment);
		return isInvestmentOwner(investmentInstance, userInstance)
	}
	
	def isNewsOwner(newsInstance, userInstance) {
        def investmentInstance = Investment.findByInvestment(newsInstance.investment);
        return isInvestmentOwner(investmentInstance, userInstance)
	}
	
	def isPictureOwner(pictureInstance, userInstance) {
		def folderInstance = Folder.findByFolder(pictureInstance.folder)
		return isFolderOwner(folderInstance, userInstance)
	}
	
	def getUserInvestmentList(userInstance) {
		if(!userInstance) return []
		if(hasAdministratorRole(userInstance)) {
            return Investment.findAll()
		} else {
			return Investment.findAll("from Investment as i where i.user =:user", [user: userInstance])
		} 
	}
	
	def getLoggedUserInvestmentList() {
		return getUserInvestmentList(getLoggedUser())
	}
	
	def getUserFolderListForInvestment(userInstance, investmentInstance) {
	    if(!userInstance || !investmentInstance) return []
        if(hasAdministratorRole(userInstance)) {
            return Folder.findAll("from Folder as f where f.investment=:investment", [investment: investmentInstance])
        } else {
            return Folder.executeQuery("select f from Folder as f, Investment as i where f.investment=:investment and i.user=:user and i = f.investment", [investment: investmentInstance,user: userInstance])
        } 
	}
	
	def getLoggedUserFolderListForInvestment(investmentInstance) {
		return getUserFolderListForInvestment(getLoggedUser(), investmentInstance)
	}

	def getUserPictureListForInvestmentAndFolder(userInstance, investmentInstance, folderInstance) {
		if(!userInstance || !investmentInstance || !folderInstance) return []
		if(hasAdministratorRole(userInstance)) {
			return Picture.executeQuery("select p from Picture as p, Folder as f where f=:folder and p.folder = f", [folder: folderInstance])
        } else {
            return Picture.executeQuery("select p from Picture as p, Investment as i, Folder as f where i=:investment and i.user=:user and f=:folder and p.folder = f and f.investment = i", [investment: investmentInstance,user: userInstance, folder: folderInstance])
        } 
    }

	def getLoggedUserPictureListForInvestmentAndFolder(investmentInstance, folderInstance) {
		return getUserPictureListForInvestmentAndFolder(getLoggedUser(), investmentInstance, folderInstance)
	}
	
	def getUserNewsList(userInstance, investmentInstance) {
		if(!userInstance || !investmentInstance) return []
		if(hasAdministratorRole(userInstance)) {
			return News.findAll("from News as n where n.investment=:investment", [investment: investmentInstance])
		} else {
			return News.executeQuery("select n from News as n, Investment as i where n.investment=:investment and i.user=:user and i = n.investment", [investment: investmentInstance,user: userInstance])
		} 
	}

	def getLoggedUserNewsList(investmentInstance) {
		return getUserNewsList(getLoggedUser(), investmentInstance)		
	}


	
	def getLoggedUser() {
		def subject = org.jsecurity.SecurityUtils.getSubject()
        log.info("subject: " + subject)
        log.info("subject principal: " + subject.principal)
		if(subject && subject.principal) {
			return Users.findByUsername(subject.principal)
		}
    	return null
	}
	
	def hasAdministratorRole(userInstance) {
        def subject = org.jsecurity.SecurityUtils.getSubject()
        log.info("subject: " + subject)
        log.info("subject principal: " + subject.principal)
        if(subject && subject.principal) {
        	return subject.hasRole("Administrator")
        }
        log.info("not admin")
        return false
	}
}