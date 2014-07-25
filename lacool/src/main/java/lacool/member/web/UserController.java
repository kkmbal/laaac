package lacool.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import lacool.common.exception.LaCoolException;
import lacool.common.util.FileUtil;
import lacool.common.vo.FileVo;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;
import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
				userService.insertUser(userVo);
				modelMap.put("user", userVo);
			}else{
				throw new LaCoolException("Email Dup");
			}
		}catch(Exception e){
			modelMap.put("error", "error");
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
			modelMap.put("error", e.toString());
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
	
	@RequestMapping(value="/registDetail")
	public String registDetail(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		UserVo userVo = (UserVo)WebUtils.getRequiredSessionAttribute(request, "userVo");
		UserVo user = userService.getUser(userVo);
		modelMap.put("userVo", user);

		return "member/regist_03";
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
				userService.updateUser(userVo);
				modelMap.put("user", userVo);
				
			}else{
				throw new LaCoolException("Not User");
			}
		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
    @RequestMapping("/bbsFileUpload") 
    @ResponseBody 
    public void bbsFileUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) throws Exception{
    	JSONArray jsonArr = FileUtil.uploadFile(request, "resources/images/photo/");   
    	
        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(response);
        response.getWriter().print(jsonArr.toString());
        response.getWriter().flush();
        response.getWriter().close();
 	}	
	
	//@RequestMapping("/userRegDetail")
	public ModelMap __userRegDetail(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			ObjectMapper mapper = new ObjectMapper();
			UserVo userVo = mapper.readValue(data, UserVo.class);
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			userVo.setUserId(sessionUserVo.getUserId());
			
			UserVo user = userService.getUser(userVo);
			if(user != null){
				FileVo fileVo = FileUtil.saveFile(request, userVo.getImageFile(), "resources/images/photo/");
				
				userVo.setUserFileNm(fileVo.getName());
				userVo.setUserFilePath(fileVo.getPath());
				userService.updateUser(userVo);
				modelMap.put("user", userVo);
				
			}else{
				throw new LaCoolException("Not User");
			}
		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	

}
