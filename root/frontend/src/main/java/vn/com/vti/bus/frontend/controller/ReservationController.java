package vn.com.vti.bus.frontend.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusStation;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.SeatMap;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.BusStationMapper;
import vn.com.vti.bus.mapper.ReserveMapper;
import vn.com.vti.bus.mapper.RouteMapper;
import vn.com.vti.bus.mapper.SeatMapCustomMapper;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired 
	private SeatMapCustomMapper seatMapCustomMapper;
	
	@Autowired
	private BusMapper busMapper;
	
	@Autowired
	private RouteMapper routeMapper;
	
	@Autowired
	private ReserveMapper reserveMapper;
	
	@Autowired
	private BusStationMapper busStationMapper;
	
	@RequestMapping("/input")
	public String input(@RequestParam(value="departureDate")
						@DateTimeFormat(pattern = "yyyy-MM-dd") Date departureDate,
						@RequestParam(value="routeId") String routeId, 
						@RequestParam(value="busId") String busId,
						@RequestParam(value="inputedDepartureName") String inputedDepartureName,
						@RequestParam(value="inputedArrivalName") String inputedArrivalName,
						Model model) {
		
		// Convert kiểu dữ liệu nhận vào
		int intRouteId = Integer.parseInt(routeId);
		int intBusId = Integer.parseInt(busId);
		String inputedDepartureNameInfo = inputedDepartureName;
		String inputedArrivalNameInfo = inputedArrivalName;
		model.addAttribute("inputedDepartureNameInfo", inputedDepartureNameInfo);
		model.addAttribute("inputedArrivalNameInfo", inputedArrivalNameInfo);
		

		Date reservedDepartureDate = departureDate;
		model.addAttribute("reservedDepartureDate", reservedDepartureDate);
		
		// Lấy thông tin các ghế được đặt chỗ trên bus theo ngày, theo routeId, và busID 
		SeatMap seatMap = new SeatMap();
		List<SeatMap> seatList = seatMapCustomMapper.checkSeatMap(departureDate, intRouteId, intBusId);
		
		//　Lấy thông tin chuyến bus được chọn
		Bus bus =  busMapper.selectByPrimaryKey(intBusId);
		model.addAttribute("busInfo", bus);
		
		//　Lấy thông tin về route
		Route route = routeMapper.selectByPrimaryKey(intRouteId);
		model.addAttribute("routeInfo", route);
		
		// Lấy thông tin về điểm đến và điểm đi
		BusStation departureStationName = busStationMapper.selectByPrimaryKey(route.getDepartureId());
		BusStation arrivalStationName = busStationMapper.selectByPrimaryKey(route.getArrivalId());
		model.addAttribute("departureStationName", departureStationName);
		model.addAttribute("arrivalStationName", arrivalStationName);
		
		// Lấy thông tin về reserve
		model.addAttribute("seatMap", seatMap);
		model.addAttribute("seatList", seatList);
		
		return "/route/reservationInput";
	}
	
	@RequestMapping("/confirm")
	public String confirm() {
		return "/route/reservationConfirm";
	}
}
