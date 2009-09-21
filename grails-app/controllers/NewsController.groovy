class NewsController {
	
	def scaffold = true

	def beforeInterceptor = [action:this.&checkUser,except:
	['index','list','shortlist']]
	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}
	
	def shortlist = {
		params.max = 2
		return [ newsInstanceList: News.findAll( "from News as n order by n.dateCreated desc",[max:2]), newsInstanceTotal: News.count() ]
	}
	
    def list = {
            def investmentInstance = Investment.get( params.id )
            if(!investmentInstance) {
                flash.message = "Investment not found with id ${params.id}"
                redirect(action:list)
            }
	        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
            [ investmentInstance: investmentInstance, newsInstanceList: News.findAll( "from News as n where n.investment.id =? order by n.dateCreated asc", investmentInstance.id), newsInstanceTotal: 10 ]
	    }
	
    def save = {
	        def newsInstance = new News(params)
	        if(!newsInstance.hasErrors() && newsInstance.save()) {
	            flash.message = "News ${newsInstance.id} created"
	            redirect(action:list)
	        }
	        else {
	            render(view:'create',model:[newsInstance:newsInstance])
	        }
	    }
}