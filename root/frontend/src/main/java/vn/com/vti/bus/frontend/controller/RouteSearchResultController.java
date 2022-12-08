package vn.com.vti.bus.frontend.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
	public String index(Model model) {
		DateFormat dates = new SimpleDateFormat("yyyy-MM-dd");
		Calendar getToday = Calendar.getInstance();
		
		
		//set min date to today
		String today = dates.format(getToday.getTime());
		System.err.println(today);
		model.addAttribute("today", today);
		
		//set max date to 90 days after today
		getToday.add(Calendar.DAY_OF_MONTH, 90); 
		String nMonth = dates.format(getToday.getTime());
		System.err.println(nMonth);
		model.addAttribute("nMonth", nMonth);
		return "route/routeSearch";
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
		
		
		Calendar getToday = Calendar.getInstance();
		
		//set min date to today
		String today =  formatter.format(getToday.getTime());
		model.addAttribute("today", today);
		
		//set max date to 90 days after today
		getToday.add(Calendar.DAY_OF_MONTH, 90); 
		String nMonth = formatter.format(getToday.getTime());
		model.addAttribute("nMonth", nMonth);
		return "route/routeSearchResult";
	}
}

