package vn.com.vti.bus.backend.validator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.backend.form.RouteForm;
import vn.com.vti.bus.entity.Route;
import vn.com.vti.bus.entity.RouteExample;
import vn.com.vti.bus.mapper.RouteMapper;

@Component
public class RouteDuplicateValidator implements Validator{

	@Autowired
	private RouteMapper routeMapper;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		if(!(target instanceof RouteForm)) {
			return;
		}		
	
		RouteForm routeForm = (RouteForm)target;
		RouteExample routeExample = new RouteExample();
		routeExample.createCriteria()
			.andArrivalIdEqualTo(routeForm.getArrivalId())
			.andDepartureIdEqualTo(routeForm.getDepartureId())
			.andPriceEqualTo(routeForm.getPrice())
			.andOperationStartDateEqualTo(routeForm.getOperationStartDate())
			.andOperationEndDateEqualTo(routeForm.getOperationEndDate())
			.andScheduledDepartureTimeEqualTo(routeForm.getScheduledDepartureTime())
			.andScheduledArrivalTimeEqualTo(routeForm.getScheduledArrivalTime());
		
		List<Route> routeList = routeMapper.selectByExample(routeExample);
		System.out.print(routeList);
		
		
		if(!routeList.isEmpty()) {
			errors.rejectValue("ROUTE", "error.alreadyExist", new Object[] {"ROUTENAME"}, null);
		}
		
//		busExample.createCriteria()
//		.andNumberPlaceEqualTo(busForm.getNumberPlace())
//		.andNumberDivisionEqualTo(busForm.getNumberDivision())
//		.andNumberKanaEqualTo(busForm.getNumberKana())
//		.andNumberFirstHalfEqualTo(busForm.getNumberFirstHalf())
//		.andNumberLatterHalfEqualTo(busForm.getNumberLatterHalf());
//
//		List<Bus> busList = busMapper.selectByExample(busExample);
//		System.out.println(busList);
//		if(!busList.isEmpty()) {
//			errors.rejectValue("numberPlace", "error.alreadyExist", new Object[] {"ナンバープレート"}, null);
//		}
	}

}
