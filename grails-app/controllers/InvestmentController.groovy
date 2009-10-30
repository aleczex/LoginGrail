import org.jsecurity.authc.AuthenticationException
import org.jsecurity.authc.UsernamePasswordToken
import org.jsecurity.SecurityUtils

class InvestmentController {

	def scaffold = true
    def index = { redirect(action:list,params:params)}
	
    def show = {
	        def investmentInstance = Investment.get( params.id )

	        if(!investmentInstance) {
	            flash.message = "Investment not found with id ${params.id}"
	            redirect(action:list)
	        }
	        else { return [ investmentInstance : investmentInstance ] }
	    }
	
    def delete = {
			def investmentInstance = Investment.get( params.id )
	        if(investmentInstance) {
	            try {
	            	investmentInstance.delete(flush:true)
	                flash.message = "Investment ${params.id} deleted"
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
	
}
