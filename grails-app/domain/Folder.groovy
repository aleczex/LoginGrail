class Folder implements Comparable {
	Long id
	String name
	SortedSet pictures
	Date dateCreated = new Date()
	Investment investment
	static hasMany = [pictures: Picture]
	
    static constraints = {
		name(blank:false)
    }
	
    int compareTo(obj) {
        obj.id.compareTo(id)
    }
}
