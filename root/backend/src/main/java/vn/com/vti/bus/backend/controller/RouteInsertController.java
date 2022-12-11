package vn.com.vti.bus.backend.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusExample;
import vn.com.vti.bus.entity.BusStation;
import vn.com.vti.bus.entity.BusStationExample;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.BusStationMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeInsert")
public class RouteInsertController {
	
	@Autowired
	private RouteMapper routeMapper;
	
	@Autowired
	private BusStationMapper busStationMapper;
	
	@Autowired
	private BusMapper busMapper;
	
//	@Autowired
//	private RouteDuplicateValidator routeDuplicateValidator;
	
//	@InitBinder
//	public void validatorBinder(WebDataBinder webDataBinder) {
//		webDataBinder.addValidators(routeDuplicateValidator);
//	}
	
	@ModelAttribute
	public RouteForm createForm() {
		return new RouteForm();
	}
	
	@RequestMapping("input")
	public String input(RouteForm routeForm, Model model) {
		
		BusStationExample busStationExample = new BusStationExample();
		BusExample busExample = new BusExample();
		
		List<BusStation> busStationList = busStationMapper.selectByExample(busStationExample);
		List<Bus> busList = busMapper.selectByExample(busExample);
		
		model.addAttribute("busStationList", busStationList);
		model.addAttribute("busList", busList);
		
		return "route/routeInsertInput";
	}
	
	@RequestMapping("confirm")
	public String confirm(@Valid RouteForm routeForm, BindingResult bindingResult, Model model) {
		if(bindingResult.hasErrors()) {
			return input(routeForm, model);
		}
		
		String departureStationName = busStationMapper.selectByPrimaryKey(routeForm.getDepartureId()).getBusStationName();
		String arrivalStationName = busStationMapper.selectByPrimaryKey(routeForm.getArrivalId()).getBusStationName();
		String numberPlate = busMapper.selectByPrimaryKey(routeForm.getBusId()).getNumberPlate();
		routeForm.setDepartureStationName(departureStationName);
		routeForm.setArrivalStationName(arrivalStationName);
		routeForm.setNumberPlate(numberPlate);
		
		return "route/routeInsertConfirm";
	}
	
	@RequestMapping("insert")
	public String insert(RouteForm routeForm, RedirectAttributes redirectAttributes) {
		Route route = new Route();
		
		route.setDepartureId(routeForm.getDepartureId());
		route.setArrivalId(routeForm.getArrivalId());
		route.setPrice(routeForm.getPrice());
		route.setBusId(routeForm.getBusId());
		route.setOperationStartDate(routeForm.getOperationStartDate());
		route.setOperationEndDate(routeForm.getOperationEndDate());
		route.setScheduledDepartureTime(routeForm.getScheduledDepartureTime());
		route.setScheduledArrivalTime(routeForm.getScheduledArrivalTime());
		
		routeMapper.insertSelective(route);

		redirectAttributes.addFlashAttribute("message","ID(" + route.getRouteId() + ")で登録しました。");

		return "redirect:/routeList/index";
	}
}
