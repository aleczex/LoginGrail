import org.jsecurity.crypto.hash.Sha1Hash

class BootStrap {

     def init = { 
//    		 servletContext ->
//     	new User(nick:"Alek",email:"apena@wp.pl",password:"password").save()

		// Administrator user and role. 
		def adminRole = new JsecRole(name: "Administrator").save() 
		def adminUser = new JsecUser(username: "admin", passwordHash: new Sha1Hash("admin").toHex()).save() 
		new JsecUserRoleRel(user: adminUser, role: adminRole).save()
		
		// A normal user. 
		def userRole = new JsecRole(name: "User").save() 
		def normalUser = new JsecUser(username: "phil", passwordHash: new Sha1Hash("password").toHex()).save() 
		new JsecUserRoleRel(user: normalUser, role: userRole).save()
		
		// Give another user the "User" role. 
		normalUser = new JsecUser(username: "alice", passwordHash: new Sha1Hash("changeit").toHex()).save() 
		new JsecUserRoleRel(user: normalUser, role: userRole).save()
     }
     
     def destroy = {
     }
} 
