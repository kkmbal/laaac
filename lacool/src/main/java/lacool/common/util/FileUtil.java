package lacool.common.util;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import lacool.common.vo.FileVo;
import lacool.member.vo.UserVo;

import org.springframework.web.util.WebUtils;

public class FileUtil {

	public static FileVo saveFile(HttpServletRequest request, String imageFile) throws Exception{
		UserVo userVo = (UserVo)WebUtils.getRequiredSessionAttribute(request, "userVo");
		
		String path = "images/photo/"+userVo.getUserId()+"/";
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
		String name = userVo.getUserId() + "_" + System.currentTimeMillis() + ext;
    	image = image.replace("data:image/"+ext2+";base64,", "").replaceAll(" ", "+");

    	byte[] imageByte = org.apache.commons.net.util.Base64.decodeBase64(image.getBytes());
    	FileOutputStream fs = new FileOutputStream(new File(dir + name));
    	fs.write(imageByte);
    	fs.close();
    	fs.flush();		
    	
    	return new FileVo(path, name);
	}
}
