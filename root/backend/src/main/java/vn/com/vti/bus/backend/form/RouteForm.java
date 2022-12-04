package vn.com.vti.bus.backend.form;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

public class RouteForm{
	
	private Integer routeId;
	
	
	private Integer busId;
	
	@NotNull
	private Integer price;
	
	private String departureStationName;
	
	private String arrivalStationName;
	
	private Integer arrivalId;
	
	private Integer departureId;

	
	@NotNull
	@DateTimeFormat(pattern = "yyyy年MM月dd日")
	private Date operationStartDate;
	
	@NotNull
	@DateTimeFormat(pattern = "yyyy年MM月dd日")
	private Date operationEndDate;
	
	@NotNull
	@DateTimeFormat(pattern = "HH:mm")
	private Date scheduledDepartureTime;
	
	@NotNull
	@DateTimeFormat(pattern = "HH:mm")
	private Date scheduledArrivalTime;
	
	
	private String numberPlate;
	
	
	public String getNumberPlate() {
		return numberPlate;
	}

	public void setNumberPlate(String numberPlate) {
		this.numberPlate = numberPlate;
	}

	public Integer getArrivalId() {
		return arrivalId;
	}

	public Integer getDepartureId() {
		return departureId;
	}

	public void setArrivalId(Integer arrivalId) {
		this.arrivalId = arrivalId;
	}

	public void setDepartureId(Integer departureId) {
		this.departureId = departureId;
	}
	
	
	public String getDepartureStationName() {
		return departureStationName;
	}

	public String getArrivalStationName() {
		return arrivalStationName;
	}

	public void setDepartureStationName(String departureStationName) {
		this.departureStationName = departureStationName;
	}

	public void setArrivalStationName(String arrivalStationName) {
		this.arrivalStationName = arrivalStationName;
	}

	
	public Integer getRouteId() {
		return routeId;
	}

	public void setRouteId(Integer routeId) {
		this.routeId = routeId;
	}
	
	
	public Integer getBusId() {
		return busId;
	}

	public void setBusId(Integer busId) {
		this.busId = busId;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Date getOperationStartDate() {
		return operationStartDate;
	}

	public void setOperationStartDate(Date operationStartDate) {
		this.operationStartDate = operationStartDate;
	}

	public Date getOperationEndDate() {
		return operationEndDate;
	}

	public void setOperationEndDate(Date operationEndDate) {
		this.operationEndDate = operationEndDate;
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

}
