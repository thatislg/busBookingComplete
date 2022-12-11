package vn.com.vti.bus.backend.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.Reserve;
import vn.com.vti.bus.entity.ReserveExample;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.RouteCustom;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.ReserveMapper;
import vn.com.vti.bus.mapper.RouteCustomMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeDelete")
public class RouteDeleteController {
	@Autowired 
	private RouteMapper routeMapper;
	
	@Autowired
	private RouteCustomMapper routeCustomMapper;
	
	@Autowired
	private ReserveMapper reserveMapper;
	
	@Autowired RouteListController routeListController;
	
	@Autowired
	
	private BusMapper busMapper;
	
	@RequestMapping("confirm")
	public String confirm(@RequestParam String routeId, Model model, RedirectAttributes redirectAttributes) {
		if(routeId.isEmpty()) {
			routeListController.index(model);
			return "";
			
		}
		
		//Check dieu kien de xoa tuyen duong
		Date date = new Date();
		ReserveExample reserveExample = new ReserveExample();
		reserveExample.createCriteria().andRouteIdEqualTo(Integer.parseInt(routeId)).andDepartureDateGreaterThan(date);
		List<Reserve> reserveList = reserveMapper.selectByExample(reserveExample);
		
		if(reserveList.size()>0) {
			redirectAttributes.addFlashAttribute("message","予約されたため、路線ID(" + routeId + ")を削除できません。");
			return "redirect:/routeList/index";
		}
		
		
	/*
		for(Reserve reserve : reserveList) {
			if(reserve.getDepartureDate().compareTo(date)>0) {
				redirectAttributes.addFlashAttribute("message","予約されたため、路線ID(" + routeId + ")を削除できません。");
				return "redirect:/routeList/index";
			}
			
		}
		*/
		// Sử dụng để in ra màn hình các thông tin về Route
		Route route = routeMapper.selectByPrimaryKey(Integer.parseInt(routeId));
		model.addAttribute("routeInfo", route);
		
		// Bổ xung in thông tin vị trí bus_station cho Route
		RouteCustom routeCustom = routeCustomMapper.selectByIdForDeleteConfirm(Integer.parseInt(routeId));
		model.addAttribute("routeInfo1", routeCustom);
		
		Bus bus = busMapper.selectByPrimaryKey(route.getBusId());
		model.addAttribute("bus", bus);
		
		return "route/routeDeleteConfirm";
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam String routeId, Model model, RedirectAttributes redirectAttributes) {
		
		routeMapper.deleteByPrimaryKey(Integer.parseInt(routeId));
		
		// Thông báo hiển thị khi làm thành công.
		redirectAttributes.addFlashAttribute("message","路線ID(" + routeId + ")で削除しました。");
		
		return "redirect:/routeList/index";
	}
}
