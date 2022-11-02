package vn.com.vti.bus.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeDelete")
public class RouteDeleteController {
	@Autowired 
	private RouteMapper routeMapper;
	
	@Autowired RouteListController routeListController;
	
	@RequestMapping("confirm")
	public String confirm(@RequestParam String routeId, Model model) {
		if(routeId.isEmpty()) {
			routeListController.index(model);
			return "";
			
		}
		Route route = routeMapper.selectByPrimaryKey(Integer.parseInt(routeId));
		model.addAttribute("routeInfo", route);
		return "route/routeDeleteConfirm";
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam String routeId, Model model) {
		
		routeMapper.deleteByPrimaryKey(Integer.parseInt(routeId));
		 return "redirect:/routeList/index";
	}
}
