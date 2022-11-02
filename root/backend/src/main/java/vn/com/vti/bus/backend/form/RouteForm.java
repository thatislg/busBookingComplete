package vn.com.vti.bus.backend.form;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

public class RouteForm{
	@NotNull
	private Integer departureId;
	
	@NotNull
	private Integer arrivalId;
	
	@NotNull
	private Integer busId;
	
	@NotNull
	private Integer price;
	
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date operationStartDate;
	
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date operationEndDate;
	
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date scheduledDepartureTime;
	
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date scheduledArrivalTime;
	
	
	
	public Integer getBusId() {
		return busId;
	}
	public void setBusId(Integer busId) {
		this.busId = busId;
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
	
	public void setScheduledDepartureTime(Date scheduledDepartureTime) {
		this.scheduledDepartureTime = scheduledDepartureTime;
	}
	
	public Date getScheduledDepartureTime() {
		return scheduledDepartureTime;
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
	
	public Date getScheduledArrivalTime() {
		return scheduledArrivalTime;
	}
	public void setScheduledArrivalTime(Date scheduledArrivalTime) {
		this.scheduledArrivalTime = scheduledArrivalTime;
	}
}
