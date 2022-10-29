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

import vn.com.vti.bus.entity.OperationManager;
import vn.com.vti.bus.entity.OperationManagerExample;
import vn.com.vti.bus.mapper.OperationManagerMapper;

@Configuration
public class OperationManagerAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider{
	@Autowired
	private OperationManagerMapper operationManagerMapper;

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

		OperationManagerExample operationManagerExample = new OperationManagerExample();
		operationManagerExample.createCriteria().andLoginIdEqualTo(username);

		List<OperationManager> operationManagers = operationManagerMapper.selectByExample(operationManagerExample);
		if(operationManagers.isEmpty()) {
			throw new BadCredentialsException("ログインIDまたはパスワードに誤りがあります。");
		}
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority("ROLE_MANAGER"));

		return new OperationManagerDetails(operationManagers.get(0), authorities);
	}
}
