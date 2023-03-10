package vn.com.vti.bus.frontend.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.frontend.form.MemberForm;
import vn.com.vti.bus.frontend.validator.LoginIdDuplicateValidator;
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
	
	@Autowired 
	private LoginIdDuplicateValidator loginIdDuplicateValidator;
	
	@InitBinder
	public void validatorBinder(WebDataBinder binder) {
		binder.addValidators(loginIdDuplicateValidator);
	}
	
	
	@RequestMapping("input")
	public String input(MemberForm memberForm) {
		return "member/memberRegisterInput";
	}

	@RequestMapping("confirm")
	public String confirm(@Valid MemberForm memberForm, BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()) {
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
