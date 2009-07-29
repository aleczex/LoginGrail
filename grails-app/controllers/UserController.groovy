class UserController {

	def defaultAction = "edit"
	
	def scaffold = true
	
	def login = {
	}
	
	def beforeInterceptor = [action:this.&checkUser,except:
		['login', 'doLogin']]
	
	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}

	def doLogin = {
		def user = User.findWhere(email:params['email'],
		password:params['password'])
		session.user = user
		if (!user)
		redirect(controller:'user', action:'login')
		else
		redirect(uri:'/')
	}
	
	def doLogout = {
		session.user = null
		redirect(uri:'/')
	}
}