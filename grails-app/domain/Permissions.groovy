class Permissions implements org.jsecurity.authz.Permission, Serializable {
    String type
    String possibleActions
    boolean implies(org.jsecurity.authz.Permission p) { false }
    static constraints = {
        type(nullable: false, blank: false, unique: true)
        possibleActions(nullable:false, blank: false)
    }
}
