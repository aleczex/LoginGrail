import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.TreeSet;

import javax.imageio.ImageIO;


public class ImageProcessing {

	public BufferedImage loadImage(String filename) {
		int w, h;
		BufferedImage bi2 = null;
		try {
			BufferedImage bi = ImageIO.read(new File(filename));
			w = bi.getWidth(null);
			h = bi.getHeight(null);
			if (bi.getType() != BufferedImage.TYPE_INT_RGB) {
				bi2 = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
				Graphics g2 = bi2.getGraphics();
				g2.drawImage(bi, 0, 0, null);
			}
		} catch (IOException e) {
			System.out.println("Image could not be read");
			return null;
		}
		return bi2;
	}

	public BufferedImage scale(BufferedImage bi, int newW, int newH) {
		if(bi == null) return null;
		int width = bi.getWidth();
		int height = bi.getHeight();
		double sx = 1, sy = 1;
		if (width > newW) {
			sx = newW / (double)width;
			sy = sx;
			if(sy*height > newH) {
				sy = newH/(double)height;
				sx = sy;
			}
		}
		newW = (int)(width*sx);
		newH = (int)(height*sy);
		
		BufferedImage bi2 = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 = (Graphics2D) bi2.getGraphics();
		g2.drawImage(bi, AffineTransform.getScaleInstance(sx, sy), null);
		return bi2;
	}

	/* Return the formats sorted alphabetically and in lower case */
	public String[] getFormats() {
		String[] formats = ImageIO.getWriterFormatNames();
		TreeSet<String> formatSet = new TreeSet<String>();
		for (String s : formats) {
			formatSet.add(s.toLowerCase());
		}
		return formatSet.toArray(new String[0]);
	}

	public boolean saveImage(String filename, BufferedImage bi) {
		if(bi == null) return false;
		boolean result = false;
		String format = "jpg";
		File saveFile = new File(filename + "." + format);
		try {
			result = ImageIO.write(bi, format, saveFile);
		} catch (IOException ex) {
			System.err.println("exc:" + ex);
		}
		return result;
	}
	
	public static void main(String [] s) {
		BufferedImage bi;
		ImageProcessing si = new ImageProcessing();

		bi = si.loadImage("image.jpg");
		bi = si.scale(bi, 640, 640);
		si.saveImage("image_new", bi);

		bi = si.loadImage("image.jpg");
		bi = si.scale(bi, 100, 100);
		si.saveImage("image_small", bi);
		
		bi = si.loadImage("szeroki.jpg");
		bi = si.scale(bi, 300, 300);
		si.saveImage("szeroki_new", bi);

		bi = si.loadImage("wysoki.jpg");
		bi = si.scale(bi, 300, 300);
		si.saveImage("wysoki_new", bi);
	}
}
