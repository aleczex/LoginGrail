class RolesPermissionsRel {
    Roles role
    Permissions permission
    String target
    String actions

    static constraints = {
        actions(nullable: false, blank: false)
    }
}
