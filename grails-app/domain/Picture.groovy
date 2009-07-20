class Picture implements Comparable {
	Long id
	User user 
	String caption
	Folder folder
	Date dateAdded = new Date()
	String filename
	
	int compareTo(obj) {
		obj.id.compareTo(id)
	}
}