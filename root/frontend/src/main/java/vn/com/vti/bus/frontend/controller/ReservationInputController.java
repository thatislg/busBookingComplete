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
import vn.com.vti.bus.entity.SeatMap;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.SeatMapCustomMapper;

@Controller
@RequestMapping("/reservation")
public class ReservationInputController {
	
	@Autowired 
	private SeatMapCustomMapper seatMapCustomMapper;
	
	@Autowired
	private BusMapper busMapper;
	
	@RequestMapping("/input")
	public String input(@RequestParam(value="searchedDate")
							@DateTimeFormat(pattern = "yyyy-MM-dd") Date searchedDate,
						@RequestParam(value="departureId") String departureId, 
						@RequestParam(value="arrivalId") String arrivalId, Model model) {
		
		// Lấy thông tin các ghế được đặt chỗ trên bus theo ngày, theo điểm xuất phát và điểm đến
		SeatMap seatMap = new SeatMap();
		List<SeatMap> seatList = seatMapCustomMapper.checkSeatMap(searchedDate, Integer.parseInt(departureId), Integer.parseInt(arrivalId));
		List<Integer> listSeatNumber = new ArrayList<Integer>;
		for(SeatMap seat : seatList){
			
		}
		
		if(seatList.isEmpty()) {
			System.out.println("Ko có dữ liệu");
			seatMap.setDepartureDate(searchedDate);
			seatMap.setDepartureId(Integer.parseInt(departureId));
			seatMap.setArrivalId(Integer.parseInt(arrivalId));
		} else {
			seatMap = seatList.get(0);
		}
		
		//　Lấy thông tin chuyến bus được chọn
		Bus bus =  busMapper.selectByPrimaryKey(seatMap.getBusId());
		
		model.addAttribute("busInfo", bus);
		model.addAttribute("seatMap", seatMap);
		model.addAttribute("seatList", seatList);
		
		return "/route/reservationInput";
	}
}
