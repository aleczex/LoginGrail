import org.jsecurity.crypto.hash.Sha1Hash

class UsersController {
    
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
            flash.message = "Users not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ usersInstance : usersInstance ] }
    }

    def delete = {
        def usersInstance = Users.get( params.id )
        if(usersInstance) {
            try {
                usersInstance.delete(flush:true)
                flash.message = "Users ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Users ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Users not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def usersInstance = Users.get( params.id )

        if(!usersInstance) {
            flash.message = "Users not found with id ${params.id}"
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
                flash.message = "Users ${params.id} updated"
                redirect(action:show,id:usersInstance.id)
            }
            else {
                render(view:'edit',model:[usersInstance:usersInstance])
            }
        }
        else {
            flash.message = "Users not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def usersInstance = new Users()
        usersInstance.properties = params
        return ['usersInstance':usersInstance]
    }

    def save = {
        def usersInstance = new Users(params)
        if(!usersInstance.hasErrors() && usersInstance.save()) {
            flash.message = "Users ${usersInstance.id} created"
            redirect(action:show,id:usersInstance.id)
        }
        else {
            render(view:'create',model:[usersInstance:usersInstance])
        }
    }
}
