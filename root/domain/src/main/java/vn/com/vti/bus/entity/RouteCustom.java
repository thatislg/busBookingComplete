package vn.com.vti.bus.entity;

import java.util.Date;

public class RouteCustom {
	
   private Integer routeId;

   private Integer departureId;
   
   private String departureStationName;

   private Integer arrivalId;
   
   private String arrivalStationName;

   private Integer price;

   private Integer busId;

   private Date operationStartDate;

   private Date operationEndDate;

   private Date scheduledDepartureTime;

   private Date scheduledArrivalTime;
   
   private Integer availableSeats;
   
   private Integer rowNum;
   
   private Integer columnNum;
   
   private String departurePrefecture;
   
   private String arrivalPrefecture;
   

public String getDeparturePrefecture() {
	return departurePrefecture;
}

public void setDeparturePrefecture(String departurePrefecture) {
	this.departurePrefecture = departurePrefecture;
}

public String getArrivalPrefecture() {
	return arrivalPrefecture;
}

public void setArrivalPrefecture(String arrivalPrefecture) {
	this.arrivalPrefecture = arrivalPrefecture;
}

public Integer getRowNum() {
	return rowNum;
}

public void setRowNum(Integer rowNum) {
	this.rowNum = rowNum;
}

public Integer getColumnNum() {
	return columnNum;
}

public void setColumnNum(Integer columnNum) {
	this.columnNum = columnNum;
}

public Integer getAvailableSeats() {
	return availableSeats;
}

public void setAvailableSeats(Integer availableSeats) {
	this.availableSeats = availableSeats;
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

public String getDepartureStationName() {
	return departureStationName;
}

public void setDepartureStationName(String departureStationName) {
	this.departureStationName = departureStationName;
}

public Integer getArrivalId() {
	return arrivalId;
}

public void setArrivalId(Integer arrivalId) {
	this.arrivalId = arrivalId;
}

public String getArrivalStationName() {
	return arrivalStationName;
}

public void setArrivalStationName(String arrivalStationName) {
	this.arrivalStationName = arrivalStationName;
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
