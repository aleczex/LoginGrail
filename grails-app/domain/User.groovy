class User {
	Long id
	String nick
	String email
	String password
	SortedSet investments
	Date dateCreated = new Date()
	
	static hasMany = [ investments: Investment]

	def static constraints = {
		nick(blank:false)
		email(email:true)
		password(blank:false, password:true)
	}
	
	static mapping = {
		table 'people'
	}
}
