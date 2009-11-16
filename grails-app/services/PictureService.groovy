class PictureService { 

    def getLatestPictures(max) {
        def picturesList = Picture.findAll( "from Picture as n order by n.dateCreated desc",[max:max])
//        def list
//        
//        for(Picture p: picturesList) {
//        	def pic = []
//        	pic.add(p.caption)
//        	pic.add(p.filename)
//        	pic.add(p.folder_id);
//        }
    }
}