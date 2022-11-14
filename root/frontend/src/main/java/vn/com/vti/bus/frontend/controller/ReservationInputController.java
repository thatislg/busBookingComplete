package vn.com.vti.bus.frontend.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.SeatMap;
import vn.com.vti.bus.mapper.SeatMapCustomMapper;

@Controller
@RequestMapping("/reservation")
public class ReservationInputController {
	
	@Autowired 
	private SeatMapCustomMapper seatMapCustomMapper;
	
	@RequestMapping("/input")
	public String input(@RequestParam(value="searchedDate")
							@DateTimeFormat(pattern = "yyyy-MM-dd") Date searchedDate,
						@RequestParam(value="departureId") String departureId, 
						@RequestParam(value="arrivalId") String arrivalId, Model model) {
		
		SeatMap seatMap = new SeatMap();
		seatMap.setDepartureDate(searchedDate);
		seatMap.setDepartureId(Integer.parseInt(departureId));
		seatMap.setArrivalId(Integer.parseInt(arrivalId));
		model.addAttribute("seatMap", seatMap);
		
		List<SeatMap> seatList = seatMapCustomMapper.checkSeatMap(searchedDate, Integer.parseInt(departureId), Integer.parseInt(arrivalId)); 
		model.addAttribute("seatList", seatList);
		
		return "/route/reservationInput";
	}
}
