/**
 * 
 */
package vn.com.vti.bus.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.com.vti.bus.entity.Member;
import vn.com.vti.bus.entity.ReserveCustom;
import vn.com.vti.bus.mapper.MemberMapper;
import vn.com.vti.bus.mapper.ReserveCustomMapper;

/**
 * @author thatislg1720
 *
 */
@Controller
@RequestMapping("/member")
public class MemberReservationController {
	@Autowired 
	private MemberMapper memberMapper;
	
	@Autowired
	private ReserveCustomMapper reserveCustomMapper;
	
	@RequestMapping("/reservationStatus")
	public String memberInfo(@RequestParam String memberId, Model model, RedirectAttributes redirectAttributes) {
		
		Member member = memberMapper.selectByPrimaryKey(Integer.parseInt(memberId));
		model.addAttribute("member", member);
		
		List<ReserveCustom> reserveCustomList = reserveCustomMapper.selectMemberReservationByMemberId(Integer.parseInt(memberId));
		model.addAttribute("memberReservationList", reserveCustomList);
		if(reserveCustomList.isEmpty()) {
			redirectAttributes.addFlashAttribute("message","会員ID(" + memberId + ")が予約していません。");
		}
		
		return "/member/memberReservation";

	}

}
