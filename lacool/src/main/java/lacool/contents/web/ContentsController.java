package lacool.contents.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import lacool.common.util.BeanUtil;
import lacool.common.util.FileUtil;
import lacool.contents.sc.ContentsService;
import lacool.contents.vo.NotiApndFileVo;
import lacool.contents.vo.NotiEvalInfoVo;
import lacool.contents.vo.NotiInfoVo;
import lacool.contents.vo.NotiOpnVo;
import lacool.contents.vo.UserScrapInfoVo;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		return "contents/history";
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
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			
			NotiInfoVo notiInVo = contentsService.insertNotiInfo(data, sessionUserVo);

			modelMap.put("notiId", notiInVo.getNotiId());
		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}	
	
	@RequestMapping(value="/getContentsDetail")
	public String getContentsDetail(HttpServletRequest request, HttpSession session, ModelMap modelMap
									, @RequestParam(value="notiId", required=true) String notiId
									, @RequestParam(value="fromLimit", required=false, defaultValue="0") String fromLimit){
		UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
		
		NotiInfoVo vo = new NotiInfoVo();
		vo.setNotiId(notiId);
		vo.setRegId(sessionUserVo.getUserId());
		NotiInfoVo resultVo = contentsService.getContensDetail(vo); //상세
		List<NotiApndFileVo> fileVo = contentsService.getContentsFile(vo); //첨부파일
		if(fileVo.size() > 0){
			modelMap.put("firstFileVo", fileVo.get(0)); //첫번째첨부파일
		}
		UserScrapInfoVo userScrapInfoVo = new UserScrapInfoVo();
		userScrapInfoVo.setUserId(sessionUserVo.getUserId());
		int scrapCnt = contentsService.getScrapCnt(userScrapInfoVo); //My스크랩건수
		List<UserScrapInfoVo> scrapList = contentsService.getScrapInfo(userScrapInfoVo); //My스크랩목록
		List<NotiApndFileVo> notiEvalOfCate = contentsService.getNotiEvalOfCate(resultVo); //이건어때요목록
		
		NotiOpnVo notiOpnVo = new NotiOpnVo();
		notiOpnVo.setNotiId(notiId);
		int intFromLimit = Integer.parseInt(fromLimit);
		notiOpnVo.setFromLimit(intFromLimit);
		notiOpnVo.setToLimit(intFromLimit + 10);
		List<NotiOpnVo> listNotiOpn = contentsService.listNotiOpn(notiOpnVo); //의견

		modelMap.put("scrapCnt", scrapCnt);
		modelMap.put("contents", resultVo);
		modelMap.put("fileVo", fileVo);
		modelMap.put("scrapList", scrapList);
		modelMap.put("notiEvalOfCate", notiEvalOfCate);
		modelMap.put("listNotiOpn", listNotiOpn);
		modelMap.put("fromLimit", (intFromLimit + 10));
		modelMap.put("userVo", sessionUserVo);
		
		return "contents/details";
	}	
	
	@RequestMapping(value="/listNotiOpn")
	public ModelMap listNotiOpn(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
		
		JSONObject notiObject = JSONObject.fromObject(data);
		
		NotiOpnVo notiOpnVo = new NotiOpnVo();
		notiOpnVo.setNotiId(notiObject.getString("notiId"));
		int fromLimit = notiObject.getInt("fromLimit");
		notiOpnVo.setFromLimit(fromLimit);
		notiOpnVo.setToLimit(fromLimit + 10);
		List<NotiOpnVo> listNotiOpn = contentsService.listNotiOpn(notiOpnVo); //의견
		
		modelMap.put("listNotiOpn", listNotiOpn);
		modelMap.put("fromLimit", (fromLimit + 10));
		modelMap.put("userVo", sessionUserVo);
		
		return modelMap;
	}	
	
	
	@RequestMapping("/insertScrap")
	public ModelMap insertScrap(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			UserScrapInfoVo userScrapInfoVo = new UserScrapInfoVo();
			userScrapInfoVo.setUserId(sessionUserVo.getUserId());
			List<UserScrapInfoVo> scrapList = contentsService.getScrapInfo(userScrapInfoVo);
			
			NotiInfoVo notiInfoVo = new NotiInfoVo();
			JSONObject notiObject = JSONObject.fromObject(data);
			notiInfoVo.setNotiId(notiObject.getString("notiId"));
			notiInfoVo.setUserId(sessionUserVo.getUserId());
			NotiInfoVo contensDetail = contentsService.getContensDetail(notiInfoVo);
			
			// 스크랩하지 않았고, 내가 등록한 게시물이 아닐때, 
			if(scrapList.size() == 0 && contensDetail == null){
				contentsService.insertScrap(data, sessionUserVo);
			}
			int scrapCnt = contentsService.getScrapCnt(userScrapInfoVo);

			modelMap.put("scrapCnt", scrapCnt);
		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
	@RequestMapping("/insertEval")
	public ModelMap insertEval(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			NotiEvalInfoVo notiEvalInfoVo = BeanUtil.getData(data, NotiEvalInfoVo.class);
			notiEvalInfoVo.setUserId(sessionUserVo.getUserId());
			notiEvalInfoVo.setUserNm(sessionUserVo.getUserNm());
			notiEvalInfoVo.setRegId(sessionUserVo.getUserId());
			notiEvalInfoVo.setUpdId(sessionUserVo.getUserId());
			
			List<NotiEvalInfoVo> notiEvalList = contentsService.getNotiEvalInfo(notiEvalInfoVo);
			if(notiEvalList.size() == 0){
				contentsService.insertNotiEval(notiEvalInfoVo);
			}
		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
	@RequestMapping("/insertOpn")
	public ModelMap insertOpn(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			NotiOpnVo notiOpnVo = BeanUtil.getData(data, NotiOpnVo.class);
			notiOpnVo.setUserId(sessionUserVo.getUserId());
			notiOpnVo.setUserNm(sessionUserVo.getUserNm());
			notiOpnVo.setRegId(sessionUserVo.getUserId());
			notiOpnVo.setUpdId(sessionUserVo.getUserId());
			
			contentsService.insertOpn(notiOpnVo);

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
			NotiOpnVo notiOpnVo = BeanUtil.getData(data, NotiOpnVo.class);
			notiOpnVo.setUserId(sessionUserVo.getUserId());
			notiOpnVo.setUserNm(sessionUserVo.getUserNm());
			notiOpnVo.setRegId(sessionUserVo.getUserId());
			notiOpnVo.setUpdId(sessionUserVo.getUserId());
			
			contentsService.insertReplyOpn(notiOpnVo);
			
		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
    @RequestMapping("/bbsFileUpload") 
    @ResponseBody 
    public void bbsFileUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) throws Exception{
    	JSONArray jsonArr = FileUtil.uploadFile(request, "/resources/images/upload/");   
    	
        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(response);
        response.getWriter().print(jsonArr.toString());
        response.getWriter().flush();
        response.getWriter().close();
 	}


    
}
