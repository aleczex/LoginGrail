class NewsService { 

	def getLastNewsList(max) {
        def newsInstanceList = News.findAll( "from News as n order by n.dateCreated desc",[max:max])
        def list =[]
        for(News n: newsInstanceList) {
        	def news = []
	        def investmentName = Folder.executeQuery( "select n.investment.name from News as n where n.id = ? ", [n.id] );
        	news.add(n)
        	news.add(investmentName.get(0))
        	list.add(news)
        }
        return list
	}
}
