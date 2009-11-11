class NewsService { 

	def getLastTwoNews() {
        def newsInstanceList = News.findAll( "from News as n order by n.dateCreated desc",[max:2])
	}
}
