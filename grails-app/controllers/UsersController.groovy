import org.jsecurity.crypto.hash.Sha1Hash

class UsersController {
	def jcaptchaService
	
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ usersInstanceList: Users.list( params ), usersInstanceTotal: Users.count() ]
    }

    def show = {
        def usersInstance = Users.get( params.id )

        if(!usersInstance) {
            flash.message = "Użytkownik o id: ${params.id} nie został znaleziony"
            redirect(action:list)
        }
        else { return [ usersInstance : usersInstance ] }
    }

    def delete = {
        def usersInstance = Users.get( params.id )
        if(usersInstance) {
            try {
            	def userRole = UsersRolesRel.findByUser(usersInstance);
            	if(userRole) {
            		userRole.delete(flush:true);
            	}
                usersInstance.delete(flush:true)
                flash.message = "Użytkownik '${usersInstance.username}' został usunięty"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Użytkownik '${usersInstance.username}' nie może być usunięty."
                redirect(action:list,id:params.id)
            }
        }
        else {
            flash.message = "Użytkownik o id: ${params.id} nie został znaleziony"
            redirect(action:list)
        }
    }

    def edit = {
        def usersInstance = Users.get( params.id )

        if(!usersInstance) {
            flash.message = "Użytkownik o id: ${params.id} nie został znaleziony"
            redirect(action:list)
        }
        else {
            return [ usersInstance : usersInstance ]
        }
    }

    def update = {
        def usersInstance = Users.get( params.id )
        if(usersInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(usersInstance.version > version) {
                    
                    usersInstance.errors.rejectValue("version", "users.optimistic.locking.failure", "Another user has updated this Users while you were editing.")
                    render(view:'edit',model:[usersInstance:usersInstance])
                    return
                }
            }
            usersInstance.properties = params
            usersInstance.passwordHash = new Sha1Hash(usersInstance.passwordHash).toHex()
            if(!usersInstance.hasErrors() && usersInstance.save()) {
                flash.message = "Użytkownik ${usersInstance.username} został uaktualniony"
                redirect(action:list,id:usersInstance.id)
            }
            else {
                render(view:'edit',model:[usersInstance:usersInstance])
            }
        }
        else {
            flash.message = "Użytkownik o id: ${params.id} nie został znaleziony"
            redirect(action:list)
        }
    }

    def create = {
        def usersInstance = new Users()
        usersInstance.properties = params
        return ['usersInstance':usersInstance]
    }

    def register = {
        def usersInstance = new Users()
        usersInstance.properties = params
        return ['usersInstance':usersInstance]
    }
    
    def reguser = {
        def usersInstance = new Users()
        usersInstance.properties = params
        def origPass = usersInstance.passwordHash
        usersInstance.passwordHash = new Sha1Hash(usersInstance.passwordHash).toHex()
        
        def investmentInstance = new Investment()
        investmentInstance.properties = params
        investmentInstance.user = usersInstance

        println "username:" + usersInstance.username
        println "found:"+ Users.findByUsername(usersInstance.username)
        if(Users.findByUsername(usersInstance.username) != null) {
            flash.message = "Użytkownik o podanej nazwie jest już zarejestrowany w systemie. Wybierz inną nazwę użytkownika."
            usersInstance.passwordHash=origPass
            render(view:'register',model:[usersInstance:usersInstance, investmentInstance:investmentInstance])
            return
        }

        if(jcaptchaService.validateResponse("image", session.id, params.response) 
        	&& !usersInstance.hasErrors() && usersInstance.save()) {
            if(!investmentInstance.hasErrors() && investmentInstance.save()) {
            	//nie dodaje sie rola do tabeli ponizej 
            	def role = Roles.findByName("User")
            	new UsersRolesRel(user: usersInstance, role: role).save()
            	flash.message = "Użytkownik: ${usersInstance.username} oraz inwestycja: ${investmentInstance.name} utworzone"
	            redirect(controller:'auth',action:'login',id:usersInstance.id)
            } else {
            	flash.message = "Wszystkie pola są wymagane. Musisz je wypełnić."
                usersInstance.passwordHash=origPass
                render(view:'register',model:[usersInstance:usersInstance, investmentInstance:investmentInstance])
            }
        } else {
            flash.message = "Wszystkie pola są wymagane. Musisz je wypełnić."
        	usersInstance.passwordHash=origPass
        	render(view:'register',model:[usersInstance:usersInstance, investmentInstance:investmentInstance])
        }    	
    }
    
    def save = {
        def usersInstance = new Users(params)
        if(!usersInstance.hasErrors() && usersInstance.save()) {
            flash.message = "Użytkownik ${usersInstance.username} został utworzony"
            redirect(action:list, id:usersInstance.id)
        } else {
            render(view:'create',model:[usersInstance:usersInstance])
        }
    }
}
