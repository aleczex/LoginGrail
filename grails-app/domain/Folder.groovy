class Folder {

	String name
	
	SortedSet pictures
	static hasMany = [pictures: Picture]
	
    static constraints = {
    }
}
