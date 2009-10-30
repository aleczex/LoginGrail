import org.jsecurity.crypto.hash.Sha1Hash

class BootStrap {
	
	def init = { 
		//    		 servletContext ->
		//     	new User(nick:"Alek",email:"apena@wp.pl",password:"password").save()
		
		// Administrator user and role. 
		//		def adminRole = new JsecRole(name: "Administrator").save() 
		//		def adminUser = new JsecUser(username: "admin", passwordHash: new Sha1Hash("admin").toHex()).save() 
		//		new JsecUserRoleRel(user: adminUser, role: adminRole).save()
		//		
		//
		//		def userRole = new JsecRole(name: "User").save() 
		//		def adminPermission = find("adminPermission");
		
		// A normal user. 
//				def userRole = new JsecRole(name: "User").save() 
//				def normalUser = new JsecUser(username: "phil", passwordHash: new Sha1Hash("password").toHex()).save() 
//				new JsecUserRoleRel(user: normalUser, role: userRole).save()
		
		// Give another user the "User" role. 
		//		normalUser = new JsecUser(username: "alice", passwordHash: new Sha1Hash("changeit").toHex()).save() 
		//		new JsecUserRoleRel(user: normalUser, role: userRole).save()
		
		// Wildcard permissions.
//		def wildcardPermission = new JsecPermission(type: "org.jsecurity.authz.permission.WildcardPermission", possibleActions: "*").save()
//		def user1 = new JsecUser(username: "phil1", passwordHash: new Sha1Hash("password").toHex()).save()
//		def user2 = new JsecUser(username: "phil2", passwordHash: new Sha1Hash("password").toHex()).save()
//		new JsecUserPermissionRel(user: user1, permission: wildcardPermission, target: "investment:list,show", actions: "*").save()
//		new JsecUserPermissionRel(user: user2, permission: wildcardPermission, target: "investment:*", actions: "*").save()
		
//insert into jsec_user_permission_rel(id, version, actions, permission_id, target, user_id) 
//values (nextval('hibernate_sequence'), 0, '*', 154, 'investment:*', 128)

	}
	
	def destroy = {
	}
} 
