package vn.com.vti.bus.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.MemberExample;
import vn.com.vti.bus.mapper.MemberMapper;

@Controller
@RequestMapping("/memberList")

public class MemberListController{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/index")
	public String index(Model model) {
		MemberExample memberExample = new MemberExample();
		memberExample.setOrderByClause("member_Id");
		List<Member> memberList = memberMapper.selectByExample(memberExample);
		model.addAttribute("memberList", memberList);
		return "member/memberList";
		
	}
	
	
}

