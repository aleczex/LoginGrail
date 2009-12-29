import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

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
    
    def uploadPicture(filename) {
    	def BufferedImage bi
    	def imageProcessing = new ImageProcessing()
    	if(imageProcessing) {
    		bi = imageProcessing.loadImage(filename);
    		if(bi) {
    			bi = imageProcessing.scale(bi, 640, 640);
    			if(bi) {
    				if(!imageProcessing.saveImage(filename, bi)) {
    					return false
    				}    
    			} else {
    				return false
    			}
    		} else {
    			return false
    		}
    		bi = imageProcessing.loadImage(filename);
            if(bi) {
                bi = imageProcessing.scale(bi, 100, 100);
                if(bi) {
                    if(!imageProcessing.saveImage(filename+'_100', bi)) {
                        return false
                    }    
                } else {
                	return false
                }
            } else {
            	return false
            }
            bi = imageProcessing.loadImage(filename);
            if(bi) {
                bi = imageProcessing.scale(bi, 320, 320);
                if(bi) {
                    if(!imageProcessing.saveImage(filename+'_320', bi)) {
                        return false
                    }    
                } else {
                	return false
                }
            } else {
            	return false
            }
    	}
    	return true
    }
    
    def deletePicture(filename) {
        def f = new File(filename+'.jpg')
        if(f) {
        	f.delete()
        }
        f = new File(filename+'_100.jpg')
        if(f) {
            f.delete()
        }
        f = new File(filename+'_320.jpg')
        if(f) {
            f.delete()
        }
    }
}