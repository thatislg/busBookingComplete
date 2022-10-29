package vn.com.vti.bus.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.RouteExample;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeList")
public class RouteListController {
	
	@Autowired
	private RouteMapper routeMapper;
	
	@RequestMapping("/index")
	public String index(Model model) {
		
		RouteExample routeExample = new RouteExample();
		routeExample.setOrderByClause("route_Id");
		List<Route> routeList = routeMapper.selectByExample(routeExample);

		model.addAttribute("routeList", routeList);
		
		return "route/routeList";
	}
	
}
