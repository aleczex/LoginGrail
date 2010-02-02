import org.jsecurity.authc.AuthenticationException
import org.jsecurity.authc.UsernamePasswordToken
import org.jsecurity.SecurityUtils

class InvestmentController {
	def investmentService
	def authorizationService
	
    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']
	
	def index = { 
        log.info "index"
		redirect(action:list,params:params)
	}
	
	// ok
	def list = {
        log.info "list"
        
        def userInvestmentList = authorizationService.getLoggedUserInvestmentList()
        def offset = params.offset ? params.offset.toInteger(): 1
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		[ userInvestmentList: userInvestmentList, investmentInstanceList: Investment.list( max: params.max, offset: offset, sort: "dateCreated" ), investmentInstanceTotal: Investment.count() ]
	}
	
	// ok
	def show = {
        log.info "show"
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
        log.info "delete"
		def investmentInstance = Investment.get( params.id )
		if(authorizationService.isLoggedUserInvestmentOwner(investmentInstance)) {
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
        log.info "save"
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
        log.info "create"
		def investmentInstance = new Investment()
		investmentInstance.properties = params
		def subject = org.jsecurity.SecurityUtils.getSubject()
		def userInstance = Users.findByUsername(subject.principal)
		return [investmentInstance: investmentInstance, userInstance: userInstance]
	}
	
	// ok
	def update = {
        log.info "update"
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
        log.info "edit"
		def investmentInstance = Investment.get( params.id )
		if(investmentService.hasRightToInvestment(investmentInstance, "edit")) {
			return [ investmentInstance : investmentInstance ]
		} else { 
			flash.message = "Nie możesz edytować tej inwestycji"
			redirect(action:list)
		}
	}
}
