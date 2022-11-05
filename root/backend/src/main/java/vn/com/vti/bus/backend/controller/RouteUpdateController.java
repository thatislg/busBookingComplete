/**
 * 
 */
package vn.com.vti.bus.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.backend.form.RouteForm;
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
	
	
	private Route route;
	
	private RouteCustom routeCustom;
	
	@ModelAttribute
	public RouteForm createForm() {
		return new RouteForm();
	}
	
	@RequestMapping("input")
	public String input(@RequestParam String routeId, Model model) {
		if(routeId.isEmpty()) {
			routeListController.index(model);
			return "";
			
		}

		// Sử dụng để in ra màn hình các thông tin về Route
		route = routeMapper.selectByPrimaryKey(Integer.parseInt(routeId));
		model.addAttribute("routeInfo", route);
		
		// Bổ xung in thông tin vị trí bus_station cho Route
		routeCustom = routeCustomMapper.selectByIdForDeleteConfirm(Integer.parseInt(routeId));
		model.addAttribute("routeInfo1", routeCustom);
		
		return "route/routeUpdateInput";
	}
	
	@RequestMapping("confirm")
	public String confirm(@RequestParam String routeId, RouteForm routeForm, Model model) {
		
		route.setDepartureId(routeForm.getDepartureId());
		route.setArrivalId(routeForm.getArrivalId());
		route.setPrice(routeForm.getPrice());
		route.setBusId(routeForm.getBusId());
		route.setOperationStartDate(routeForm.getOperationStartDate());
		route.setOperationEndDate(routeForm.getOperationEndDate());
		route.setScheduledDepartureTime(routeForm.getScheduledDepartureTime());
		route.setScheduledArrivalTime(routeForm.getScheduledArrivalTime());
		
		model.addAttribute("routeInfo", route);
		
		model.addAttribute("routeInfo1", routeCustom);
		
		return "route/routeUpdateConfirm";
	}
	
	@RequestMapping("update")
	public String update(@RequestParam String routeId, Model model) {
		
		routeMapper.updateByPrimaryKeySelective(route);
		
		return "redirect:/routeList/index";
	}
	
	
}
