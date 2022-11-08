/**
 * 
 */
package vn.com.vti.bus.mapper;

import java.util.List;

import vn.com.vti.bus.entity.ReserveCustom;

/**
 * @author thatislg1720
 *
 */
public interface ReserveCustomMapper {
	public List<ReserveCustom> selectMemberReservationByMemberId(Integer parseInt);
}
