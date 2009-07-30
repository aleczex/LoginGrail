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
		params.max = 3
		return [ newsInstanceList: News.findAll( "from News as n order by n.dateCreated desc",[max:3]), newsInstanceTotal: News.count() ]
	}
}