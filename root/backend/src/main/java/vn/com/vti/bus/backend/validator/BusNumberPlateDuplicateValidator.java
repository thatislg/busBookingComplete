package vn.com.vti.bus.backend.validator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import vn.com.vti.bus.backend.form.BusForm;
import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.entity.BusExample;
import vn.com.vti.bus.mapper.BusMapper;

@Component
public class BusNumberPlateDuplicateValidator implements Validator{
	@Autowired
	private BusMapper busMapper;

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}
	@Override
	public void validate(Object target, Errors errors) {
		if(!(target instanceof BusForm)) {
			return;
		}
		BusForm busForm = (BusForm)target;

		BusExample busExample = new BusExample();
		busExample.createCriteria()
			.andNumberPlaceEqualTo(busForm.getNumberPlace())
			.andNumberDivisionEqualTo(busForm.getNumberDivision())
			.andNumberKanaEqualTo(busForm.getNumberKana())
			.andNumberFirstHalfEqualTo(busForm.getNumberFirstHalf())
			.andNumberLatterHalfEqualTo(busForm.getNumberLatterHalf());

		List<Bus> busList = busMapper.selectByExample(busExample);
		System.out.println(busList);
		if(!busList.isEmpty()) {
			errors.rejectValue("numberPlace", "error.alreadyExist", new Object[] {"ナンバープレート"}, null);
		}

	}
}
