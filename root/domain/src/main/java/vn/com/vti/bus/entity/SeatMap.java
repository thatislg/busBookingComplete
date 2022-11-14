package vn.com.vti.bus.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SeatMap {
	private Integer busId;
	private Integer seatNumber;
	private Integer reserveId;
	private Integer routeId;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date departureDate;
	private Integer departureId;
	private Integer arrivalId;
	private Integer price;
	public Integer getBusId() {
		return busId;
	}
	public void setBusId(Integer busId) {
		this.busId = busId;
	}
	public Integer getSeatNumber() {
		return seatNumber;
	}
	public void setSeatNumber(Integer seatNumber) {
		this.seatNumber = seatNumber;
	}
	public Integer getReserveId() {
		return reserveId;
	}
	public void setReserveId(Integer reserveId) {
		this.reserveId = reserveId;
	}
	public Integer getRouteId() {
		return routeId;
	}
	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
	}
	public Date getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}
	public Integer getDepartureId() {
		return departureId;
	}
	public void setDepartureId(Integer departureId) {
		this.departureId = departureId;
	}
	public Integer getArrivalId() {
		return arrivalId;
	}
	public void setArrivalId(Integer arrivalId) {
		this.arrivalId = arrivalId;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
}
