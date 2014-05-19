package lacool.common.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebController {
	@RequestMapping("/category/**")
	public void cateogry(HttpServletRequest request) {
	}
	@RequestMapping("/contents/**")
	public void contents(HttpServletRequest request) {
	}
	@RequestMapping("/customer/**")
	public void customer(HttpServletRequest request) {
	}
	@RequestMapping("/member/**")
	public void member(HttpServletRequest request) {
	}
	@RequestMapping("/personal/**")
	public void personal(HttpServletRequest request) {
	}
}
