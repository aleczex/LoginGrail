import groovy.text.Template
import groovy.text.SimpleTemplateEngine
import org.springframework.mail.MailException

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
	
	def processOrder = {
			if(session.cart){
				session.cart.client = session.client
				def order = mainService.processOrder(session.cart, params)
				if(order){
					flash.message = 'Order processed succesfully.'
					if(sendNotificationEmail(order)) flash.mailSent = true
					else flash.mailSent = false
				}
				chain(action:orderProcessed, model:[order:order])
			}
			else sessionExpired()
		}

	private sendNotificationEmail(String order) {
	
		File tplFile = grailsAttributes.getApplicationContext().getResource( File.separator + "WEB-INF" + File.separator + "templates" + File.separator + "mail.gsp").getFile(); 
		def binding = ["order": order] 
		def engine = new SimpleTemplateEngine() 
		def template = engine.createTemplate(tplFile).make(binding) 
		def body = template.toString()
		def email = [
			to: ['aleksander.pena@gmail.com'], // "to" expects a List
			subject: "Your Order #${order.number}",
			text: 	body
		]

		try { 
			emailerService.sendEmail(email) 
		} catch (MailException ex) { 
			log.error("Failed to send emails", ex) 
			return false 
		} 
		return true 
	} 
}