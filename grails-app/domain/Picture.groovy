class Picture implements Comparable {
	Long id
	User user 
	String caption
	Folder folder
	Date dateCreated = new Date()
	String filename
	
	SortedSet comments
	static hasMany = [comments: Comment]
	
	int compareTo(obj) {
		obj.id.compareTo(id)
	}
}