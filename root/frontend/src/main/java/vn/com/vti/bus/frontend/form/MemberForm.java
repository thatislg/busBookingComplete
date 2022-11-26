package vn.com.vti.bus.frontend.form;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class MemberForm {
	@NotBlank
	private String loginId;
	@NotBlank
	private String memberName;
	@NotBlank
	@Size(min=6)
	private String password;
	@NotBlank
	@Email
	private String mailAddress;
	@NotBlank
	@Pattern(regexp = "0\\d{1,4}\\d{1,4}\\d{4}")
	private String phoneNumber;
	@NotBlank
	private String confirmPassword;
	
	@AssertTrue(message = "{error.passwordNotSame}")
	public Boolean getPasswordSame() {
		if(password == null || confirmPassword == null) {
			return null;
		}
		return password.equals(confirmPassword);
	}
	
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMailAddress() {
		return mailAddress;
	}
	public void setMailAddress(String mailAddress) {
		this.mailAddress = mailAddress;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	

}
