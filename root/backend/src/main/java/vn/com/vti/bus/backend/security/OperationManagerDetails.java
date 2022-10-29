package vn.com.vti.bus.backend.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import vn.com.vti.bus.entity.OperationManager;

public class OperationManagerDetails implements UserDetails{
	private static final long serialVersionUID = 1L;

	private OperationManager manager;

	private Collection<? extends GrantedAuthority> authorities;

	public OperationManagerDetails(OperationManager manager, Collection<? extends GrantedAuthority> authorities) {
		super();
		this.manager = manager;
		this.authorities = authorities;
	}

	public OperationManager getManager() {
		return manager;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return manager.getPassword();
	}

	@Override
	public String getUsername() {
		return manager.getLoginId();
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
