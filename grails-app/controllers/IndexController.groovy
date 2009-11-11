class IndexController {
    
	static defaultAction = "index"
	def newsService
	
	def index = { 
        def newsInstanceList = newsService.getLastTwoNews();
        [newsInstanceList: newsInstanceList]
    }
}