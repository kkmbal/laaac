package lacool.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lacool.common.exception.LaCoolException;
import lacool.common.util.FileUtil;
import lacool.common.vo.FileVo;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
				userService.insertUser(userVo);
				modelMap.put("user", userVo);
			}else{
				throw new LaCoolException("Email Dup");
			}
		}catch(Exception e){
			modelMap.put("result", "error");
			log.error(e.toString(), e);
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
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
	@RequestMapping("/doLogout")
	public String userLogout(HttpServletRequest request){
		try{
			request.getSession().removeAttribute("userVo");
	    	request.getSession().invalidate();
		}catch(Exception e){
			log.error(e.toString(), e);
		}
		return "redirect:/index.jsp";
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
				FileVo fileVo = FileUtil.saveFile(request, userVo.getImageFile());
				
				userVo.setUserFileNm(fileVo.getName());
				userVo.setUserFilePath(fileVo.getPath());
				userService.updateUser(userVo);
				modelMap.put("user", userVo);
				
			}else{
				throw new LaCoolException("Not User");
			}
		}catch(Exception e){
			modelMap.put("result", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	

}
