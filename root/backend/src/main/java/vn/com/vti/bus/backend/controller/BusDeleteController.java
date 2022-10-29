package vn.com.vti.bus.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.mapper.BusMapper;

@Controller
@RequestMapping("/busDelete")
public class BusDeleteController {
	@Autowired
	private BusMapper busMapper; 
	
	@Autowired BusListController buslistController;
	
	@RequestMapping("confirm")
	public String Confirm(@RequestParam String busId, Model model) {
		if(busId.isEmpty()) {
			buslistController.index(model);
			return "";
			
		}
		Bus bus = busMapper.selectByPrimaryKey(Integer.parseInt(busId));
		model.addAttribute("busInfo", bus);
		return "bus/busDeleteConfirm";
		
	}
	@RequestMapping("delete")
	public String Delete(@RequestParam String busId) {
		busMapper.deleteByPrimaryKey(Integer.parseInt(busId));
		 return "redirect:/busList/index";
	}
	
}
