class Folder {

	String name
	Date dateCreated = new Date()
	SortedSet pictures
	static hasMany = [pictures: Picture]
	
    static constraints = {
    }
}
