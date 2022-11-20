/**
 * 
 */
package vn.com.vti.bus.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import vn.com.vti.bus.entity.Reserve;

/**
 * @author thatislg1720
 *
 */
public interface ReserveCustomMapper2 {
	@Select("SELECT * FROM reserve WHERE member_id = #{memberId};")
	@Results({
		@Result(property ="reserveId", column = "reserve_id"),
		@Result(property ="memberId", column = "member_id"),
		@Result(property ="routeId", column = "route_id"),
		@Result(property ="reservedDate", column = "reserved_date"),
		@Result(property ="departureDate", column = "departure_date")
	})
	public List<Reserve> selectReserveByMemberId(int memberId);
	
	/*
	 * 	Trong TH khó quá thì dùng phương án ko cần năng suất như bên dưới.
	 	SELECT id FROM `table` ORDER BY id DESC LIMIT 1
	 */
	
//	@Insert("INSERT INTO reserve(member_id, route_id, reserved_date, departure_date) VALUES(#{memberId}, #{routeId}, #{reservedDate}, #{departureDate});")
//	@Options(useGeneratedKeys=true, keyProperty="reserveId", keyColumn="reserve_id")
//	int insert(@Param("memberId") Integer memberId, @Param("routeId") Integer routeId,
//				@Param("reservedDate") @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date reservedDate,
//				@Param("departureDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date departureDate);
	
	@Insert("INSERT INTO reserve(member_id, route_id, reserved_date, departure_date) VALUES(#{memberId}, #{routeId}, #{reservedDate}, #{departureDate});")
	@Options(useGeneratedKeys=true, keyProperty="reserveId", keyColumn="reserve_id")
	int insert(Reserve reserve);
}
