package vn.com.vti.bus.backend.form;

import java.security.Timestamp;
import java.sql.Date;

import javax.validation.constraints.NotNull;

public class RouteForm {
	@NotNull
	private Integer departureId;
	
	@NotNull
	private Integer arrivalId;
	
	@NotNull
	private Integer price;
	
	@NotNull
	private Date operationStartDate;
	
	@NotNull
	private Date operationEndDate;
	
	@NotNull
	private Timestamp scheduledDepartureTime;
	
	
	@NotNull
	private Timestamp scheduledArrivalTime;
	
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
	
	public void setScheduledDepartureTime(Timestamp scheduledDepartureTime) {
		this.scheduledDepartureTime = scheduledDepartureTime;
	}
	public Timestamp getScheduledDepartureTime() {
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
	
	public Timestamp getScheduledArrivalTime() {
		return scheduledArrivalTime;
	}
	public void setScheduledArrivalTime(Timestamp scheduledArrivalTime) {
		this.scheduledArrivalTime = scheduledArrivalTime;
	}
}
