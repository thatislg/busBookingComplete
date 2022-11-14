package vn.com.vti.bus.backend.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusStation;
import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.Reserve;
import vn.com.vti.bus.entity.ReserveExample;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.Seat;
import vn.com.vti.bus.entity.SeatExample;
import vn.com.vti.bus.entity.SeatOrder;
import vn.com.vti.bus.mapper.BusMapper;
import vn.com.vti.bus.mapper.BusStationMapper;
import vn.com.vti.bus.mapper.MemberMapper;
import vn.com.vti.bus.mapper.ReserveMapper;
import vn.com.vti.bus.mapper.RouteMapper;
import vn.com.vti.bus.mapper.SeatMapper;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private RouteMapper routeMapper;
	@Autowired
	private ReserveMapper reserveMapper;

	@Autowired
	private BusStationMapper busStationMapper;

	@Autowired
	private SeatMapper seatMapper;

	@Autowired
	private BusMapper busMapper;

	@Autowired
	private MemberMapper memberMapper;

	@RequestMapping("/index")
	public String index(@RequestParam String routeId, Model model) {
		searchRouteId = routeId;

		searchSeatList(new Date(), model);

		return "route/reservation";
	}

	@RequestMapping("/search")
	public String search(@RequestParam String dateStr, Model model) throws Exception {
		Date date = null;
		if (dateStr.isEmpty()) {
			date = new Date();

		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			date = dateFormat.parse(dateStr);
		}

		searchSeatList(date, model);

		return "route/reservation";
	}

	private String searchRouteId;

	private void searchSeatList(Date date, Model model) {

		Route route = routeMapper.selectByPrimaryKey(Integer.parseInt(searchRouteId));
		model.addAttribute("routeInfo", route);

		BusStation departureStation = busStationMapper.selectByPrimaryKey(route.getDepartureId());
		BusStation arrivalStation = busStationMapper.selectByPrimaryKey(route.getArrivalId());

		model.addAttribute("departureStation", departureStation);
		model.addAttribute("arrivalStation", arrivalStation);
		model.addAttribute("routeId", searchRouteId);
		model.addAttribute("date", date);
		//予約リストを取得する
		ReserveExample reserveExample = new ReserveExample();
		reserveExample.createCriteria().andDepartureDateEqualTo(date)
				.andRouteIdEqualTo(Integer.parseInt(searchRouteId));
		List<Reserve> reserveList = reserveMapper.selectByExample(reserveExample);
		model.addAttribute("reserveList", reserveList);

		
		//バスの座席を仮にセットする
		Bus bus = busMapper.selectByPrimaryKey(route.getBusId());
		model.addAttribute("bus", bus);
		
		List<SeatOrder> seatOrderList = new ArrayList<>();
		Integer countSeat = bus.getRowNum() * bus.getColumnNum();
		model.addAttribute("countSeat", countSeat);
		for (int i = 0; i < countSeat ; i++) {

			seatOrderList.add(null);

		}

		//予約された座席の番号と予約メンバーの名前を取得する
		for (Reserve reserve : reserveList) {

			Member member = memberMapper.selectByPrimaryKey(reserve.getMemberId());

			SeatExample seatExample = new SeatExample();
			seatExample.createCriteria().andReserveIdEqualTo(reserve.getReserveId());
			List<Seat> seatListByReserveId = seatMapper.selectByExample(seatExample);
			for (Seat seat : seatListByReserveId) {
				SeatOrder seatOrder = new SeatOrder();
				seatOrder.setSeatNumber(seat.getSeatNumber());
				seatOrder.setMemberName(member.getMemberName());
				seatOrderList.set(seatOrder.getSeatNumber() - 1, seatOrder);
			}

		}

		//1列ごとにリストの要素としてリストする
		List<List<SeatOrder>> rowSeatList = new ArrayList<List<SeatOrder>>();
		for (int i = 1; i < seatOrderList.size(); i++) {

			if ((i % bus.getColumnNum() == 0) || (i == seatOrderList.size() - 1)) {
				List<SeatOrder> rowSeat = seatOrderList.subList(i - bus.getColumnNum(), i);
				rowSeatList.add(rowSeat);
			}

		}
			
		model.addAttribute("rowSeatList", rowSeatList);		

	
	}

}
