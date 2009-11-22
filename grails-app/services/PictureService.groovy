class PictureService { 

    def getLatestPicturesList(max) {
        def picturesList = Picture.findAll( "from Picture as n order by n.dateCreated desc",[max:max])
        def list = []

		for(Picture p: picturesList) {
        	def pic = []
	        def investmentName = Folder.executeQuery( "select f.investment.name from Folder as f, Picture as p where p.id = ? and p.folder = f.id", [p.id] );
        	pic.add(p)
        	pic.add(investmentName.get(0))
        	list.add(pic)
        }
        return list
    }
}