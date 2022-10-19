package vn.com.vti.bus.backend.security;

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

import vn.com.vti.bus.entity.Manager;
import vn.com.vti.bus.entity.ManagerExample;
import vn.com.vti.bus.mapper.ManagerMapper;

@Configuration
public class ManagerAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider{
	@Autowired
	private ManagerMapper managerMapper;

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
			throw new BadCredentialsException("ログインIDを入力してください。");
		}

		ManagerExample managerExample = new ManagerExample();
		managerExample.createCriteria().andLoginIdEqualTo(username);

		List<Manager> managers = managerMapper.selectByExample(managerExample);
		if(managers.isEmpty()) {
			throw new BadCredentialsException("ログインIDまたはパスワードに誤りがあります。");
		}
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority("ROLE_MANAGER"));

		return new ManagerDetails(managers.get(0), authorities);
	}
}
