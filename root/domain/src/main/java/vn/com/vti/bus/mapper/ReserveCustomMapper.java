/**
 * 
 */
package vn.com.vti.bus.mapper;

import java.util.Date;
import java.util.List;

import vn.com.vti.bus.entity.ReserveCustom;
import vn.com.vti.bus.entity.SeatOrder;

/**
 * @author thatislg1720
 *
 */
public interface ReserveCustomMapper {
	public List<ReserveCustom> selectMemberReservationByMemberId(Integer parseInt);
	public List<ReserveCustom> selectReservationByMemberId(int parseInt);
	public List<SeatOrder> selectReservationByDepartureDate(Date date, Integer searchRouteId);
	public List<ReserveCustom> selectByReserveId(int parseInt);
}
