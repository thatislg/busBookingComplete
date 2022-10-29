package vn.com.vti.bus.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.com.vti.bus.mapper.RouteMapper;

@Controller
@RequestMapping("/routeInsert")
public class RouteInsertController {
	
	@Autowired
	private RouteMapper routeMapper;
}
