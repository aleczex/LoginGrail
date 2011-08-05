import org.jsecurity.authc.AuthenticationException
import org.jsecurity.authc.UsernamePasswordToken
import org.jsecurity.SecurityUtils


class AuthController {
    def jsecSecurityManager
    def emailerService
    def index = { redirect(action: 'login', params: params) }

    def login = {
        return [ username: params.username, rememberMe: (params.rememberMe != null), targetUri: params.targetUri ]
    }

    def signIn = {
    	def authToken = new UsernamePasswordToken(params.username, params.password)

        // Support for "remember me"
        if (params.rememberMe) {
            authToken.rememberMe = true
        }
        try{
            // Perform the actual login. An AuthenticationException
            // will be thrown if the username is unrecognised or the
            // password is incorrect.
            this.jsecSecurityManager.login(authToken)

            // If a controller redirected to this page, redirect back
            // to it. Otherwise redirect to the root URI.
            def targetUri = params.targetUri ?: "/"

            log.info "Redirecting to '${targetUri}'."
            redirect(uri: targetUri)
        }
        catch (AuthenticationException ex){
            // Authentication failed, so display the appropriate message
            // on the login page.
            log.info "Authentication failure for user '${params.username}'."
            flash.message = message(code: "login.failed")

            // Keep the username and "remember me" setting so that the
            // user doesn't have to enter them again.
            def m = [ username: params.username ]
            if (params.rememberMe) {
                m['rememberMe'] = true
            }

            // Remember the target URI too.
            if (params.targetUri) {
                m['targetUri'] = params.targetUri
            }

            // Now redirect back to the login page.
            redirect(action: 'login', params: m)
        }
    }

    def signOut = {
        // Log the user out of the application.
        SecurityUtils.subject?.logout()

        // For now, redirect back to the home page.
        redirect(uri: '/')
    }

    def unauthorized = {
        render 'You do not have permission to access this page.'
    }
    
    def forgotPassword = {
            //def templateUri = grailsAttributes.getTemplateUri("myTemplate",request)
            def email = [ to: [ params.email ], subject: 'Przypomnienie hasła', text: 'tutaj hasło'] 
            email.template = grailsAttributes.getApplicationContext().getResource("templates" + File.separator + "mail.gsp"); 
            println "forgot password z: " + email
            if(params.email == null || params.email.isEmpty()) {
                flash.message = "Musisz podać prawidłowy adres email!"
            } else {
                if(emailerService.sendNotificationEmail(email)) {
                    flash.message = "Email z przypomnieniem hasła został wysłany na twój adres email"
                } else {
                    flash.message = "Nie udało się wysłać emaila z przypomnieniem hasła"
                }
            }
            redirect(controller:'user', action:'login')
        }
}
