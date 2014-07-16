package lacool.common.util;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Iterator;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpServletRequest;

import lacool.common.vo.FileVo;
import lacool.member.vo.UserVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.web.util.WebUtils;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtil {

	public static FileVo saveFile(HttpServletRequest request, String imageFile, String rootDir) throws Exception{
		UserVo userVo = (UserVo)WebUtils.getRequiredSessionAttribute(request, "userVo");
		
		String path = rootDir + userVo.getUserId() + "/";
		String dir = WebUtils.getRealPath(request.getServletContext(), "/") + path;
		File f = new File(dir);
		if(!f.exists()){
			f.mkdir();
		}
		
		String image = imageFile;
		String ext = null;
		String ext2 = null;
		if(image.startsWith("data:image/jpeg")){
			ext = ".jpg";
			ext2 = "jpeg";
		}else if(image.startsWith("data:image/png")){
			ext = ".png";
			ext2 = "png";
		}else if(image.startsWith("data:image/gif")){
			ext = ".gif";
			ext2 = "gif";
		}
		//String name = userVo.getUserId() + "_" + System.currentTimeMillis() + ext;
		String name = randomString(userVo.getUserId()+ext);
    	image = image.replace("data:image/"+ext2+";base64,", "").replaceAll(" ", "+");

    	byte[] imageByte = org.apache.commons.net.util.Base64.decodeBase64(image.getBytes());
    	FileOutputStream fs = new FileOutputStream(new File(dir + name));
    	fs.write(imageByte);
    	fs.close();
    	fs.flush();		
    	
    	return new FileVo(path, name);
	}
	
	
	public static JSONArray upload(HttpServletRequest request, String SAVE_DIR,
			String WEB_DIR, String CONTEXT_PATH, int maxFileSize)
			throws IOException, Exception {

		String filename = "";
		String encType = "utf-8";// 인코딩 타입
		int maxSize = maxFileSize * 1024 * 1024;// 최대 업로드 될 파일크기 1Mb
		String saveFileId = "";
		String saveFileName = "";
		String original = "";
		String size = "";

		MultipartRequest multi = new MultipartRequest(request, SAVE_DIR,
				maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();

		JSONArray jsonArr = new JSONArray();

		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			boolean isOk = true;
			while (isOk) {
				saveFileName = randomString("");

				filename = multi.getFilesystemName(name);

				if (filename != null) {
					int idx = filename.lastIndexOf('.');
					if (idx != -1) {
						String extension = filename.substring(idx)
								.toLowerCase();

//						if (!portalxpert.common.utils.CommUtil
//								.uploadExtensionsCheck(extension,
//										multi.getFile(name))) {
//							throw new Exception("Invalid upload file");
//						}

						saveFileName = saveFileName + extension;
					}

					File tmpFile = new File(SAVE_DIR + "/" + saveFileName);
					if (tmpFile.exists()) // 중복된 파일이 존재하면 다시 생성.
					{
						tmpFile = null;
						continue;
					}

					original = multi.getOriginalFileName(name);
					File file = multi.getFile(name);
					size = "" + file.length();
					if (file.exists()) {
						File newFile = new File(SAVE_DIR + saveFileName);
						file.renameTo(newFile);
						newFile = null;
					}
				}
				isOk = false;

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("original", original);
				jsonObject.put("saveFileName", saveFileName);
				saveFileId = saveFileName.substring(0,
						saveFileName.lastIndexOf('.'));
				jsonObject.put("saveFileId", saveFileId);
				jsonObject.put("saveFileSize", size);
				// jsonObject.put("saveDir", SAVE_DIR);
				jsonObject.put("saveDir", "");
				jsonObject.put("webDir", CONTEXT_PATH + WEB_DIR);

				jsonArr.add(jsonObject);
			}
		}
		return jsonArr;
	}	
	
	
	
	public void changeImageQuality(){
		try{
	        File imageFile = new File("C:\\Work\\Temp\\Desert.jpg");
	        File compressedImageFile = new File("C:\\Work\\Temp\\compressed_file.jpg");
	 
	        InputStream inputStream = new FileInputStream(imageFile);
	        OutputStream outputStream = new FileOutputStream(compressedImageFile);
	 
	        float imageQuality = 0.5f;
	 
	        //Create the buffered image
	        BufferedImage bufferedImage = ImageIO.read(inputStream);
	 
	        //Get image writers
	        Iterator<ImageWriter> imageWriters = ImageIO.getImageWritersByFormatName("jpg");
	 
	        if (!imageWriters.hasNext())
	            throw new IllegalStateException("Writers Not Found!!");
	 
	        ImageWriter imageWriter = (ImageWriter) imageWriters.next();
	        ImageOutputStream imageOutputStream = ImageIO.createImageOutputStream(outputStream);
	        imageWriter.setOutput(imageOutputStream);
	 
	        ImageWriteParam imageWriteParam = imageWriter.getDefaultWriteParam();
	 
	        //Set the compress quality metrics
	        imageWriteParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
	        imageWriteParam.setCompressionQuality(imageQuality);
	 
	        //Created image
	        imageWriter.write(null, new IIOImage(bufferedImage, null, null), imageWriteParam);
	 
	        // close all streams
	        inputStream.close();
	        outputStream.close();
	        imageOutputStream.close();
	        imageWriter.dispose();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void resizeImage(int IMG_WIDTH, int IMG_HEIGHT){
		try{
			File file = new File("C:\\Work\\Temp\\Desert.jpg");
			
			//FileCopyUtils.copy(file, newFile);
			BufferedImage originalImage = ImageIO.read(file);
			int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
			
			BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
			Graphics2D g = resizedImage.createGraphics();
			g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
			g.dispose();
			
			ImageIO.write(resizedImage, "jpg", new File("C:\\Work\\Temp\\Desert2.jpg")); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static String randomString(String fileName){
		StringBuilder saveFileName = new StringBuilder();
		for (int i=0; i < 10; i++) { //10자리수
		    int rnd = 1 + (int)(Math.random() * 52);
		    rnd = (rnd > 26) ? rnd + 70 : rnd + 64;
		    saveFileName.append((char)(rnd));
		}
		String ext = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
		return saveFileName.append("_").append(System.currentTimeMillis()).append(ext).toString();
	}
	
	public static void main(String[] args) {
		FileUtil.resizeImage(100, 100);
	}
}
