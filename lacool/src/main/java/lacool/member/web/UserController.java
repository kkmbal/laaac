package lacool.member.web;

import javax.servlet.http.HttpServletRequest;

import lacool.common.exception.LaCoolException;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class UserController {
	
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
	public ModelMap userReq(HttpServletRequest request, ModelMap modelMap, String data){
		try{
			ObjectMapper mapper = new ObjectMapper();
			UserVo userVo = mapper.readValue(data, UserVo.class);
			
			//UserVo user = userService.regUser(userVo);
			//modelMap.put("user", user);
		}catch(Exception e){
			throw new LaCoolException(e);
		}
		return modelMap;
	}
}
