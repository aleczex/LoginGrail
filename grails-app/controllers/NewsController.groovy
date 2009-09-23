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
			redirect(controller:'investment',action:'list')
		}
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
		[ investmentInstance: investmentInstance, newsInstanceList: News.findAll( "from News as n where n.investment.id =? order by n.dateCreated asc", investmentInstance.id), newsInstanceTotal: 10 ]
	}
	
	def save = {
		def investmentInstance = Investment.get( params.investmentInstance.id )
		if(!investmentInstance) {
			flash.message = "Investment not found with id ${params.id}"
			redirect(action:list)
		}			
		def newsInstance = new News(params)
		newsInstance.investment = investmentInstance;
		if(!newsInstance.hasErrors() && newsInstance.save()) {
			flash.message = "News ${newsInstance.id} created"
			redirect(action:list, id:investmentInstance.id)
		}
		else {
			render(view:'create',model:[newsInstance:newsInstance])
		}
	}
	
	def create = {
		def investmentInstance = Investment.get( params.id )
		if(!investmentInstance) {
			flash.message = "Investment not found with id ${params.id}"
			redirect(action:list)
		}
		
		def folderInstance = new Folder(investment: investmentInstance)
		folderInstance.properties = params
		return [investmentInstance: investmentInstance, 'folderInstance':folderInstance]
	}
	
	def delete = {
		def newsInstance = News.get( params.id )
		println("newsInstance: " + newsInstance)
		if(newsInstance) {
			try {
				println("before delete: ")
				newsInstance.delete(flush:true)
				flash.message = "News ${params.id} deleted"
				redirect(action:list, id:params.investmentid)
			}
			catch(org.springframework.dao.DataIntegrityViolationException e) {
				println("error: " + e)
				flash.message = "News ${params.id} could not be deleted"
				redirect(action:list,id:params.investmentid)
			}
		}
		else {
			flash.message = "News not found with id ${params.id}"
			redirect(action:list, id:params.investmentid)
		}
	}	
    
	def edit = {
			def investmentInstance = Investment.get(params.investmentid)
			
	        def newsInstance = News.get( params.id )

	        if(!newsInstance) {
	            flash.message = "News not found with id ${params.id}"
	            redirect(action:list)
	        }
	        else {
	            return [ investmentInstance:investmentInstance, newsInstance : newsInstance ]
	        }
	    }
	
	def update = {
	        def newsInstance = News.get( params.id )
	        if(newsInstance) {
	            if(params.version) {
	                def version = params.version.toLong()
	                if(newsInstance.version > version) {
	                    
	                	newsInstance.errors.rejectValue("version", "news.optimistic.locking.failure", "Another user has updated this News while you were editing.")
	                    render(view:'edit',model:[newsInstance:newsInstance])
	                    return
	                }
	            }
	            newsInstance.properties = params
	            if(!newsInstance.hasErrors() && newsInstance.save()) {
	                flash.message = "News ${params.id} updated"
	                redirect(action:list,id: params.investmentid)
	            }
	            else {
	                render(view:'edit',model:[newsInstance:newsInstance])
	            }
	        }
	        else {
	            flash.message = "News not found with id ${params.id}"
	            redirect(action:list)
	        }
	    }
}