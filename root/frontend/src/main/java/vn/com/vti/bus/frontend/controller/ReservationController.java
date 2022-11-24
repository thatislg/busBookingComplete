package vn.com.vti.bus.frontend.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusStation;
import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.Reserve;
import vn.com.vti.bus.entity.ReserveCustom;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.Seat;
import vn.com.vti.bus.entity.SeatMap;
import vn.com.vti.bus.frontend.security.MemberDetails;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.BusStationMapper;
import vn.com.vti.bus.mapper.MemberMapper2;
import vn.com.vti.bus.mapper.ReserveCustomMapper;
import vn.com.vti.bus.mapper.ReserveCustomMapper2;
import vn.com.vti.bus.mapper.RouteMapper;
import vn.com.vti.bus.mapper.SeatMapCustomMapper;
import vn.com.vti.bus.mapper.SeatMapper;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private SeatMapCustomMapper seatMapCustomMapper;
	@Autowired
	private BusMapper busMapper;
	@Autowired
	private MemberMapper2 memberMapper2;
	@Autowired
	private RouteMapper routeMapper;
	@Autowired
	private ReserveCustomMapper2 reserveCustomMapper2;
	@Autowired
	private BusStationMapper busStationMapper;
	@Autowired
	private ReserveCustomMapper reserveCustomMapper;
	@Autowired
	private SeatMapper seatMapper;
	
	@RequestMapping("index")
	public String index(Model model, @AuthenticationPrincipal MemberDetails memberDetails) {
		
		List<ReserveCustom> reservationList = reserveCustomMapper.selectMemberReservationByMemberId(memberDetails.getLogin().getMemberId());
		model.addAttribute("reservationList", reservationList);
		
		return "/reservation/reservationList";
		
	}
	
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
	public String confirm(@RequestParam(value="currentReservedSeat") List<String> currentReservedSeat
							,@RequestParam(value="departureDate")
									@DateTimeFormat(pattern = "yyyy-MM-dd") Date departureDate
							,@RequestParam(value="routeId") String routeId
							,@RequestParam(value="busId") String busId, Model model) {
		
		// Lấy thông tin các ghế mới được đặt
		ArrayList<String> inputedCurrentReservedSeat = new ArrayList<>(currentReservedSeat);
		String strInputedCurrentReservedSeat =  String.join(", ", inputedCurrentReservedSeat);
		model.addAttribute("strInputedCurrentReservedSeat", strInputedCurrentReservedSeat);
		model.addAttribute("inputedCurrentReservedSeat", inputedCurrentReservedSeat);
		
		// Convert kiểu dữ liệu nhận vào
		int intRouteId = Integer.parseInt(routeId);
		int intBusId = Integer.parseInt(busId);
		
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
		
		Date reservedDepartureDate = departureDate;
		model.addAttribute("reservedDepartureDate", reservedDepartureDate);
		
		return "/route/reservationConfirm";
	}
	
	@RequestMapping("/insert")
	public String insert(@RequestParam(value="currentReservedSeat") List<String> currentReservedSeat
						,@RequestParam(value="departureDate")
							@DateTimeFormat(pattern = "yyyy-MM-dd") Date departureDate
						,@RequestParam(value="routeId") String routeId
						,@RequestParam(value="busId") String busId, Model model) {
		
		// Lấy loginId của người đang đăng nhập
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipleName = authentication.getName();
		
		Member currentLoginMember = memberMapper2.getMemberIdByMemberLoginId(currentPrincipleName);
		
		// Lấy các thông tin thiết lập đơn đặt lịch mới
		int insertMemberId = currentLoginMember.getMemberId();
		int insertRouteId = Integer.parseInt(routeId);
		int insertBusId = Integer.parseInt(busId);
		
		try {
			insertRouteId = Integer.parseInt(routeId);
		} catch (NumberFormatException e1) {
			System.err.println("Đã có lỗi tại phần đổi kiểu dữ liệu RouteId");
			e1.printStackTrace();
		}
		
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Date now = null;
		try {
			now = dtf.parse(dtf.format(new Date()));
		} catch (ParseException e) {
			System.err.println("Đã có lỗi đổi ngày tháng");
			e.printStackTrace();
		}
		
		Reserve reserve = new Reserve();
		reserve.setRouteId(insertRouteId);
		reserve.setMemberId(insertMemberId);
		reserve.setReservedDate(now);
		reserve.setDepartureDate(departureDate);
		int insertedId = reserveCustomMapper2.insert(reserve);
		
		int reservedId = reserve.getReserveId();
		System.out.println("insertedId = " + reservedId);
		System.out.println("insertedId1 = " + insertedId);
		
		for(String seatNumber : currentReservedSeat) {
			int insertSeatNumber = Integer.parseInt(seatNumber); 
			Seat seat = new Seat();
			
			seat.setReserveId(reservedId);
			seat.setBusId(insertBusId);
			seat.setSeatNumber(insertSeatNumber);
			
			seatMapper.insert(seat);
		}

		return "/route/reservationInsert";
	}
	
}
