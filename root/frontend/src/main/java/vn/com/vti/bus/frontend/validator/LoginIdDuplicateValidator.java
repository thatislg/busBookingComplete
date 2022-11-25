package vn.com.vti.bus.frontend.validator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.MemberExample;
import vn.com.vti.bus.frontend.form.MemberForm;
import vn.com.vti.bus.mapper.MemberMapper;


@Component
public class LoginIdDuplicateValidator implements Validator{
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}
	@Override
	public void validate(Object target, Errors errors) {
		if(!(target instanceof MemberForm)) {
			return;
		}
		MemberForm memberForm = (MemberForm)target;

		MemberExample memberExample = new MemberExample();
		memberExample.createCriteria().andLoginIdEqualTo(memberForm.getLoginId());
			

		List<Member> memberList = memberMapper.selectByExample(memberExample);
		if(!memberList.isEmpty()) {
			errors.rejectValue("loginId", "error.alreadyExist");
		}

	}
}
