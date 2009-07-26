class UserController {
	def login = {
	}
	def defaultAction = "edit"
	
	def scaffold = true
	
	def doLogin = {
		def user = User.findWhere(email:params['email'],
		password:params['password'])
		session.user = user
		if (!user)
		redirect(controller:'user', action:'login')
		else
		redirect(controller:'user', action:'login')
	}
	
	def doLogout = {
		session.user = null
		redirect(controller:'user',action:'login')
	}
	
	List newsy
	def news = {
		newsy = News.findAll()
	}
}