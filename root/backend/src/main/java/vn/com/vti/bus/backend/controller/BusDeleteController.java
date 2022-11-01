package vn.com.vti.bus.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.RouteExample;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/busDelete")
public class BusDeleteController {
	@Autowired
	private BusMapper busMapper; 
	
	@Autowired BusListController buslistController;
	
	@Autowired
	private RouteMapper routeMapper;
	
	@RequestMapping("confirm")
	public String Confirm(@RequestParam String busId, Model model) {
		if(busId.isEmpty()) {
			return buslistController.index(model);	
			
			
		}
		Bus bus = busMapper.selectByPrimaryKey(Integer.parseInt(busId));
		model.addAttribute("busInfo", bus);
		return "bus/busDeleteConfirm";
		
	}
	@RequestMapping("delete")
	public String Delete(@RequestParam String busId, Model model) {
		
		RouteExample routeExample = new RouteExample();
		routeExample.createCriteria().andBusIdEqualTo(Integer.parseInt(busId));
		List<Route> routeList = routeMapper.selectByExample(routeExample);
		
		if(routeList==null || routeList.size()==0) {
			busMapper.deleteByPrimaryKey(Integer.parseInt(busId));
			return "redirect:/busList/index";
			
		}else {
			String errMsg = "削除できません。";
			model.addAttribute("errMsg",errMsg);
			return buslistController.index(model);	
		}
	
		
		
		 
		
		 
		
	}
	
}
