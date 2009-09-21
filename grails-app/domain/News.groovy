class News implements Comparable {
	Long id
	Investment investment
	String description
	Date dateCreated = new Date()
	
    static constraints = {
		description(blank:false)
    }
	
    int compareTo(obj) {
        obj.id.compareTo(id)
    }
}
