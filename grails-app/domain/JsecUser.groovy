class JsecUser {
    String username
    String passwordHash
    String email
    SortedSet investments

    static hasMany = [ investments: Investment]
    Date dateCreated = new Date()

    static constraints = {
        username(nullable: false, blank: false)
        email(nullable: false, blank: false, email:true)
    }
}
