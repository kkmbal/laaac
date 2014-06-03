package lacool.member.web;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lacool.common.exception.LaCoolException;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("member")
public class UserController {
	
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/userExist")
	public ModelMap userExist(HttpServletRequest request, ModelMap modelMap, String data){
		try{
			ObjectMapper mapper = new ObjectMapper();
			UserVo userVo = mapper.readValue(data, UserVo.class);
			
			UserVo user = userService.getUser(userVo);
			modelMap.put("user", user);
		}catch(Exception e){
			throw new LaCoolException(e);
		}
		return modelMap;
	}
	
	@RequestMapping("/userReg")
	public ModelMap userReg(HttpServletRequest request, ModelMap modelMap, String data){
		try{
			ObjectMapper mapper = new ObjectMapper();
			UserVo userVo = mapper.readValue(data, UserVo.class);
			
			UserVo user = userService.getUser(userVo);
			if(user == null){
				userService.registerUser(userVo);
				modelMap.put("user", userVo);
			}else{
				throw new LaCoolException("Email Dup");
			}
		}catch(Exception e){
			modelMap.put("result", "error");
			log.error(e);
			//throw new LaCoolException(e);
		}
		return modelMap;
	}
	
	@RequestMapping("/doLogin")
	public ModelMap userLogin(HttpServletRequest request, HttpSession session,ModelMap modelMap, String data){
		try{
			ObjectMapper mapper = new ObjectMapper();
			UserVo userVo = mapper.readValue(data, UserVo.class);
			
			UserVo user = userService.getUser(userVo);
			if(user != null){
				session.setAttribute("userVo", user);
			}else{
				throw new LaCoolException("not user");
			}
		}catch(Exception e){
			modelMap.put("result", e.toString());
			log.error(e);
			//throw new LaCoolException(e);
		}
		return modelMap;
	}
	
	@RequestMapping("/userRegDetail")
	public ModelMap userRegDetail(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			ObjectMapper mapper = new ObjectMapper();
			UserVo userVo = mapper.readValue(data, UserVo.class);
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			userVo.setUserId(sessionUserVo.getUserId());
			
			UserVo user = userService.getUser(userVo);
			if(user != null){
				String path = "images/photo/"+sessionUserVo.getUserId()+"/";
				String dir = WebUtils.getRealPath(request.getServletContext(), "/") + path;
				File f = new File(dir);
				if(!f.exists()){
					f.mkdir();
				}
				String name = sessionUserVo.getUserId() + "_" + System.currentTimeMillis() + ".jpg";
				String image = userVo.getImageFile();
				
		    	image = image.replace("data:image/jpeg;base64,", "").replaceAll(" ", "+");
		    	log.debug(image);

		    	byte[] imageByte = org.apache.commons.net.util.Base64.decodeBase64(image.getBytes());
		    	FileOutputStream fs = new FileOutputStream(new File(dir + name));
		    	fs.write(imageByte);
		    	fs.close();
		    	fs.flush();
				
				
				userVo.setUserFileNm(name);
				userVo.setUserFilePath(path);
				userService.updateUser(userVo);
				modelMap.put("user", userVo);
				
			}else{
				throw new LaCoolException("Not User");
			}
		}catch(Exception e){
			modelMap.put("result", "error");
			log.error(e);
		}
		return modelMap;
	}
}
