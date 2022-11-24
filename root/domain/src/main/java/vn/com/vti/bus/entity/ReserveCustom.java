/**
 * 
 */
package vn.com.vti.bus.entity;

import java.util.Date;

/**
 * @author thatislg1720
 *
 */
public class ReserveCustom {
	private Date reservedDate;
	
	private Integer routeId;
	
	private Integer departureId;
	
	private Integer arrivalId;
	
	private Integer price;
	
	private Integer busId;
	
	private String departureName;
	
	private String arrivalName;
	
	private Date departureDate;
	
	private Integer reserveId;
	
	private Date scheduledDepartureTime;

	private Date scheduledArrivalTime;
	
	private Integer seat;
	
	public Integer getSeat() {
		return seat;
	}

	public void setSeat(Integer seat) {
		this.seat = seat;
	}

	public Date getScheduledDepartureTime() {
		return scheduledDepartureTime;
	}

	public void setScheduledDepartureTime(Date scheduledDepartureTime) {
		this.scheduledDepartureTime = scheduledDepartureTime;
	}

	public Date getScheduledArrivalTime() {
		return scheduledArrivalTime;
	}

	public void setScheduledArrivalTime(Date scheduledArrivalTime) {
		this.scheduledArrivalTime = scheduledArrivalTime;
	}

	public Date getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public Integer getReserveId() {
		return reserveId;
	}

	public void setReserveId(Integer reserveId) {
		this.reserveId = reserveId;
	}

	

	public String getDepartureName() {
		return departureName;
	}

	public void setDepartureName(String departureName) {
		this.departureName = departureName;
	}

	public String getArrivalName() {
		return arrivalName;
	}

	public void setArrivalName(String arrivalName) {
		this.arrivalName = arrivalName;
	}

	public Date getReservedDate() {
		return reservedDate;
	}

	public void setReservedDate(Date reservedDate) {
		this.reservedDate = reservedDate;
	}

	public Integer getRouteId() {
		return routeId;
	}

	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
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

	public Integer getBusId() {
		return busId;
	}

	public void setBusId(Integer busId) {
		this.busId = busId;
	}
}
