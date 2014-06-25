package lacool.contents.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lacool.contents.sc.ContentsService;
import lacool.contents.vo.NotiInfoVo;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("contents")
public class ContentsController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ContentsService contentsService;
	
	@RequestMapping(value="/history")
	public String createAdminBbsView(
			ModelMap modelMap,
			@RequestParam(value="boardId",required = false) String boardId,
			HttpSession session
			)throws Exception {
		
		return "/contents/history";
	}
	
	@RequestMapping(value="/creation")
	public String creationContents(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		UserVo userVo = (UserVo)WebUtils.getRequiredSessionAttribute(request, "userVo");
		UserVo user = userService.getUser(userVo);
		modelMap.put("userVo", user);
		if(user.getBirthYmd() == null){
			return "member/regist_03";
		}
		return "contents/creation";
	}	
	
	@RequestMapping("/contentsReg")
	public ModelMap userRegDetail(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			ObjectMapper mapper = new ObjectMapper();
//			NotiInfoVo notiInfoVo = mapper.readValue(data, NotiInfoVo.class);
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
//			notiInfoVo.setUserId(sessionUserVo.getUserId());
			
			NotiInfoVo notiInVo = contentsService.insertNotiInfo(data, sessionUserVo);
//			if(user != null){
//				FileVo fileVo = FileUtil.saveFile(request, userVo.getImageFile(), "resources/images/photo/");
//				
//				userVo.setUserFileNm(fileVo.getName());
//				userVo.setUserFilePath(fileVo.getPath());
//				userService.updateUser(userVo);
//				modelMap.put("user", userVo);
//				
//			}else{
//				throw new LaCoolException("Not User");
//			}
		}catch(Exception e){
			modelMap.put("result", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}	
}
