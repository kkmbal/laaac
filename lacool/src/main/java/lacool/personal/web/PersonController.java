package lacool.personal.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lacool.common.tags.page.PageInfo;
import lacool.common.util.BeanUtil;
import lacool.contents.vo.NotiOpnVo;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;
import lacool.personal.sc.PersonService;
import lacool.personal.vo.PersonVo;
import lacool.personal.vo.PsnOpnVo;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("personal")
public class PersonController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private PersonService personService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/home")
	public String home(HttpServletRequest request, HttpSession session, ModelMap modelMap
			, @RequestParam(value="userId", required=false) String userId
			, @RequestParam(value="currPage", required=false, defaultValue="1") String currPage
			, @RequestParam(value="fromLimit", required=false, defaultValue="0") String fromLimit
			, @RequestParam(value="order", required=false, defaultValue="REG_DTTM") String order
			, @RequestParam(value="opnFromLimit", required=false, defaultValue="0") String opnFromLimit){
		
		UserVo userVo = null;
		if(StringUtils.isEmpty(userId)){
			userVo = (UserVo)WebUtils.getRequiredSessionAttribute(request, "userVo");
			userId = userVo.getUserId();
		}else{
			UserVo getUserVo = new UserVo();
			getUserVo.setUserId(userId);
			userVo = userService.getUser(getUserVo);
		}
		
		PersonVo personVo = new PersonVo();
		personVo.setUserId(userId);
		personVo.setOrder(order);

		// 페이징 정보
		PageInfo pageInfo = (PageInfo)personVo;
		pageInfo.setCurrPage(Integer.parseInt(currPage));
		pageInfo.setPageSize(10);
		pageInfo.setListSize(8);
		pageInfo.setFromLimit((pageInfo.getCurrPage()-1)*pageInfo.getListSize());
		pageInfo.setToLimit(pageInfo.getListSize());

		List<PersonVo> listUserContents = personService.listUserContents(personVo);
		int totalCnt = personService.listUserContentsCnt(personVo);
		pageInfo.setRowCount(totalCnt);
		
		// 의견
		PsnOpnVo psnOpnVo = new PsnOpnVo();
		psnOpnVo.setUserId(userVo.getUserId());
		int intOpnFromLimit = Integer.parseInt(opnFromLimit);
		psnOpnVo.setFromLimit(intOpnFromLimit);
		psnOpnVo.setToLimit(intOpnFromLimit + 10);
		List<PsnOpnVo> listPsnOpn = personService.listPsnOpn(psnOpnVo); //의견
		
		modelMap.put("listUserContents", listUserContents);
		modelMap.put("userVo", userVo);
		modelMap.put("pageInfo", pageInfo);
		modelMap.put("order", order);
		modelMap.put("totalCnt", totalCnt);
		modelMap.put("listPsnOpn", listPsnOpn);
		modelMap.put("opnFromLimit", (intOpnFromLimit + 10));

		return "personal/personal_home";
	}
	
	
	@RequestMapping(value="/listPsnOpn")
	public ModelMap listPsnOpn(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
		
		JSONObject notiObject = JSONObject.fromObject(data);
		
		PsnOpnVo psnOpnVo = new PsnOpnVo();
		psnOpnVo.setUserId(notiObject.getString("userId"));
		int fromLimit = notiObject.getInt("opnFromLimit");
		psnOpnVo.setFromLimit(fromLimit);
		psnOpnVo.setToLimit(fromLimit + 10);
		List<PsnOpnVo> listPsnOpn = personService.listPsnOpn(psnOpnVo); //의견
		
		modelMap.put("listPsnOpn", listPsnOpn);
		modelMap.put("opnFromLimit", (fromLimit + 10));
		modelMap.put("userVo", sessionUserVo);
		
		return modelMap;
	}
	
	@RequestMapping("/insertOpn")
	public ModelMap insertOpn(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			PsnOpnVo psnOpnVo = BeanUtil.getData(data, PsnOpnVo.class);
			psnOpnVo.setUserId(sessionUserVo.getUserId());
			psnOpnVo.setRegId(sessionUserVo.getUserId());
			psnOpnVo.setUpdId(sessionUserVo.getUserId());
			
			personService.insertOpn(psnOpnVo);

		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
	@RequestMapping("/insertReplyOpn")
	public ModelMap insertReplyOpn(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			PsnOpnVo psnOpnVo = BeanUtil.getData(data, PsnOpnVo.class);
			psnOpnVo.setUserId(sessionUserVo.getUserId());
			psnOpnVo.setRegId(sessionUserVo.getUserId());
			psnOpnVo.setUpdId(sessionUserVo.getUserId());
			
			personService.insertReplyOpn(psnOpnVo);
			
		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
	
}
