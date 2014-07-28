package lacool.customer.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import lacool.common.tags.page.PageInfo;
import lacool.common.util.BeanUtil;
import lacool.common.util.FileUtil;
import lacool.customer.sc.CustomerService;
import lacool.customer.vo.CustomerVo;
import lacool.member.vo.UserVo;
import lacool.personal.vo.PsnOpnVo;
import net.sf.json.JSONArray;

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
@RequestMapping("customer")
public class CustomerController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value="/list")
	public String list(HttpServletRequest request, ModelMap modelMap
			, @RequestParam(value="currPage", required=false, defaultValue="1") String currPage
			, @RequestParam(value="searchKeyword", required=false, defaultValue="1") String searchKeyword
			, @RequestParam(value="searchValue", required=false, defaultValue="1") String searchValue	){
		
		UserVo userVo = (UserVo)WebUtils.getSessionAttribute(request, "userVo");
		if(userVo == null){
			userVo = new UserVo();
		}
		
		CustomerVo customerVo = new CustomerVo();
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
	
	
	@RequestMapping("/insert")
	public ModelMap insert(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			UserVo sessionUserVo = (UserVo)session.getAttribute("userVo");
			CustomerVo customerVo = BeanUtil.getData(data, CustomerVo.class);
			customerVo.setUserId(sessionUserVo.getUserId());
			customerVo.setUserNm(sessionUserVo.getUserNm());
			customerVo.setRegId(sessionUserVo.getUserId());
			customerVo.setUpdId(sessionUserVo.getUserId());
			
			customerService.insert(customerVo);

		}catch(Exception e){
			modelMap.put("error", "error");
			log.error(e.toString(), e);
		}
		return modelMap;
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
}
