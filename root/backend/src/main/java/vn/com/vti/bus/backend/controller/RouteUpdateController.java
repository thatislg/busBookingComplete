/**
 * 
 */
package vn.com.vti.bus.backend.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusExample;
import vn.com.vti.bus.entity.BusStation;
import vn.com.vti.bus.entity.BusStationExample;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.RouteCustom;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.BusStationMapper;
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
	private RouteCustomMapper routeCustomMapper;
	
	@Autowired
	private BusStationMapper busStationMapper;
	
	@Autowired
	private BusMapper busMapper;
	
	@Autowired
	private RouteMapper routeMapper;
	
	
	@ModelAttribute
	public RouteForm createForm() {
		return new RouteForm();
	}
	
	@RequestMapping("input")
	public String input(@RequestParam Integer routeId, Model model) {
		Integer searchRouteId =routeId;
		
		
		BusStationExample busStationExample = new BusStationExample();
		BusExample busExample = new BusExample();
		
		List<BusStation> busStationList = busStationMapper.selectByExample(busStationExample);
		List<Bus> busList = busMapper.selectByExample(busExample);
		model.addAttribute("busStationList", busStationList);
		model.addAttribute("busList", busList);
		
		
		RouteCustom route = routeCustomMapper.selectRouteInfoByRouteId(searchRouteId);
		Bus bus = busMapper.selectByPrimaryKey(route.getBusId());
		String numberPlate = bus.getNumberPlate();
		
		model.addAttribute("routeInfo", route);
		model.addAttribute("busInfo", bus);
		model.addAttribute("numberPlate", numberPlate);
		
		return "route/routeUpdateInput";
	
	}
	
		
	@RequestMapping("confirm")
	public String confirm(@Valid RouteForm routeForm, BindingResult bindingResult, Model model) {
		
		if(bindingResult.hasErrors()) {
			return input(routeForm.getRouteId(),model);
		}
		
		String departureStationName = busStationMapper.selectByPrimaryKey(routeForm.getDepartureId()).getBusStationName();
		String arrivalStationName = busStationMapper.selectByPrimaryKey(routeForm.getArrivalId()).getBusStationName();
		String numberPlate = busMapper.selectByPrimaryKey(routeForm.getBusId()).getNumberPlate();
		routeForm.setDepartureStationName(departureStationName);
		routeForm.setArrivalStationName(arrivalStationName);
		routeForm.setNumberPlate(numberPlate);
		
		
		return "route/routeUpdateConfirm";
	}
	
	@RequestMapping("update")
	public String update(RouteForm routeForm, RedirectAttributes redirectAttributes) {
		
		Route route = new Route();
		route.setRouteId(routeForm.getRouteId());
		route.setDepartureId(routeForm.getDepartureId());
		route.setArrivalId(routeForm.getArrivalId());
		route.setPrice(routeForm.getPrice());
		route.setScheduledArrivalTime(routeForm.getScheduledArrivalTime());
		route.setScheduledDepartureTime(routeForm.getScheduledDepartureTime());
		route.setOperationEndDate(routeForm.getOperationEndDate());
		route.setOperationStartDate(routeForm.getOperationStartDate());
		route.setBusId(routeForm.getBusId());
		
		
		routeMapper.updateByPrimaryKeySelective(route);
		
		redirectAttributes.addFlashAttribute("message","ID(" + route.getRouteId() + ")で変更しました。");
		return "redirect:/routeList/index";
	}
	
	
}
