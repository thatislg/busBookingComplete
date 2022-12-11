package vn.com.vti.bus.frontend.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController {
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
		return "homepage";
	}
	@RequestMapping("/guideInfor")
	public String guideInfor(Model model) {
		return "guideInfor";
	}
}
