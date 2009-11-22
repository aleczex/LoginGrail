class IndexController {
    
	static defaultAction = "index"
	def newsService
	def pictureService
	def commentService
	
	def index = { 
        def newsInstanceList = newsService.getLastNewsList(4)
        def latestPicturesList = pictureService.getLatestPicturesList(4)
        def latestCommentsList = commentService.getLastCommentList(3)
        [newsInstanceList: newsInstanceList, latestPicturesList: latestPicturesList, latestCommentsList: latestCommentsList]
	}
}