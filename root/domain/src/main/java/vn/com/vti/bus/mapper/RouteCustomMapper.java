package vn.com.vti.bus.mapper;

import java.util.List;

import vn.com.vti.bus.entity.RouteCustom;

public interface RouteCustomMapper {
	public List<RouteCustom> selectById(Integer Id);
}
