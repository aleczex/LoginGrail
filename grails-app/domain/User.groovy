class User {
	Long id
	String nick
	String email
	String password
	SortedSet newsy
	Date dateCreated = new Date()
	
	static hasMany = [ newsy: News]
	
	String toString() { "$email"
	}
	def static constraints = {
		nick(blank:false)
		email(email:true)
		password(blank:false, password:true)
	}
	
	static mapping = {
		table 'people'
	}
}
