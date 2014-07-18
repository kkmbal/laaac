package lacool.contents.web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import lacool.category.vo.CategoryVo;
import lacool.common.util.BeanUtil;
import lacool.common.util.FileUtil;
import lacool.contents.sc.ContentsService;
import lacool.contents.vo.NotiApndFileVo;
import lacool.contents.vo.NotiEvalInfoVo;
import lacool.contents.vo.NotiInfoVo;
import lacool.contents.vo.UserScrapInfoVo;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
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
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			
			NotiInfoVo notiInVo = contentsService.insertNotiInfo(data, sessionUserVo);

			modelMap.put("notiId", notiInVo.getNotiId());
		}catch(Exception e){
			modelMap.put("result", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}	
	
	@RequestMapping(value="/getContentsDetail")
	public String getContentsDetail(HttpServletRequest request, HttpSession session, ModelMap modelMap, @RequestParam(value="notiId", required=true) String notiId){
		UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
		
		NotiInfoVo vo = new NotiInfoVo();
		vo.setNotiId(notiId);
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

		modelMap.put("scrapCnt", scrapCnt);
		modelMap.put("contents", resultVo);
		modelMap.put("fileVo", fileVo);
		modelMap.put("scrapList", scrapList);
		modelMap.put("notiEvalOfCate", notiEvalOfCate);
		
		return "contents/details";
	}	
	
	
	@RequestMapping("/insertScrap")
	public ModelMap insertScrap(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			UserScrapInfoVo userScrapInfoVo = new UserScrapInfoVo();
			userScrapInfoVo.setUserId(sessionUserVo.getUserId());
			List<UserScrapInfoVo> scrapList = contentsService.getScrapInfo(userScrapInfoVo);
			if(scrapList.size() == 0){
				contentsService.insertScrap(data, sessionUserVo);
			}
			int scrapCnt = contentsService.getScrapCnt(userScrapInfoVo);

			modelMap.put("scrapCnt", scrapCnt);
		}catch(Exception e){
			modelMap.put("result", "error");
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
			modelMap.put("result", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
    @RequestMapping("/bbsFileUpload") 
    @ResponseBody 
    public void bbsFileUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) throws Exception{
    	JSONArray jsonArr = new JSONArray();
    	
    	String path = "C:/Work/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/lacool/resources/images/upload/";
    	
        if (ServletFileUpload.isMultipartContent(request)){
        	FileItemFactory factory = new DiskFileItemFactory();
        	ServletFileUpload fileUpload = new ServletFileUpload(factory);
            fileUpload.setSizeMax(1000*1024*1024);
            List fileItemList = fileUpload.parseRequest(request);
            
            System.out.println("file cnt:"+fileItemList.size());
            for (int i = 0; i < fileItemList.size(); i++){
            	FileItem fileItem = (FileItem)fileItemList.get(i);
            	if(fileItem.getName() == null) continue;
            	String dir = path + FileUtil.randomString(fileItem.getName());
            	System.out.println("dir=="+dir);
            	File tmpFile = new File(dir);
            	fileItem.write(tmpFile);
            	
            	JSONObject jsonObject = new JSONObject();
            	jsonObject.put("apndFileNm", tmpFile.getName());
            	jsonObject.put("apndFileOrgn", fileItem.getName());
            	jsonArr.add(jsonObject);
            	
            }
        }    	
        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(response);
        response.getWriter().print(jsonArr.toString());
        response.getWriter().flush();
        response.getWriter().close();
 	}	
    
}
