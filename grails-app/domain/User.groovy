class User {
	Long id
	String nick
	String email
	String password
	SortedSet investments
	Date dateCreated = new Date()
	Boolean isAdmin
	
	static hasMany = [ investments: Investment]

	def static constraints = {
		nick(blank:false)
		email(email:true)
		password(blank:false, password:true)
		isAdmin(blank:false)
	}
	
	static mapping = {
		table 'people'
	}
}
