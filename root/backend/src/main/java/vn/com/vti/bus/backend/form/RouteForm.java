package vn.com.vti.bus.backend.form;

import java.security.Timestamp;
import java.sql.Date;

public class RouteForm {
	private Integer price;
	private Date operationStartDate;
	private Date operationEndDate;
	private Timestamp scheduledDeapartureTime;
	private Timestamp scheduledArrivalTime;
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
	public Timestamp getScheduledDeapartureTime() {
		return scheduledDeapartureTime;
	}
	public void setScheduledDeapartureTime(Timestamp scheduledDeapartureTime) {
		this.scheduledDeapartureTime = scheduledDeapartureTime;
	}
	public Timestamp getScheduledArrivalTime() {
		return scheduledArrivalTime;
	}
	public void setScheduledArrivalTime(Timestamp scheduledArrivalTime) {
		this.scheduledArrivalTime = scheduledArrivalTime;
	}
}
