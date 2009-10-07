import org.springframework.mail.MailException
import org.springframework.mail.MailSender
import org.apache.log4j.Logger;
import org.springframework.mail.javamail.MimeMessageHelper
import javax.mail.internet.MimeMessage 
import javax.mail.internet.InternetAddress;
import groovy.text.Template
import groovy.text.SimpleTemplateEngine

class EmailerService { 
	boolean transactional = false 
	MailSender mailSender 
	MailPropertiesBean mailPropertiesBean

// If next line is commented in, this service fails to be loaded by grails, 
// as every grails-artefact already has a 'log' property 
// Logger log = Logger.getLogger(this.class.name)

	def sendEmail(mail) throws MailException {
		MimeMessage mimeMessage = mailSender.createMimeMessage()
		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
		helper.setFrom(mailPropertiesBean.getFrom()); 
		helper.setTo(getInternetAddresses(mail.to)); 
		helper.setSubject(mail.subject); 
		helper.setText(mail.text, true); 
		if(mail.bcc) 
			helper.setBcc(getInternetAddresses(mail.bcc)); 
		if(mail.cc) 
			helper.setCc(getInternetAddresses(mail.cc));
		mailSender.send(mimeMessage) 
	}

	private InternetAddress[] getInternetAddresses(List emails) { 
		InternetAddress[] mailAddresses = new InternetAddress[emails.size()]; 
		emails.eachWithIndex {
			mail, i -> mailAddresses[i] = new InternetAddress(mail) 
		} 
		return mailAddresses; 
	} 
	
   private sendNotificationEmail(mail){ 
        File tplFile = mail.template.getFile(); 
        def binding = ["mail": mail] 
        def engine = new SimpleTemplateEngine() 
        def template = engine.createTemplate(tplFile).make(binding) 
        def body = template.toString()
    
        def email = [ to: mail.to,  
                      subject: mail.subject, 
                      text: body ]
    
        try { 
            sendEmail(email) 
        } catch (MailException ex) { 
            log.error("Failed to send emails", ex) 
            return false 
        } 
        return true 
    } 
}


