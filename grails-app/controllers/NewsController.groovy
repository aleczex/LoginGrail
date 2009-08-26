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
	        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
	        [ newsInstanceList: News.findAll( "from News as n order by n.dateCreated asc"), newsInstanceTotal: News.count() ]
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