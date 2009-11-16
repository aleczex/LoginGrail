class IndexController {
    
	static defaultAction = "index"
	def newsService
	def pictureService
	
	def index = { 
        def newsInstanceList = newsService.getLastTwoNews();
        def latestPicturesList = pictureService.getLatestPictures(3);
        println latestPicturesList;
        [newsInstanceList: newsInstanceList, latestPicturesList: latestPicturesList]
	}
}