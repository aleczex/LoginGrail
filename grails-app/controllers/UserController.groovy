import EmailerService

class UserController {
	def emailerService
	
	def defaultAction = "login"
	
	def scaffold = true
	
	def login ={}
	
	def beforeInterceptor = [action:this.&checkUser,except:
		['login', 'doLogin', 'forgotPassword']]
	
	def checkUser() {
		if(!session.user) {
			redirect(controller:'user',action:'login')
			return false
		}
	}

	def doLogin = {
		println "in do Login"
		def user = User.findWhere(email:params['email'],
		password:params['password'])
		session.user = user
		if (!user) {
			flash.message="Nie ma takiego użytkownika. Spróbuj jeszcze raz."
			redirect(controller:'user', action:'login')
		} else {
			redirect(uri:'/')
		}
	}
	
	def doLogout = {
		session.user = null
		redirect(uri:'/')
	}
	
	def forgotPassword = {
		//def templateUri = grailsAttributes.getTemplateUri("myTemplate",request)
		def email = [ to: [ params.email ], subject: 'Przypomnienie hasła', text: 'tutaj hasło'] 
        email.template = grailsAttributes.getApplicationContext().getResource("templates" + File.separator + "mail.gsp"); 
		println "forgot password z: " + email
		if(params.email == null || params.email.isEmpty()) {
			flash.message = "Musisz podać prawidłowy adres email!"
		} else {
	        emailerService.sendNotificationEmail(email)
			flash.message = "Email z przypomnieniem hasła został wysłany na twój adres email"
		}
		redirect(controller:'user', action:'login')
	}
}
