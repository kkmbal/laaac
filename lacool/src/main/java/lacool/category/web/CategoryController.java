package lacool.category.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lacool.category.sc.CategoryService;
import lacool.category.vo.CategoryVo;
import lacool.common.util.BeanUtil;
import lacool.member.sc.UserService;
import lacool.member.vo.UserVo;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("category")
public class CategoryController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/ask_category")
	public String askCategory(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		UserVo userVo = (UserVo)WebUtils.getRequiredSessionAttribute(request, "userVo");
		UserVo user = userService.getUser(userVo);
		modelMap.put("userVo", user);
		if(user.getBirthYmd() == null){
			return "member/regist_03";
		}
		
		return "category/ask_category";
	}
	
	@RequestMapping("/listMainCategory")
	public ModelMap listMainCategory(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			CategoryVo vo = new CategoryVo();
			vo.setUpCateId("ROOT");
			List<CategoryVo> listCategory = categoryService.listCategory(vo);
			modelMap.put("listCategoryVo", listCategory);
		}catch(Exception e){
			modelMap.put("result", "category create error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
	@RequestMapping("/listSubCategory")
	public ModelMap listSubCategory(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			//ObjectMapper mapper = new ObjectMapper();
			//CategoryVo categoryVo = mapper.readValue(data, CategoryVo.class);
			CategoryVo categoryVo = BeanUtil.getData(data, CategoryVo.class);
			
			CategoryVo vo = new CategoryVo();
			vo.setUpCateId(categoryVo.getUpCateId());
			List<CategoryVo> listCategory = categoryService.listCategory(vo);
			modelMap.put("listCategoryVo", listCategory);
		}catch(Exception e){
			modelMap.put("result", "category create error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
	@RequestMapping("/regMainCategory")
	public ModelMap createMainCategory(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			//ObjectMapper mapper = new ObjectMapper();
			//CategoryVo categoryVo = mapper.readValue(data, CategoryVo.class);
			CategoryVo categoryVo = BeanUtil.getData(data, CategoryVo.class);
			
			UserVo userVo = (UserVo)session.getAttribute("userVo");
			categoryVo.setRegId(userVo.getUserId());
			categoryVo.setUpdId(userVo.getUserId());
			categoryVo.setUpCateId("ROOT");
			categoryVo.setDelYn("Z");
			categoryVo.setCateOrdNo("0");
			categoryService.insertMainCategory(categoryVo);

		}catch(Exception e){
			modelMap.put("result", "category create error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
	
	@RequestMapping("/regSubCategory")
	public ModelMap createSubCategory(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		try{
			ObjectMapper mapper = new ObjectMapper();
			CategoryVo categoryVo = mapper.readValue(data, CategoryVo.class);
			UserVo userVo = (UserVo)session.getAttribute("userVo");
			categoryVo.setRegId(userVo.getUserId());
			categoryVo.setUpdId(userVo.getUserId());
			categoryVo.setDelYn("Z");
			categoryVo.setCateOrdNo("0");
			categoryService.insertSubCategory(categoryVo);
			
		}catch(Exception e){
			modelMap.put("result", "category create error");
			log.error(e.toString(), e);
		}
		return modelMap;
	}
}
