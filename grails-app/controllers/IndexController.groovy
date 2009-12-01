class IndexController {
    
	static defaultAction = "index"
	def newsService
	def pictureService
	def commentService
	
	def index = { 
	    countHit(request.getRemoteAddr())
        def newsInstanceList = newsService.getLastNewsList(4)
        def latestPicturesList = pictureService.getLatestPicturesList(4)
        def latestCommentsList = commentService.getLastCommentList(3)
        [newsInstanceList: newsInstanceList, latestPicturesList: latestPicturesList, latestCommentsList: latestCommentsList]
	}
	
	def static hitNumber = [:]
    def countHit(ip) {
        def hits = hitNumber.get(ip)
        if(!hits) {
            hitNumber.put(ip, 1)
        } else {
            hitNumber.put(ip, hits++)
        }
        println "hits: " + hitNumber
    }
}