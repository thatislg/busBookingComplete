package vn.com.vti.bus.frontend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {
	@RequestMapping("/")
	public String index() {
		return "/homepage";
	}
}
