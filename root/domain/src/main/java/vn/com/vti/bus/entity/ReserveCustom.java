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
