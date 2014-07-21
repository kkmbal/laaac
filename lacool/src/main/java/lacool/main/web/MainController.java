package lacool.main.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lacool.contents.vo.NotiOpnVo;
import lacool.main.sc.MainService;
import lacool.main.vo.MainVo;
import lacool.member.vo.UserVo;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	private Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private MainService mainService;
	
    @RequestMapping(value="/main")
    public String mainFrame(HttpServletRequest request, HttpSession session, ModelMap modelMap) throws Exception {
    	MainVo mainVo = new MainVo();
    	// 최신
    	MainVo recentNotiInfo = mainService.getRecentNotiInfo(mainVo);
    	// 핫이슈
    	List<MainVo> listHotIssueNotiInfo = mainService.listHotIssueNotiInfo(mainVo);
    	List<MainVo> hotIssue1 = new ArrayList<MainVo>(); // 첫3건
    	List<MainVo> hotIssue2 = new ArrayList<MainVo>(); // 후3건
    	for(int i=0;i<listHotIssueNotiInfo.size();i++){
    		if(i > 2) break;
    		hotIssue1.add(listHotIssueNotiInfo.get(i));
    	}
    	for(int i=3;i<listHotIssueNotiInfo.size();i++){
    		hotIssue2.add(listHotIssueNotiInfo.get(i));
    	}
    	
    	// 이건어때요
    	List<MainVo> listNotiEvalOkInfo = mainService.listNotiEvalOkInfo(mainVo);
    	
    	modelMap.put("recentNotiInfo", recentNotiInfo);
    	modelMap.put("hotIssue1", hotIssue1);
    	modelMap.put("hotIssue2", hotIssue2);
    	modelMap.put("listNotiEvalOkInfo", listNotiEvalOkInfo);
    	
    	return "/main";
    }
    
	@RequestMapping(value="/main/listNotiEval")
	public ModelMap listNotiEval(HttpServletRequest request, HttpSession session, ModelMap modelMap, String data){
		
		JSONObject notiObject = JSONObject.fromObject(data);
		
		MainVo mainVo = new MainVo();
		mainVo.setCateId(notiObject.getString("cateId"));
		List<MainVo> listNotiEvalOkOfCate = mainService.listNotiEvalOkOfCate(mainVo);
		List<MainVo> listNotiEvalNgOfCate = mainService.listNotiEvalNgOfCate(mainVo);
		
		
		modelMap.put("listNotiEvalOkOfCate", listNotiEvalOkOfCate);
		modelMap.put("listNotiEvalNgOfCate", listNotiEvalNgOfCate);
		
		return modelMap;
	}    
}
