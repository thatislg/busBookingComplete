package vn.com.vti.bus.mapper;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import vn.com.vti.bus.entity.SeatMap;

public interface SeatMapCustomMapper {
	List <SeatMap>  checkSeatMap(@DateTimeFormat(pattern="yyyy-MM-dd")Date departureDate, int departureId, int arrivalId);
}
