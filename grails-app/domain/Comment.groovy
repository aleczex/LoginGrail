class Comment implements Comparable {
	Long id
	User user
	String description
	Date dateCreated = new Date()
	Picture picture
	
	String toString() { "${this.class.name} : $id"
	}
	
    int compareTo(obj) {
        obj.id.compareTo(id)
    }
    
    static constraints = {
    	user(nullable:true)
    }

}
