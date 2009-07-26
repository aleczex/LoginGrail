class NewsController {
	
	def beforeInterceptor = [action:this.&checkUser,except:
	['index','list','show', 'shortlist']]
	def scaffold = true
	def checkUser() {
		if(!session.user) {
			// i.e. user not logged in
			redirect(controller:'user',action:'login')
			return false
		}
	}
	
	def shortlist = {
		params.max = 3
		return [ newsInstanceList: News.list( params ), newsInstanceTotal: News.count() ]
		println "to jest test"
		println "size: " + News.count()
	}
}