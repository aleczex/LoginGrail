class Picture implements Comparable {
	Long id
	Users user 
	String caption
	Folder folder
	String filename
	SortedSet comments
	Date dateCreated = new Date()
	
	static hasMany = [comments: Comment]
	
	int compareTo(obj) {
		obj.id.compareTo(id)
	}
}