package lacool.customer.web;

import java.io.File;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import lacool.common.tags.page.PageInfo;
import lacool.common.util.BeanUtil;
import lacool.common.util.FileDownloadUtil;
import lacool.common.util.FileUtil;
import lacool.contents.vo.NotiApndFileVo;
import lacool.customer.sc.CustomerService;
import lacool.customer.vo.CustomerVo;
import lacool.member.vo.UserVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("customer")
public class CustomerController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value="/list")
	public String list(HttpServletRequest request, ModelMap modelMap
			, @RequestParam(value="currPage", required=false, defaultValue="1") String currPage
			, @RequestParam(value="searchKeyword", required=false) String searchKeyword
			, @RequestParam(value="searchValue", required=false) String searchValue	){
		
		UserVo userVo = (UserVo)WebUtils.getSessionAttribute(request, "userVo");
		if(userVo == null){
			userVo = new UserVo();
		}
		
		CustomerVo customerVo = new CustomerVo();
		customerVo.setBoardId("BBS001");
		
		// 페이징 정보
		PageInfo pageInfo = (PageInfo)customerVo;
		pageInfo.setCurrPage(Integer.parseInt(currPage));
		pageInfo.setPageSize(10);
		pageInfo.setListSize(10);
		pageInfo.setSearchValue(searchValue);
		pageInfo.setSearchKeyword(searchKeyword);

		List<CustomerVo> list = customerService.list(customerVo);
		int totalCnt = customerService.listCnt(customerVo);
		pageInfo.setRowCount(totalCnt);

		modelMap.put("list", list);
		modelMap.put("userVo", userVo);
		modelMap.put("pageInfo", pageInfo);
		modelMap.put("searchKeyword", searchKeyword);
		modelMap.put("searchValue", searchValue);
		
		return "customer/customer_list";
	}
	
	@RequestMapping(value="/read")
	public String read(HttpServletRequest request, ModelMap modelMap
			, @RequestParam(value="notiId", required=true) String notiId
			, @RequestParam(value="notiSeq", required=true) String notiSeq
			, @RequestParam(value="currPage", required=false, defaultValue="1") String currPage	){
		
		UserVo userVo = (UserVo)WebUtils.getSessionAttribute(request, "userVo");
		if(userVo == null){
			userVo = new UserVo();
		}
		
		CustomerVo vo = new CustomerVo();
		vo.setNotiId(notiId);
		vo.setNotiSeq(notiSeq);
		vo.setBoardId("BBS001");

		CustomerVo customerVo = customerService.read(vo);
		if(customerVo != null && customerVo.getApndFileNm() != null){
			long sz = Long.parseLong(customerVo.getApndFileSz())/1024L;
			customerVo.setApndFileSz(String.valueOf(sz));
		}
		CustomerVo prevCustomerVo = customerService.readPrev(vo);
		CustomerVo nextCustomerVo = customerService.readNext(vo);

		modelMap.put("customerVo", customerVo);
		modelMap.put("prevCustomerVo", prevCustomerVo);
		modelMap.put("nextCustomerVo", nextCustomerVo);
		modelMap.put("currPage", currPage);
		
		return "customer/customer_read";
	}
	
	@RequestMapping(value="/write")
	public String write(HttpServletRequest request, ModelMap modelMap
			, @RequestParam(value="notiId", required=false) String notiId
			, @RequestParam(value="notiSeq", required=false) String notiSeq
			, @RequestParam(value="currPage", required=false, defaultValue="1") String currPage	){
		
		UserVo userVo = (UserVo)WebUtils.getSessionAttribute(request, "userVo");
		
		CustomerVo vo = new CustomerVo();
		vo.setNotiId(notiId);
		vo.setBoardId("BBS001");

		CustomerVo customerVo = customerService.read(vo);
		if(customerVo != null){
			modelMap.put("customerVo", customerVo);
			modelMap.put("notiId", customerVo.getNotiId());
			if(customerVo.getApndFileNm() != null){
				long sz = Long.parseLong(customerVo.getApndFileSz())/1024L;
				customerVo.setApndFileSz(String.valueOf(sz));
			}
		}

		modelMap.put("currPage", currPage);
		
		return "customer/customer_write";
	}
	
	@RequestMapping("/insert")
	public ModelMap insert(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			CustomerVo customerVo = BeanUtil.getData(data, CustomerVo.class);
			customerVo.setUserId(sessionUserVo.getUserId());
			customerVo.setUserNm(sessionUserVo.getUserNm());
			customerVo.setRegId(sessionUserVo.getUserId());
			customerVo.setUpdId(sessionUserVo.getUserId());
			customerVo.setBoardId("BBS001");
			
			customerService.insert(customerVo);

		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
	@RequestMapping(value="/delete")
	public String delete(HttpServletRequest request, ModelMap modelMap
			, @RequestParam(value="notiId", required=true) String notiId){
		
		UserVo userVo = (UserVo)WebUtils.getSessionAttribute(request, "userVo");
		
		CustomerVo vo = new CustomerVo();
		vo.setNotiId(notiId);
		vo.setRegId(userVo.getUserId());
		vo.setBoardId("BBS001");

		customerService.delete(vo);
		
		return list(request, modelMap, "1", null, null);
	}
	
	
    @RequestMapping("/bbsFileUpload") 
    @ResponseBody 
    public void bbsFileUpload(HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session) throws Exception{
    	JSONArray jsonArr = FileUtil.uploadFile(request, "resources/images/upload/customer/");   
    	
        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(response);
        response.getWriter().print(jsonArr.toString());
        response.getWriter().flush();
        response.getWriter().close();
 	}
    
    /**
     * 첨부파일 다운로드
     * @param data, modelMap, request, response, session
     * @return void
     * @exception Exception
     * @auther crossent 
     */
    @RequestMapping(value = "/bbsFileDownload", method = RequestMethod.GET)
    public void bbsFileDownload(
    		@RequestParam(value="data" ,required = true) String data,
 			ModelMap 		modelMap,
 			HttpServletRequest request, 
 			HttpServletResponse response,
 			HttpSession session
 			
    ) throws Exception {

   	 	//data = URLDecoder.decode(new String(data.getBytes("ISO-8859-1")), "UTF-8");
    	data = URLDecoder.decode(data, "UTF-8");

   	 	JSONObject jsonObject = JSONObject.fromObject(data);
   	 	String notiId = jsonObject.getString("notiId");
		//String apndFileOrgn = jsonObject.getString("apndFileOrgn");
		String apndFileName = jsonObject.getString("apndFileName");
		String apndFileSeq =  jsonObject.getString("apndFileSeq");

 		try{	
 			NotiApndFileVo vo = new NotiApndFileVo();
 			vo.setNotiId(notiId);
 			vo.setApndFileSeq(apndFileSeq);
 			NotiApndFileVo notiApndFileVo = customerService.getNotiApndFile(vo);
 			String apndFilePath = WebUtils.getRealPath(request.getServletContext(), "/") + notiApndFileVo.getApndFilePath();
 			
 			File file = new File(apndFilePath+'/'+ apndFileName.replace("..\\","").replace("../",""));
 			
			FileDownloadUtil.download(request, response, file, notiApndFileVo.getApndFileOrgn());
			
 		}catch(Exception e){
 			e.printStackTrace();
 		}

 	}
    
}
