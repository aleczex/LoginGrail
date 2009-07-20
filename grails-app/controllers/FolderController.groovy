

class FolderController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ folderInstanceList: Folder.list( params ), folderInstanceTotal: Folder.count() ]
    }

    def show = {
        def folderInstance = Folder.get( params.id )

        if(!folderInstance) {
            flash.message = "Folder not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ folderInstance : folderInstance ] }
    }

    def delete = {
        def folderInstance = Folder.get( params.id )
        if(folderInstance) {
            try {
                folderInstance.delete(flush:true)
                flash.message = "Folder ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Folder ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Folder not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def folderInstance = Folder.get( params.id )

        if(!folderInstance) {
            flash.message = "Folder not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ folderInstance : folderInstance ]
        }
    }

    def update = {
        def folderInstance = Folder.get( params.id )
        if(folderInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(folderInstance.version > version) {
                    
                    folderInstance.errors.rejectValue("version", "folder.optimistic.locking.failure", "Another user has updated this Folder while you were editing.")
                    render(view:'edit',model:[folderInstance:folderInstance])
                    return
                }
            }
            folderInstance.properties = params
            if(!folderInstance.hasErrors() && folderInstance.save()) {
                flash.message = "Folder ${params.id} updated"
                redirect(action:show,id:folderInstance.id)
            }
            else {
                render(view:'edit',model:[folderInstance:folderInstance])
            }
        }
        else {
            flash.message = "Folder not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def folderInstance = new Folder()
        folderInstance.properties = params
        return ['folderInstance':folderInstance]
    }

    def save = {
        def folderInstance = new Folder(params)
        if(!folderInstance.hasErrors() && folderInstance.save()) {
            flash.message = "Folder ${folderInstance.id} created"
            redirect(action:show,id:folderInstance.id)
        }
        else {
            render(view:'create',model:[folderInstance:folderInstance])
        }
    }
}
