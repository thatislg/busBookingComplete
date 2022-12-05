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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusStation;
import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.Reserve;
import vn.com.vti.bus.entity.ReserveCustom;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.Seat;
import vn.com.vti.bus.entity.SeatExample;
import vn.com.vti.bus.entity.SeatMap;
import vn.com.vti.bus.frontend.form.SearchResultForm;
import vn.com.vti.bus.frontend.security.MemberDetails;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.BusStationMapper;
import vn.com.vti.bus.mapper.MemberMapper2;
import vn.com.vti.bus.mapper.ReserveCustomMapper;
import vn.com.vti.bus.mapper.ReserveCustomMapper2;
import vn.com.vti.bus.mapper.ReserveMapper;
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
	@Autowired
	private ReserveMapper reserveMapper;
	
	private SearchResultForm searchResultForm;

	private Bus bus;
	
	private Route route;
	
	private BusStation departureStationName, arrivalStationName;
	
	@RequestMapping("index")
	public String index(Model model, @AuthenticationPrincipal MemberDetails memberDetails) {
		
		List<ReserveCustom> reservationList = reserveCustomMapper.selectReservationByMemberId(memberDetails.getLogin().getMemberId());
		model.addAttribute("reservationList", reservationList);
		
		return "/reservation/reservationList";
	}
	
	@RequestMapping("/input")
	public String input(@RequestParam(value="departureDate")
							@DateTimeFormat(pattern = "yyyy-MM-dd") Date departureDate,
						@RequestParam(value="routeId") String routeId, 
						@RequestParam(value="busId") String busId,
						@RequestParam(value="searchedDepartureName") String searchedDepartureName,
						@RequestParam(value="searchedArrivalName") String searchedArrivalName,
						Model model) {
		
		// Convert kiểu dữ liệu nhận vào
		int intRouteId = Integer.parseInt(routeId);
		int intBusId = Integer.parseInt(busId);
		
		searchResultForm = new SearchResultForm(departureDate,searchedDepartureName
												,searchedArrivalName, routeId, busId);
		
		model.addAttribute("searchResultForm", searchResultForm);
		
		// Lấy thông tin các ghế được đặt chỗ trên bus theo ngày, theo routeId, và busID 
		SeatMap seatMap = new SeatMap();
		List<SeatMap> seatList = seatMapCustomMapper.checkSeatMap(departureDate, intRouteId, intBusId);
		
		//　Lấy thông tin chuyến bus được chọn
		bus =  busMapper.selectByPrimaryKey(intBusId);
		model.addAttribute("busInfo", bus);
		
		//　Lấy thông tin về route
		route = routeMapper.selectByPrimaryKey(intRouteId);
		model.addAttribute("routeInfo", route);
		
		// Lấy thông tin về điểm đến và điểm đi
		departureStationName = busStationMapper.selectByPrimaryKey(route.getDepartureId());
		arrivalStationName = busStationMapper.selectByPrimaryKey(route.getArrivalId());
		model.addAttribute("departureStationName", departureStationName);
		model.addAttribute("arrivalStationName", arrivalStationName);
		
		// Lấy thông tin về reserve
		model.addAttribute("seatMap", seatMap);
		model.addAttribute("seatList", seatList);
		
		return "/route/reservationInput";
	}
	
	@RequestMapping("/confirm")
	public String confirm(@RequestParam(value="currentReservedSeat") List<String> currentReservedSeat
							,Model model) {

		// Lấy thông tin các ghế mới được đặt
		ArrayList<String> inputedCurrentReservedSeat = new ArrayList<>(currentReservedSeat);
		String strInputedCurrentReservedSeat =  String.join(", ", inputedCurrentReservedSeat);
		model.addAttribute("strInputedCurrentReservedSeat", strInputedCurrentReservedSeat);
		model.addAttribute("insertSeatInfo", currentReservedSeat);
		model.addAttribute("inputedCurrentReservedSeat", inputedCurrentReservedSeat);
		
		model.addAttribute("searchResultForm", searchResultForm);
		
		//　Lấy thông tin chuyến bus được chọn
		model.addAttribute("busInfo", bus);
				
		//　Lấy thông tin về route
		model.addAttribute("routeInfo", route);
				
		// Lấy thông tin về điểm đến và điểm đi
		model.addAttribute("departureStationName", departureStationName);
		model.addAttribute("arrivalStationName", arrivalStationName);
		
		return "/route/reservationConfirm";
	}
	
	@RequestMapping("/insert")
	public String insert(@RequestParam(value="currentReservedSeat") List<String> currentReservedSeat
								, Model model) {
		
		// Lấy loginId của người đang đăng nhập
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipleName = authentication.getName();
		
		Member currentLoginMember = memberMapper2.getMemberIdByMemberLoginId(currentPrincipleName);
		model.addAttribute("currentLoginId", currentLoginMember);
		
		// Lấy các thông tin thiết lập đơn đặt lịch mới
		int insertMemberId = currentLoginMember.getMemberId();
		int insertRouteId = Integer.parseInt(searchResultForm.getRouteId());
		int insertBusId = Integer.parseInt(searchResultForm.getBusId());
		
		//　Lấy thông tin về route
		model.addAttribute("routeInfo", route);
				
		// Lấy thông tin về điểm đến và điểm đi
		model.addAttribute("departureStationName", departureStationName);
		model.addAttribute("arrivalStationName", arrivalStationName);
		
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
		reserve.setDepartureDate(searchResultForm.getDepartureDate());
		int insertedId = reserveCustomMapper2.insert(reserve);
		
		int reservedId = reserve.getReserveId();
		model.addAttribute("reservedId", reservedId);
		
		System.out.println("insertedId = " + reservedId);
		System.out.println("insertedId1 = " + insertedId);
		
		ArrayList<String> inputedCurrentReservedSeat = new ArrayList<>(currentReservedSeat);
		String strInputedCurrentReservedSeat =  String.join(", ", inputedCurrentReservedSeat);
		model.addAttribute("strInputedCurrentReservedSeat", strInputedCurrentReservedSeat);
		model.addAttribute("insertSeatInfo", currentReservedSeat);
		model.addAttribute("inputedCurrentReservedSeat", inputedCurrentReservedSeat);
		
		model.addAttribute("reservedDepartureDate", searchResultForm.getDepartureDate());
		
		for(int i = 0; i < inputedCurrentReservedSeat.size(); i++) {
			String seatNumber = inputedCurrentReservedSeat.get(i).replaceAll("(^\\[|\\]$)", "");

			int insertSeatNumber = Integer.parseInt(seatNumber); 
			System.out.println(seatNumber);
			Seat seat = new Seat();
			
			seat.setReserveId(reservedId);
			seat.setBusId(insertBusId);
			seat.setSeatNumber(insertSeatNumber);
			
			seatMapper.insert(seat);
		}
		return "redirect:/reservation/complete?reservedId="+reservedId;
	}
	
	@RequestMapping("/complete")
	public String complete( Model model, Integer reservedId) {
		//TODO tim kiem dua tren reservedId , su dung model.Ađattribute de hien thi jsp
		
		// Lấy danh sách ghế đc đặt theo reserveId
		SeatExample seatExample = new SeatExample();
		seatExample.createCriteria().andReserveIdEqualTo(reservedId);
		List<Seat> seatList = seatMapper.selectByExample(seatExample);
		
		// Chuyển danh sách ghế thành str để hiển thị
		List<String> strSeatList = new ArrayList<>();
		for(Seat seat: seatList) {
			strSeatList.add(String.valueOf(seat.getSeatNumber()));
		}
		String strSeatListInfo = String.join(", ", strSeatList);
		
		// Lấy thông tin về tổng giá tiền
		Reserve reserve = reserveMapper.selectByPrimaryKey(reservedId);
		Route reservedRoute = routeMapper.selectByPrimaryKey(reserve.getRouteId());
		int totalAmount = reservedRoute.getPrice() * seatList.size();
		
		// Tạo các model hiển thị thông tin
		model.addAttribute("strSeatListInfo", strSeatListInfo);
		model.addAttribute("reserveInfo", reserve);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("departureStationName", departureStationName);
		model.addAttribute("arrivalStationName", arrivalStationName);
		return "route/reservationInsert";
	}
	
	@RequestMapping("/cancelConfirm")
	public String cancelConfirm(@RequestParam(value="reserveId") String reserveId,
			Model model) {
		int intReserveId = Integer.parseInt(reserveId);
		List<ReserveCustom> reservationInfor = reserveCustomMapper.selectByReserveId(intReserveId);
		model.addAttribute("reservationInfor", reservationInfor.get(0));
		
		Integer totalPrice = 0;
		for(ReserveCustom tp : reservationInfor) {
			totalPrice+=tp.getPrice();
		}
		model.addAttribute("totalPrice", totalPrice);
		
		List<String> strSeatList = new ArrayList<>();
		for(ReserveCustom sl: reservationInfor) {
			strSeatList.add(String.valueOf(sl.getSeatNumber()));
		}
		String strSeatListInfo = String.join(", ", strSeatList);
		model.addAttribute("seatInfor", strSeatListInfo);
		return "/reservation/reservationCancelConfirm";
	}
	@RequestMapping("cancel")
	public String cancel(@RequestParam(value="reserveId") String reserveId,@RequestParam(value="seatId") String seatId, Model model, RedirectAttributes redirectAttributes) {
		seatMapper.deleteByPrimaryKey(Integer.parseInt(seatId));
		reserveMapper.deleteByPrimaryKey(Integer.parseInt(reserveId));
		// Thông báo hiển thị khi làm thành công.
		redirectAttributes.addFlashAttribute("message","予約ID(" + reserveId + ")を削除しました。");
		
		return "redirect:/reservation/index";
	}
}
