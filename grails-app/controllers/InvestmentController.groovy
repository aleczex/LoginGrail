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
	
}
