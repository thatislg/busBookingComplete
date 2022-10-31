package vn.com.vti.bus.backend.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import vn.com.vti.bus.entity.OperationManager;

public class OperationManagerDetails implements UserDetails{
	private static final long serialVersionUID = 1L;

	private OperationManager operationManager;

	private Collection<? extends GrantedAuthority> authorities;

	public OperationManagerDetails(OperationManager operationManager, Collection<? extends GrantedAuthority> authorities) {
		super();
		this.operationManager = operationManager;
		this.authorities = authorities;
	}

	public OperationManager getManager() {
		return operationManager;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return operationManager.getPassword();
	}

	@Override
	public String getUsername() {
		return operationManager.getLoginId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}
