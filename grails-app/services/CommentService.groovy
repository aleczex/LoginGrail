class CommentService {
	
	def getLastCommentList(max) {
		def commentInstanceList = Comment.findAll( "from Comment as n order by n.dateCreated desc",[max:max])
		def list =[]
		for(Comment c: commentInstanceList) {
			def comments = []
			def investmentName = Folder.executeQuery( "select f.investment.name from Folder as f, Picture as p, Comment as c where c.picture = p.id and c.id = ? and p.folder = f.id", [c.id] );
			
			comments.add(c)
			comments.add(investmentName.get(0))
			comments.add(c.picture)
			list.add(comments)
		}
		return list
	}
}