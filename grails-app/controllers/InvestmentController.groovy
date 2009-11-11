import org.jsecurity.authc.AuthenticationException
import org.jsecurity.authc.UsernamePasswordToken
import org.jsecurity.SecurityUtils

class InvestmentController {
	
	def scaffold = true
	def index = { redirect(action:list,params:params)
	}
	
	def list = {
			println params.action
			println params.controller
			def permission = Permissions.findByType("org.jsecurity.authz.permission.WildcardPermission")
            println "wildperm: " +permission 
            
            def subject = org.jsecurity.SecurityUtils.getSubject()
            println "subject:"+subject
            if(subject && subject.principal) {
	            println "principal: "+subject.principal
	            def isPermitted = subject.isPermitted(new org.jsecurity.authz.permission.WildcardPermission("investment:list:1"))
	            println "isPermitted:"+isPermitted
	            def userInstance = Users.findByUsername(subject.principal)
	            println "userInstance"+userInstance
	            //            new UsersPermissionsRel(user: userInstance, permission: wildcardPermission, target: "investment:show,list,edit:"+, actions: "*").save()
			}
			
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		[ investmentInstanceList: Investment.list( params ), investmentInstanceTotal: Investment.count() ]
	}
	
	
	def show = {
		def investmentInstance = Investment.get( params.id )
		
		if(!investmentInstance) {
			flash.message = "Investment not found with id ${params.id}"
			redirect(action:list)
		}
		else { return [ investmentInstance : investmentInstance ]
		}
	}
	
	def delete = {
		def investmentInstance = Investment.get( params.id )
		if(investmentInstance) {
			try {
            def userPermissionRel = UsersPermissionsRel.findByTarget("investment:show,list,edit:"+investmentInstance.id)
	            investmentInstance.delete(flush:true)
	            userPermissionRel.delete(flush:true)
				flash.message = "Inwestycja '${investmentInstance.name}' usunięta"
			}
			catch(org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "Investment ${params.id} could not be deleted"
			}
		}
		else {
			flash.message = "Investment not found with id ${params.id}"
		}
		redirect(action:list)
	}
	
	def save = {
		def subject = org.jsecurity.SecurityUtils.getSubject()
		def userInstance = Users.findByUsername(subject.principal)
		def investmentInstance = new Investment()
		investmentInstance.name = params.name
		investmentInstance.user = userInstance
		if(!investmentInstance.hasErrors() && investmentInstance.save()) {
			def wildcardPermission = Permissions.findByType("org.jsecurity.authz.permission.WildcardPermission")
			println "wildperm: " +wildcardPermission 
			
			new UsersPermissionsRel(user: userInstance, permission: wildcardPermission, target: "investment:show,list,edit:"+investmentInstance.id, actions: "*").save()
			
			flash.message = "Investment ${investmentInstance.id} created"
			redirect(action:show,id:investmentInstance.id)
		}
		else {
			render(view:'create',model:[investmentInstance:investmentInstance])
		}
	}
	
	def create = {
		def investmentInstance = new Investment()
		investmentInstance.properties = params
		def subject = org.jsecurity.SecurityUtils.getSubject()
		println "sub:" + subject.principal
		def userInstance = Users.findByUsername(subject.principal)
		println "inst:" + userInstance
		return [investmentInstance: investmentInstance, userInstance: userInstance]
	}
	
}
