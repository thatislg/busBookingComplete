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
		Date today = new Date();
		model.addAttribute("today", today);
		return "/reservation/reservationList";
	}
	
	@RequestMapping("/input")
	public String input(@RequestParam(value="departureDate")
							@DateTimeFormat(pattern = "yyyy-MM-dd") Date departureDate,
						@RequestParam(value="routeId") String routeId, 
						@RequestParam(value="busId") String busId,
						@RequestParam(value="searchedDepartureName") String searchedDepartureName,
						@RequestParam(value="searchedArrivalName") String searchedArrivalName,
						@RequestParam(value="searchedDeparturePrefecture") String searchedDeparturePrefecture,
						@RequestParam(value="searchedArrivalPrefecture") String searchedArrivalPrefecture,
						Model model) {
		
		// Convert ki???u d??? li???u nh???n v??o
		int intRouteId = Integer.parseInt(routeId);
		int intBusId = Integer.parseInt(busId);
		
		searchResultForm = new SearchResultForm(departureDate,searchedDepartureName
												,searchedArrivalName, routeId, busId,searchedDeparturePrefecture,searchedArrivalPrefecture);
		
		model.addAttribute("searchResultForm", searchResultForm);
		
		// L???y th??ng tin c??c gh??? ???????c ?????t ch??? tr??n bus theo ng??y, theo routeId, v?? busID 
		SeatMap seatMap = new SeatMap();
		List<SeatMap> seatList = seatMapCustomMapper.checkSeatMap(departureDate, intRouteId, intBusId);
		
		//???L???y th??ng tin chuy???n bus ???????c ch???n
		bus =  busMapper.selectByPrimaryKey(intBusId);
		model.addAttribute("busInfo", bus);
		
		//???L???y th??ng tin v??? route
		route = routeMapper.selectByPrimaryKey(intRouteId);
		model.addAttribute("routeInfo", route);
		
		// L???y th??ng tin v??? ??i???m ?????n v?? ??i???m ??i
		departureStationName = busStationMapper.selectByPrimaryKey(route.getDepartureId());
		arrivalStationName = busStationMapper.selectByPrimaryKey(route.getArrivalId());
		model.addAttribute("departureStationName", departureStationName);
		model.addAttribute("arrivalStationName", arrivalStationName);
		
		// L???y th??ng tin v??? reserve
		model.addAttribute("seatMap", seatMap);
		model.addAttribute("seatList", seatList);
		
		return "/route/reservationInput";
	}
	
	@RequestMapping("/confirm")
	public String confirm(@RequestParam(value="currentReservedSeat") List<String> currentReservedSeat
							,Model model) {

		// L???y th??ng tin c??c gh??? m???i ???????c ?????t
		ArrayList<String> inputedCurrentReservedSeat = new ArrayList<>(currentReservedSeat);
		String strInputedCurrentReservedSeat =  String.join(", ", inputedCurrentReservedSeat);
		model.addAttribute("strInputedCurrentReservedSeat", strInputedCurrentReservedSeat);
		model.addAttribute("insertSeatInfo", currentReservedSeat);
		model.addAttribute("inputedCurrentReservedSeat", inputedCurrentReservedSeat);
		
		model.addAttribute("searchResultForm", searchResultForm);
		
		//???L???y th??ng tin chuy???n bus ???????c ch???n
		model.addAttribute("busInfo", bus);
				
		//???L???y th??ng tin v??? route
		model.addAttribute("routeInfo", route);
				
		// L???y th??ng tin v??? ??i???m ?????n v?? ??i???m ??i
		model.addAttribute("departureStationName", departureStationName);
		model.addAttribute("arrivalStationName", arrivalStationName);
		
		return "/route/reservationConfirm";
	}
	
	@RequestMapping("/insert")
	public String insert(@RequestParam(value="currentReservedSeat") List<String> currentReservedSeat
								, Model model, RedirectAttributes redirectAttributes) {
		
		// L???y loginId c???a ng?????i ??ang ????ng nh???p
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		String currentPrincipleName = authentication.getName();
		
		Member currentLoginMember = memberMapper2.getMemberIdByMemberLoginId(currentPrincipleName);
		model.addAttribute("currentLoginId", currentLoginMember);
		
		// L???y c??c th??ng tin thi???t l???p ????n ?????t l???ch m???i
		int insertMemberId = currentLoginMember.getMemberId();
		int insertRouteId = Integer.parseInt(searchResultForm.getRouteId());
		int insertBusId = Integer.parseInt(searchResultForm.getBusId());
		
		// Chuy???n c??c gh??? ????ng k?? th??nh m???ng
		ArrayList<String> inputedCurrentReservedSeat = new ArrayList<>(currentReservedSeat);
		String strInputedCurrentReservedSeat =  String.join(", ", inputedCurrentReservedSeat);
		
		//???L???y th??ng tin v??? route
		model.addAttribute("routeInfo", route);
				
		// L???y th??ng tin v??? ??i???m ?????n v?? ??i???m ??i
		model.addAttribute("departureStationName", departureStationName);
		model.addAttribute("arrivalStationName", arrivalStationName);
		
		SimpleDateFormat dtf = new SimpleDateFormat("yyyy-MM-dd hh:MM:ss");  
		Date now = null;
		try {
			now = dtf.parse(dtf.format(new Date()));
		} catch (ParseException e) {
			System.err.println("???? c?? l???i ?????i ng??y th??ng");
			e.printStackTrace();
		}
		
		Reserve reserve = new Reserve();
		reserve.setRouteId(insertRouteId);
		reserve.setMemberId(insertMemberId);
		reserve.setReservedDate(now);
		reserve.setDepartureDate(searchResultForm.getDepartureDate());
		
		// C???n check xem ???? c?? b???n ghi t????ng ???ng ch??a m???i cho insert
		// L???y danh s??ch gh??? ??c ?????t theo RouteId, DepartureDate, BusId
		List<SeatMap> seatListForChecking = seatMapCustomMapper.checkSeatMap(reserve.getDepartureDate()
																	,reserve.getRouteId()
																	, insertBusId);
		
		// Chuy???n chu???i gh??? t??? string th??nh list s???
		List<Integer> registeredSeatList = new ArrayList<>();
		for(int i = 0; i < inputedCurrentReservedSeat.size(); i++) {
			String seatNumber = inputedCurrentReservedSeat.get(i).replaceAll("(^\\[|\\]$)", "");
			int insertSeatNumber = Integer.parseInt(seatNumber); 
			
			registeredSeatList.add(insertSeatNumber);
		}
		// checkingFlag ????? ki???m tra xem gh??? ????ng k?? t???n t???i hay ch??a.
		int checkingFlag = 0;
		
		// Check trong chu???i gh??? ????ng k?? v?? chu???i gh??? ???? t???n t???i.
		for(SeatMap seat : seatListForChecking) {
			for(Integer seat1 : registeredSeatList) {
				if(seat1 == seat.getSeatNumber()) {
					checkingFlag += 1;
				} else {
					checkingFlag += 0;
				}
			}
		}
		
		// N???u checkingFlag = 0 th?? cho ph??p ?????t ch???
		if (checkingFlag == 0) {
			int insertedId = reserveCustomMapper2.insert(reserve);
			
			int reservedId = reserve.getReserveId();
			model.addAttribute("reservedId", reservedId);
			
			System.out.println("insertedId = " + reservedId);
			System.out.println("insertedId1 = " + insertedId);
			
		
			model.addAttribute("strInputedCurrentReservedSeat", strInputedCurrentReservedSeat);
			model.addAttribute("insertSeatInfo", currentReservedSeat);
			model.addAttribute("inputedCurrentReservedSeat", inputedCurrentReservedSeat);
			
			model.addAttribute("reservedDepartureDate", searchResultForm.getDepartureDate());
			
			for(Integer seat1 : registeredSeatList) {

				System.out.println(seat1);
				Seat seat = new Seat();
				
				seat.setReserveId(reservedId);
				seat.setBusId(insertBusId);
				seat.setSeatNumber(seat1);
				
				seatMapper.insert(seat);
			}
			return "redirect:/reservation/complete?reservedId="+reservedId;
		
		// N???u checkingFlag <> 0 th?? cho quay tr??? l???i n??i ch???n gh???	
		} else {
			StringBuilder parameterForInput = new StringBuilder();
			SimpleDateFormat dtf1 = new SimpleDateFormat("yyyy-MM-dd");  
			String departureDate=null;
			if(searchResultForm.getDepartureDate()!=null) {
				departureDate = dtf1.format(searchResultForm.getDepartureDate());
			}
			parameterForInput.append("?departureDate="+departureDate);
			
			parameterForInput.append("&routeId="+searchResultForm.getRouteId());
			parameterForInput.append("&busId="+searchResultForm.getBusId());
			parameterForInput.append("&searchedDepartureName="+searchResultForm.getSearchedDepartureName());
			parameterForInput.append("&searchedArrivalName="+searchResultForm.getSearchedArrivalName());
			parameterForInput.append("&searchedDeparturePrefecture="+searchResultForm.getSearchedDeparturePrefecture());
			parameterForInput.append("&searchedArrivalPrefecture="+searchResultForm.getSearchedArrivalPrefecture());
			
			redirectAttributes.addFlashAttribute("errMessage","???????????????????????? (" + strInputedCurrentReservedSeat + ") ????????????????????????????????????????????????????????????");
			return "redirect:/reservation/input"+parameterForInput;
		}
	}
	
	@RequestMapping("/complete")
	public String complete( Model model, Integer reservedId) {

		
		// L???y danh s??ch gh??? ??c ?????t theo reserveId
		SeatExample seatExample = new SeatExample();
		seatExample.createCriteria().andReserveIdEqualTo(reservedId);
		List<Seat> seatList = seatMapper.selectByExample(seatExample);
		
		// Chuy???n danh s??ch gh??? th??nh str ????? hi???n th???
		List<String> strSeatList = new ArrayList<>();
		for(Seat seat: seatList) {
			strSeatList.add(String.valueOf(seat.getSeatNumber()));
		}
		String strSeatListInfo = String.join(", ", strSeatList);
		
		// L???y th??ng tin v??? t???ng gi?? ti???n
		Reserve reserve = reserveMapper.selectByPrimaryKey(reservedId);
		Route reservedRoute = routeMapper.selectByPrimaryKey(reserve.getRouteId());
		int totalAmount = reservedRoute.getPrice() * seatList.size();
		
		// T???o c??c model hi???n th??? th??ng tin
		model.addAttribute("strSeatListInfo", strSeatListInfo);
		model.addAttribute("reserveInfo", reserve);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("departureStationName", departureStationName);
		model.addAttribute("arrivalStationName", arrivalStationName);
		return "route/reservationInsert";
	}
	
	@RequestMapping("/cancelConfirm")
	public String cancelConfirm(@RequestParam(value="reserveId") String reserveId,
			Model model,RedirectAttributes redirectAttributes) {
		int intReserveId = Integer.parseInt(reserveId);
		List<ReserveCustom> reservationInfor = reserveCustomMapper.selectByReserveId(intReserveId);
		model.addAttribute("reservationInfor", reservationInfor.get(0));
		
		//Get totalPrice
		Integer totalPrice = 0;
		for(ReserveCustom tp : reservationInfor) {
			totalPrice+=tp.getPrice();
		}
		model.addAttribute("totalPrice", totalPrice);
		
		//Get seat number list
		List<String> strSeatList = new ArrayList<>();
		for(ReserveCustom sl: reservationInfor) {
			strSeatList.add(String.valueOf(sl.getSeatNumber()));
		}
		String strSeatListInfo = String.join(", ", strSeatList);
		model.addAttribute("seatInfor", strSeatListInfo);
		
		//set reservation cancel validation
		Date date1 = new Date();
		Reserve getDate = reserveMapper.selectByPrimaryKey(intReserveId);
		Date date2 = getDate.getDepartureDate();  
		try {
	        SimpleDateFormat dates = new SimpleDateFormat("yyyy-MM-dd");
        
	        //Setting dates
	        Date localDate = dates.parse(dates.format(date1));
	        Date departureDate = dates.parse(dates.format(date2));
	        
	        //Comparing dates
	        long difference = Math.abs(departureDate.getTime() - localDate.getTime());
	        long differenceDates = difference / (24 * 60 * 60 * 1000);
	        
	        //Show to browser
	        if( differenceDates <= 1 ) {
				redirectAttributes.addFlashAttribute("errMessage","????????????????????????????????????????????????????????????????????????");
				return "redirect:/reservation/index";
			}	
	    }
	    catch (Exception e) {
	    	System.err.println("DIDN'T WORK");
			e.printStackTrace();
	    }
		return "/reservation/reservationCancelConfirm";	
	}
	@RequestMapping("cancel")
	public String cancel(@RequestParam(value="reserveId") String reserveId,@RequestParam(value="seatId") String seatId, Model model, RedirectAttributes redirectAttributes) {
		seatMapper.deleteByPrimaryKey(Integer.parseInt(seatId));
		reserveMapper.deleteByPrimaryKey(Integer.parseInt(reserveId));
		// show message if code works
		redirectAttributes.addFlashAttribute("message","??????ID(" + reserveId + ")????????????????????????");
		return "redirect:/reservation/index";
	}
}
