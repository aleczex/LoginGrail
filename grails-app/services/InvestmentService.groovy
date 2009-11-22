import org.jsecurity.authz.permission.WildcardPermission

class InvestmentService { 
	
	def getUserPermission(investmentInstance, userInstance) {
		def userRole = UsersRoles.findByUser(userInstance)
		println "rola dla uzytkownika: " + userInstance.name + " = " + userRole
		if(userRole == "User") {
			return UsersPermissionsRel.findByTargetAndUser("investment:*:"+investmentInstance.id, userInstance)
		} 
		if(userRole == "Administrator") {
			return UsersPermissionsRel.findByTargetAndUser("investment:*:*", userInstance)
		}
		return null
	}
	
	// ok
	def hasRightToInvestment(investmentInstance, action) {
		if(!action || !investmentInstance) return false
		def permission = Permissions.findByType("org.jsecurity.authz.permission.WildcardPermission")
        def subject = org.jsecurity.SecurityUtils.getSubject()
		def isPermitted = false

		if(subject && subject.principal) {
			// check for Admin right
			isPermitted = subject.isPermitted(new WildcardPermission("investment:"+action+":*"))
			if(!isPermitted) {
				// check for user right
				isPermitted = subject.isPermitted(new WildcardPermission("investment:"+action+":"+investmentInstance.id))
			}
			println "has right to " +action+ ", " + investmentInstance.name + "?: " + isPermitted
		}
		return isPermitted
	}

	// ok
	def remInvestment(investmentInstance) {
		if(!investmentInstance) {
			println "investmentInstance = null"
			return false
		}
		println "usuwamy inwestycje: " + investmentInstance.name
		def ownerInstance = investmentInstance.user
		println "wlasciciel inwestycji: " + ownerInstance.username
		def permission = Permissions.findByType("org.jsecurity.authz.permission.WildcardPermission")
		try {
			def ownerPermissionRel = UsersPermissionsRel.findByTargetAndUser("investment:*:"+investmentInstance.id, ownerInstance)
			println "userpermrel " + ownerPermissionRel
			investmentInstance.delete(flush:true)
			println "deleted: " + investmentInstance.name
			if(ownerPermissionRel) {
				ownerPermissionRel.delete(flush:true)
				println "deleted: " + ownerPermissionRel
			}
			return true
		} catch(org.springframework.dao.DataIntegrityViolationException e) {
			return false
		}
	}
	
	// ok
	def addInvestmentForUser(investmentName) {
		println "add investment: " + investmentName
		def permission = Permissions.findByType("org.jsecurity.authz.permission.WildcardPermission")
		def subject = org.jsecurity.SecurityUtils.getSubject()
		if(!subject) return null
		def userInstance = Users.findByUsername(subject.principal)
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
				println "investment created"
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