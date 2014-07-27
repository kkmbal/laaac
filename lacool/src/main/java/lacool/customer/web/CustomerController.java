package lacool.customer.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import lacool.common.tags.page.PageInfo;
import lacool.customer.sc.CustomerService;
import lacool.customer.vo.CustomerVo;
import lacool.member.vo.UserVo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		UserVo userVo = (UserVo)WebUtils.getRequiredSessionAttribute(request, "userVo");
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
}
