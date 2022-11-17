package vn.com.vti.bus.mapper;

import java.util.List;

import vn.com.vti.bus.entity.RouteCustom;

public interface RouteCustomMapper {
	// Lấy thông tin điểm dừng theo departureID, arrivalID của ROUTE
	public List<RouteCustom> selectById();

	// Lấy thông tin điểm dừng theo ROUTE_ID
	public RouteCustom selectByIdForDeleteConfirm(int parseInt);
	
}

