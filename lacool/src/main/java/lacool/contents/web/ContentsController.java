package lacool.contents.web;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import lacool.common.util.FileUtil;
import lacool.contents.sc.ContentsService;
import lacool.contents.vo.NotiInfoVo;
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
	
    @RequestMapping("/bbsFileUpload") 
    @ResponseBody 
    public void bbsFileUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) throws Exception{
 	  /*
		String SAVE_DIR = "C:/Work/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/lacool/resources/images/temp/";
		String WEB_DIR = "C:/Work/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/lacool/resources/images/upload/";
		String CONTEXT_PATH = request.getContextPath(); // /lacool
		int maxFileSize = 3;
		   
		JSONArray jsonArr = FileUtil.upload(request, SAVE_DIR, WEB_DIR, CONTEXT_PATH, maxFileSize);
			
		HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(response);
    	//wrapper.setContentType("text/plain");
		response.getWriter().print(jsonArr.toString());
		response.getWriter().flush();
		response.getWriter().close();
	  */
    	JSONArray jsonArr = new JSONArray();
    	
    	String path = "C:/Work/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/lacool/resources/images/upload/";
    	
        if (ServletFileUpload.isMultipartContent(request))
        {
        	FileItemFactory factory = new DiskFileItemFactory();
        	ServletFileUpload fileUpload = new ServletFileUpload(factory);
            fileUpload.setSizeMax(1024*1024*500);
            List fileItemList = fileUpload.parseRequest(request);
            
            System.out.println("file cnt:"+fileItemList.size());
            for (int i = 0; i < fileItemList.size(); i++){
            	FileItem fileItem = (FileItem)fileItemList.get(i);
            	//File tmpFile = new File(path + System.currentTimeMillis()+ "_" + fileItem.getName());
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
        }else{
        	/*
        	//IE10+, FF3.6+, Chrome6.0+, Safari6.0+, Opera11.1+ 
        	String image = request.getParameter("image");
        	image = image.replace("data:image/jpeg;base64,", "").replaceAll(" ", "+");
        	//System.out.println(image);
        	byte[] imageByte = org.apache.commons.net.util.Base64.decodeBase64(image.getBytes());
        	FileOutputStream fs = new FileOutputStream(new File(path + System.currentTimeMillis() + "_test.jpg"));
        	fs.write(imageByte);
        	fs.close();
        	fs.flush();
        	*/
        }    	
        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(response);
        response.getWriter().print(jsonArr.toString());
        response.getWriter().flush();
        response.getWriter().close();
 	}	
}
