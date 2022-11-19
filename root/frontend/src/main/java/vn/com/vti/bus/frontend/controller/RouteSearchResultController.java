package vn.com.vti.bus.frontend.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.RouteCustom;
import vn.com.vti.bus.mapper.RouteCustomMapper;

@Controller
@RequestMapping("/routeSearch")
public class RouteSearchResultController {
	@Autowired
	private RouteCustomMapper routeCustomMapper;
	
	@RequestMapping("/index")
	public String index() {
		return "route/routeSearchResult";
	}
	
	
	@RequestMapping("/search")
	public String search(@RequestParam(value="departureStationName") String departureStationName,
			@RequestParam(value="arrivalStationName") String arrivalStationName,
			@RequestParam(value="departureDate") String departureDate,
			Model model) throws ParseException {
		
		String inputedDepartureNameInfo = departureStationName;
		String inputedArrivalNameInfo = arrivalStationName;
		
		model.addAttribute("inputedDepartureNameInfo", inputedDepartureNameInfo);
		model.addAttribute("inputedArrivalNameInfo", inputedArrivalNameInfo);
		
		String param1 = "%"+departureStationName+"%";
		String param2 = "%"+arrivalStationName+"%";
		String param3 = departureDate;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dateParam = formatter.parse(param3);
		List<RouteCustom> routeSearchResult  = routeCustomMapper.selectByNamePart(param1, param2, dateParam);
		model.addAttribute("routeSearchResult", routeSearchResult);
		return "route/routeSearchResult";
	}
}

