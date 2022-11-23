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

import vn.com.vti.bus.entity.RouteCustom;
import vn.com.vti.bus.entity.SeatOrder;
import vn.com.vti.bus.mapper.ReserveCustomMapper;
import vn.com.vti.bus.mapper.RouteCustomMapper;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReserveCustomMapper reserveCustomMapper;
	
	
	@Autowired
	private RouteCustomMapper routeCustomMapper;
	
	

	@RequestMapping("/index")
	public String index(@RequestParam String routeId, Model model) {
		searchRouteId = Integer.parseInt(routeId);

		searchSeatList(new Date(), searchRouteId, model);

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

		searchSeatList(date, searchRouteId, model);

		return "route/reservation";
	}

	private Integer searchRouteId;

	private void searchSeatList(Date date, Integer searchRouteId,  Model model) {

		RouteCustom routeInfo = routeCustomMapper.selectRouteInfoByRouteId(searchRouteId);
		model.addAttribute("routeInfo", routeInfo);
		model.addAttribute("date", date);
		
		
		List<SeatOrder> seatOrderListTmp =  reserveCustomMapper.selectReservationByDepartureDate(date,searchRouteId);

		//バスの座席を仮にセットする
		List<SeatOrder> seatOrderList = new ArrayList<>();
		for (int i = 0; i < routeInfo.getRowNum() * routeInfo.getColumnNum() ; i++) {
			seatOrderList.add(null);
		}
		
		//予約された座席の番号を仮にセットした座席に代入する
		for(SeatOrder  seatOrder : seatOrderListTmp) {
			
			seatOrderList.set(seatOrder.getSeatNumber() - 1, seatOrder);
			
		}
		
		//1列ごとにリストの要素としてリストする
		List<List<SeatOrder>> rowSeatList = new ArrayList<List<SeatOrder>>();
		for (int i = 1; i < seatOrderList.size(); i++) {

			if ((i % routeInfo.getColumnNum() == 0) || (i == seatOrderList.size() - 1)) {
				List<SeatOrder> rowSeat = seatOrderList.subList(i - routeInfo.getColumnNum(), i);
				rowSeatList.add(rowSeat);
			}

		}
			
		model.addAttribute("rowSeatList", rowSeatList);		

	
	}

}
