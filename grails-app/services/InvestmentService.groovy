class InvestmentService { 
	
	def getLoggedUser() {
        def subject = org.jsecurity.SecurityUtils.getSubject()
        return Users.findByUsername(subject.principal)
	}
	
	def hasRightToInvestment(investmentInstance, action, userInstance) {
		def permission = Permissions.findByType("org.jsecurity.authz.permission.WildcardPermission")
		def subject = org.jsecurity.SecurityUtils.getSubject()
		def isPermitted = false
		if(investmentInstance && subject && subject.principal) {
			println "hasright, investmentInstance not null"
			isPermitted = subject.isPermitted(new org.jsecurity.authz.permission.WildcardPermission("investment:"+action+":"+investmentInstance.id))
		} else if(investmentInstance == null && subject && subject.principal) {
			println "hasright, investmentInstance null"
			isPermitted = subject.isPermitted(new org.jsecurity.authz.permission.WildcardPermission("investment:"+action+":*"))
		}
		return isPermitted
	}
	def remInvestment(investmentInstance) {
		println "inside rem 1" + investmentInstance
		if(!investmentInstance) {
			return false
		}
		def userInstance = investmentInstance.user
		def permission = Permissions.findByType("org.jsecurity.authz.permission.WildcardPermission")
		try {
			def userPermissionRel = UsersPermissionsRel.findByTargetAndUser("investment:*:"+investmentInstance.id, userInstance)
			println "userpermrel " + userPermissionRel
			if(userPermissionRel) {
				userPermissionRel.delete(flush:true)
			}
			investmentInstance.delete(flush:true)
			return true
		} catch(org.springframework.dao.DataIntegrityViolationException e) {
			return false
		}
	}
	
	def addInvestmentForUser(investmentName, userInstance) {
		def permission = Permissions.findByType("org.jsecurity.authz.permission.WildcardPermission")
		def investmentInstance = new Investment()
		investmentInstance.name = investmentName
		investmentInstance.user = userInstance
		if(!investmentInstance.hasErrors() && investmentInstance.save()) {
			println "investment saved: " + investmentInstance
			def userPermissionRel 
			if(subject.hasRole("Administrator")) {
				userPermissionRel = UsersPermissionsRel.findByTargetAndUser("investment:*:*", userInstance)
				println "full permission for administrator found?: " + userPermissionRel
				if(!userPermissionRel) {
					userPermissionRel = new UsersPermissionsRel(user: userInstance, permission: permission, target: "investment:*:*", actions: "*")
					println "full permission for administrator not found - created new: " + userPermissionRel
				}
			} else {
				userPermissionRel = new UsersPermissionsRel(user: userInstance, permission: permission, target: "investment:*:"+investmentInstance.id, actions: "*")            
			}
			
			if(!userPermissionRel.hasErrors() && userPermissionRel.save()) {
				return investmentInstance
			} else {
				investmentInstance.delete()
				println "userpermissionrel not created"
			}
		}
		println "investment not created"
		return null
	}
}