class User {
	Long id
	String email
	String password
	SortedSet newsy
	
	static hasMany = [ newsy: News]
	
	String toString() { "$email"
	}
	def static constraints = {
		email(email:true)
		password(blank:false, password:true)
	}
}
