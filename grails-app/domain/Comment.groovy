class Comment implements Comparable {
	Long id
	User user
	String description
	Picture picture
	Date dateCreated = new Date()
	
	static belongsTo = [picture: Picture]
    static constraints = {
    	user(nullable:true)
    	description(blank:false)
    }

	int compareTo(obj) {
        obj.id.compareTo(id)
    }
}
