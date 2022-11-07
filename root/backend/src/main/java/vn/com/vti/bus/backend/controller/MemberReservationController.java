/**
 * 
 */
package vn.com.vti.bus.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.mapper.MemberMapper;

/**
 * @author thatislg1720
 *
 */
@Controller
@RequestMapping("/member")
public class MemberReservationController {
	@Autowired 
	private MemberMapper memberMapper;
	
	@RequestMapping("/reservationStatus")
	public String memberInfo(@RequestParam String memberId, Model model) {
		
		Member member = memberMapper.selectByPrimaryKey(Integer.parseInt(memberId));
		model.addAttribute("member", member);
		
		return "/member/memberReservation";
	}

}
