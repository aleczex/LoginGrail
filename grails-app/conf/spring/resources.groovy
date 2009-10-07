beans = {
	smtpAuthenticator(SmtpAuthenticator, 'alex', 'mkALm24l'){ }
	mailSession(javax.mail.Session, ['mail.smtp.auth':'true'], smtpAuthenticator) { }
	mailSender(org.springframework.mail.javamail.JavaMailSenderImpl) { 
		session= mailSession 
		host = 'horisone.com' 
	}
	mailMessage(org.springframework.mail.SimpleMailMessage) { from = 'alex@horisone.com' }
	mailPropertiesBean(MailPropertiesBean) { from ='alex@horisone.com'}
}
