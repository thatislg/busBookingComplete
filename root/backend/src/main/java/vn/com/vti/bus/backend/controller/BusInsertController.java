package vn.com.vti.bus.backend.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.backend.form.BusForm;
import vn.com.vti.bus.backend.validator.BusNumberPlateDuplicateValidator;
import vn.com.vti.bus.entity.Bus;
import vn.com.vti.bus.mapper.BusMapper;

@Controller
@RequestMapping("/busInsert")
public class BusInsertController {
	@Autowired
	private BusMapper busMapper;

	@Autowired
	private BusNumberPlateDuplicateValidator busNumberPlateDuplicateValidator;

	@InitBinder
	public void validatorBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(busNumberPlateDuplicateValidator);
	}

	@ModelAttribute
	public BusForm createForm() {
		return new BusForm();
	}

	@RequestMapping("input")
	public String input(BusForm busForm) {

		return "bus/busInsertInput";
	}
	@RequestMapping("confirm")
	public String confirm(@Valid BusForm busForm, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return input(busForm);
		}
		return "bus/busInsertConfirm";
	}
	@RequestMapping("insert")
	public String insert(BusForm busForm, RedirectAttributes redirectAttributes) {
		Bus bus = new Bus();
		bus.setRowNum(busForm.getRowNum());
		bus.setColumnNum(busForm.getColumnNum());
		bus.setNumberDivision(busForm.getNumberDivision());
		bus.setNumberPlace(busForm.getNumberPlace());
		bus.setNumberKana(busForm.getNumberKana());
		bus.setNumberFirstHalf(busForm.getNumberFirstHalf());
		bus.setNumberLatterHalf(busForm.getNumberLatterHalf());
		busMapper.insertSelective(bus);

		//redirectAttributes.addFlashAttribute("message","ID(" + bus.getId() + ")で登録しました。");

		return "redirect:/busList/index";
	}
}
