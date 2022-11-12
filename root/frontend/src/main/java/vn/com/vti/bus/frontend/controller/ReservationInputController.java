package vn.com.vti.bus.frontend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.ReserveMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/reservation")
public class ReservationInputController {
	@Autowired 
	private BusMapper busMapper;
	
	@Autowired
	private RouteMapper routeMapper;
	
	@Autowired
	private ReserveMapper reserveMapper;
	
	@RequestMapping("/input")
//	public String input(@RequestParam Date searchedDate,@RequestParam String departureId, @RequestParam String arrivalId, Model model) {
	public String input() {
		return "/route/reservationInput";
	}
}
