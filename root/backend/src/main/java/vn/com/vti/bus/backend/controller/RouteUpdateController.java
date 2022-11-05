/**
 * 
 */
package vn.com.vti.bus.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.RouteCustom;
import vn.com.vti.bus.mapper.RouteCustomMapper;
import vn.com.vti.bus.mapper.RouteMapper;

/**
 * @author thatislg1720
 *
 */
@Controller
@RequestMapping("/routeUpdate")
public class RouteUpdateController {
	@Autowired 
	private RouteMapper routeMapper;
	
	@Autowired
	private RouteCustomMapper routeCustomMapper;
	
	@Autowired 
	private RouteListController routeListController;
	
	@RequestMapping("input")
	public String input(@RequestParam String routeId, Model model) {
		if(routeId.isEmpty()) {
			routeListController.index(model);
			return "";
			
		}
		
		// Sử dụng để in ra màn hình các thông tin về Route
		Route route = routeMapper.selectByPrimaryKey(Integer.parseInt(routeId));
		model.addAttribute("routeInfo", route);
		
		// Bổ xung in thông tin vị trí bus_station cho Route
		RouteCustom routeCustom = routeCustomMapper.selectByIdForDeleteConfirm(Integer.parseInt(routeId));
		model.addAttribute("routeInfo1", routeCustom);
		return "/route/routeUpdateInput";
	}
	
	@RequestMapping("confirm")
	public String confirm(@RequestParam String routeId, Model model) {
		if(routeId.isEmpty()) {
			routeListController.index(model);
			return "";
			
		}
		
		// Sử dụng để in ra màn hình các thông tin về Route
		Route route = routeMapper.selectByPrimaryKey(Integer.parseInt(routeId));
		model.addAttribute("routeInfo", route);
		
		// Bổ xung in thông tin vị trí bus_station cho Route
		RouteCustom routeCustom = routeCustomMapper.selectByIdForDeleteConfirm(Integer.parseInt(routeId));
		model.addAttribute("routeInfo1", routeCustom);
		
		return "route/routeUpdateConfirm";
	}
}
