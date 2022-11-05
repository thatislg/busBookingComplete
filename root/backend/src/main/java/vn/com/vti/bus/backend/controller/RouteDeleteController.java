package vn.com.vti.bus.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.RouteCustom;
import vn.com.vti.bus.mapper.RouteCustomMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeDelete")
public class RouteDeleteController {
	@Autowired 
	private RouteMapper routeMapper;
	
	@Autowired
	private RouteCustomMapper routeCustomMapper;
	
	@Autowired RouteListController routeListController;
	
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
		
		return "route/routeDeleteConfirm";
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam String routeId, Model model, RedirectAttributes redirectAttributes) {
		
		routeMapper.deleteByPrimaryKey(Integer.parseInt(routeId));
		
		// Thông báo hiển thị khi làm thành công.
		redirectAttributes.addFlashAttribute("message","ID(" + routeId + ")で削除しました。");
		
		return "redirect:/routeList/index";
	}
}
