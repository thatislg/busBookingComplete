package vn.com.vti.bus.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusExample;
import vn.com.vti.bus.mapper.BusMapper;

@Controller
@RequestMapping("/busList")
public class BusListController {

	@Autowired
	private BusMapper busMapper;

	@RequestMapping("/index")
	public String index(Model model) {
		BusExample busExample = new BusExample();
		busExample.setOrderByClause("bus_Id");
		List<Bus> busList = busMapper.selectByExample(busExample);

		model.addAttribute("busList", busList);
		return "bus/busList";
	}
}
