package vn.com.vti.bus.frontend.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.entity.BusStationCustom;
import vn.com.vti.bus.mapper.BusStationCustomMapper;

@Controller
public class HomePageController {
	@Autowired
	private BusStationCustomMapper busStationCustomMapper;
	
	@RequestMapping("/")
	public String index(Model model) {
		SimpleDateFormat dates = new SimpleDateFormat("yyyy-MM-dd");
		Calendar getToday = Calendar.getInstance();
		
		//set min date to today
		String today =  dates.format(getToday.getTime());
		model.addAttribute("today", today);
		
		//set max date to 90 days after today
		getToday.add(Calendar.DAY_OF_MONTH, 90); 
		String nMonth = dates.format(getToday.getTime());
		model.addAttribute("nMonth", nMonth);
		
		//get prefecture list
		List<BusStationCustom> prefectureList =  busStationCustomMapper.selectPrefecture();
		model.addAttribute("prefectureList",prefectureList);
		return "homepage";
	}
	@RequestMapping("/guideInfor")
	public String guideInfor(Model model) {
		return "guideInfor";
	}
}
