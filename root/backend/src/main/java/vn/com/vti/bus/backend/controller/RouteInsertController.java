package vn.com.vti.bus.backend.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.backend.validator.RouteDuplicateValidator;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeInsert")
public class RouteInsertController {
	
	@Autowired
	private RouteMapper routeMapper;
	
	@Autowired
	private RouteDuplicateValidator routeDuplicateValidator;
	
	@InitBinder
	public void validatorBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(routeDuplicateValidator);
	}
	
	@ModelAttribute
	public RouteForm createForm() {
		return new RouteForm();
	}
	
	@RequestMapping("input")
	public String input(RouteForm routeForm) {
		return "route/routeInsertInput";
	}
	
	@RequestMapping("confirm")
	public String confirm(@Valid RouteForm routeForm, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return input(routeForm);
		}
		return "route/routeInsertConfirm";
	}
	
	@RequestMapping("insert")
	public String insert(RouteForm routeForm, RedirectAttributes redirectAttributes) {
		Route route = new Route();
		
		route.setArrivalId(routeForm.getArrivalId());
		route.setDepartureId(routeForm.getDepartureId());
		route.setPrice(routeForm.getPrice());
		route.setBusId(routeForm.getDepartureId());
		route.setOperationEndDate(routeForm.getOperationEndDate());
		route.setOperationStartDate(routeForm.getOperationStartDate());
		route.setScheduledDepartureTime(routeForm.getScheduledArrivalTime());
		route.setScheduledDepartureTime(routeForm.getScheduledDepartureTime());
		routeMapper.insertSelective(route);

		redirectAttributes.addFlashAttribute("message","ID(" + route.getRouteId() + ")で登録しました。");

		return "redirect:/routeList/index";
	}
}
