class Investment implements Comparable {
    Long id
    String name
    SortedSet newsy
    SortedSet folders
    Date dateCreated = new Date()
    User user
    
    static hasMany = [ newsy: News, folders: Folder]
    
    def static constraints = {
        name(blank:false)
    }
    
    int compareTo(obj) {
        obj.id.compareTo(id)
    }
}