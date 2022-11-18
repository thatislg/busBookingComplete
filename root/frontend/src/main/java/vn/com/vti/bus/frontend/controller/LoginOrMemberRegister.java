package vn.com.vti.bus.frontend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class LoginOrMemberRegister {
	
	@RequestMapping("loginOrMemberRegister")
	public String index() {
		return "member/loginOrMemberRegister";
	}
	
}
