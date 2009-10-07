import EmailerService

import groovy.text.Template
import groovy.text.SimpleTemplateEngine
import org.springframework.mail.MailException

class TestEmailsController { 
	
	def emailerService
	/**
http://localhost:8080/LoginGrail/testEmails?to=alex@horisone.com&subject=hello+world&text=This+is+a+test
     */
     def index = { 
		def email = [ to: [ params.to ], subject: params.subject, text: params.text ] 
		emailerService.sendNotificationEmail(email)
        render("done") 
	} 
}
