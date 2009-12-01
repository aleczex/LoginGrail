import org.jsecurity.authc.AuthenticationException
import org.jsecurity.authc.UsernamePasswordToken
import org.jsecurity.SecurityUtils

class InvestmentController {
	def investmentService
	
    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']
	
	def index = { 
		redirect(action:list,params:params)
	}
	
	// ok
	def list = {
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		[ investmentInstanceList: Investment.list( max: params.max, sort: "dateCreated" ), investmentInstanceTotal: Investment.count() ]
	}
	
	// ok
	def show = {
		def investmentInstance = Investment.get( params.id )
		
		if(!investmentInstance) {
			flash.message = "Investment not found with id ${params.id}"
			redirect(action:list)
		}
		else { return [ investmentInstance : investmentInstance ]
		}
	}
	// ok
	def delete = {
		println "in delete"
		def investmentInstance = Investment.get( params.id )
		if(investmentService.hasRightToInvestment(investmentInstance, "delete")) {
			if(investmentService.remInvestment(investmentInstance)) {
				flash.message = "Inwestycja '${investmentInstance?.name}' usunięta"
				redirect(action:list)
			} else {
				flash.message = "Inwestycja '${investmentInstance?.name}' nie może być usunięta"
				redirect(action:list)
			}
		}
		else {
			flash.message = "Nie możesz usunąć tej inwestycji"
			redirect(action:list)
		}
	}
	
	// ok
	def save = {
		println "in save"
		def investmentInstance = investmentService.addInvestmentForUser(params.name)
		if(investmentInstance) {
			flash.message = "Inwestycja '${investmentInstance.name}' utworzona"
			redirect(action:show,id:investmentInstance.id)
		} else {
			flash.message = "Nie udalo sie dodać inwestycji"
			redirect(action:list)
		}
	}
	
	// ok
	def create = {
		println "in create"
		def investmentInstance = new Investment()
		investmentInstance.properties = params
		def subject = org.jsecurity.SecurityUtils.getSubject()
		def userInstance = Users.findByUsername(subject.principal)
		return [investmentInstance: investmentInstance, userInstance: userInstance]
	}
	
	// ok
	def update = {
		println "in update"
		def investmentInstance = Investment.get( params.id )
		if(investmentService.hasRightToInvestment(investmentInstance, "update")) {
			if(params.version) {
				def version = params.version.toLong()
				if(investmentInstance.version > version) {
					investmentInstance.errors.rejectValue("version", "${lowerCaseName}.optimistic.locking.failure", "Another user has updated this Investment while you were editing.")
					render(view:'edit',model:[investmentInstance:investmentInstance])
					return
				}
			}
			investmentInstance.properties = params
			if(!investmentInstance.hasErrors() && investmentInstance.save()) {
				flash.message = "Inwestycja uaktualniona"
				redirect(action:list)
			}
			else {
				render(view:'edit',model:[investmentInstance:investmentInstance])
			}
		}
		else {
			flash.message = "Nie możesz zmieniać tej inwestycji"
			redirect(action:list)
		}
	}
	
	// ok
	def edit = {
		def investmentInstance = Investment.get( params.id )
		if(investmentService.hasRightToInvestment(investmentInstance, "edit")) {
			return [ investmentInstance : investmentInstance ]
		} else { 
			flash.message = "Nie możesz edytować tej inwestycji"
			redirect(action:list)
		}
	}
}
