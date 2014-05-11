package lacool.contents.web;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("contents")
public class ContentsController {

	@RequestMapping(value="/history")
	public String createAdminBbsView(
			ModelMap modelMap,
			@RequestParam(value="boardId",required = false) String boardId,
			HttpSession session
			)throws Exception {
		
		return "/contents/history";
	}
}
