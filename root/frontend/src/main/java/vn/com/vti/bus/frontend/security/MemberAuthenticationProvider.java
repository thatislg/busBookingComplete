package vn.com.vti.bus.frontend.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.MemberExample;
import vn.com.vti.bus.mapper.MemberMapper;

@Configuration
public class MemberAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider{
	@Autowired
	private MemberMapper memberMapper;

	@Override
	protected void additionalAuthenticationChecks(UserDetails userDetails,
			UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
		if(!userDetails.getPassword().equals(authentication.getCredentials())) {
			throw new BadCredentialsException("ログインIDまたはパスワードに誤りがあります。");
		}
	}

	@Override
	protected UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken authentication)
			throws AuthenticationException {
		if(username == null || username.isEmpty()) {
			throw new BadCredentialsException("ログインIDをご入力ください。");
		}

		MemberExample memberExample = new MemberExample();
		memberExample.createCriteria().andLoginIdEqualTo(username);

		List<Member> members = memberMapper.selectByExample(memberExample);
		if(members.isEmpty()) {
			throw new BadCredentialsException("ログインIDまたはパスワードに誤りがあります。");
		}
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority("ROLE_MEMBER"));

		return new MemberDetails(members.get(0), authorities);
	}
}
