package vn.com.vti.bus.backend.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.BusStation;
import vn.com.vti.bus.entity.Reserve;
import vn.com.vti.bus.entity.ReserveExample;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.mapper.BusStationMapper;
import vn.com.vti.bus.mapper.ReserveMapper;
import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private RouteMapper routeMapper;
	@Autowired
	private ReserveMapper reserveMapper;
	
	@Autowired
	private BusStationMapper busStationMapper;
	
	@RequestMapping("/index")
	public String index(@RequestParam String routeId, Model model) {
		searchRouteId = routeId;
		
		Route route = routeMapper.selectByPrimaryKey(Integer.parseInt(routeId));
		model.addAttribute("routeInfo", route);
		
		BusStation departureStation = busStationMapper.selectByPrimaryKey(route.getDepartureId());
		BusStation arrivalStation = busStationMapper.selectByPrimaryKey(route.getArrivalId());
		
		model.addAttribute("departureStation",departureStation);
		model.addAttribute("arrivalStation",arrivalStation);
		
		return "route/reservation";
	}
	
	private String searchRouteId;
	
	@RequestMapping("/search")
	public String search(@RequestParam Date date, Model model) {
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy年MM月dd日");
		LocalDateTime now = LocalDateTime.now();
		model.addAttribute("currentDate", dtf.format(now));
		
		
		ReserveExample reserveExample = new ReserveExample();
	    reserveExample.createCriteria().andRouteIdEqualTo(Integer.parseInt(searchRouteId)).andDepartureDateEqualTo(date);
		List<Reserve> reserveList = reserveMapper.selectByExample(reserveExample);
		model.addAttribute("reserveList", reserveList);
		
		return "route/reservation";
	}
	

}
