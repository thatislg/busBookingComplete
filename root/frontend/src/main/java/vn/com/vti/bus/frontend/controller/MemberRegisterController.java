package vn.com.vti.bus.frontend.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.MemberExample;
import vn.com.vti.bus.frontend.form.MemberForm;
import vn.com.vti.bus.mapper.MemberMapper;

@Controller
@RequestMapping("/memberRegister")
public class MemberRegisterController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@ModelAttribute
	public MemberForm createFrom() {
		return new MemberForm();
	}
	
	@RequestMapping("input")
	public String input(MemberForm memberForm) {
		return "member/memberRegisterInput";
	}

	@RequestMapping("confirm")
	public String confirm(@Valid MemberForm memberForm, BindingResult bindingResult, Model model) {
		String errMsg = null;
		String errMsg2 = null;
		
		if(!memberForm.getPassword().equals(memberForm.getConfirmPassword())) {
			errMsg = "パスワードは再度確認してください";
			model.addAttribute("errMsg", errMsg);
		}
		
		MemberExample memberExample = new MemberExample();
		memberExample.createCriteria().andLoginIdEqualTo(memberForm.getLoginId());
		List<Member> memberList = memberMapper.selectByExample(memberExample);
		
		if(!(memberList.isEmpty())) {
			errMsg2 = "LoginIDが存在しました。別のIDを選択してください";
			model.addAttribute("errMsg2", errMsg2);
		}
		
		if(bindingResult.hasErrors()||(errMsg != null)||(errMsg2 != null)) {
			return input(memberForm);
		}
		
		return "member/memberRegisterConfirm";
	}
	@RequestMapping("insert")
	public String insert(MemberForm memberForm) {
		Member member = new Member();
		member.setLoginId(memberForm.getLoginId());
		member.setMailAddress(memberForm.getMailAddress());
		member.setMemberName(memberForm.getMemberName());
		member.setPassword(memberForm.getPassword());
		member.setPhoneNumber(memberForm.getPhoneNumber());
		
		memberMapper.insertSelective(member);
		
		return "member/memberRegisterComplete";
	}
}
