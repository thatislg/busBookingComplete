package vn.com.vti.bus.frontend.form;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

public class SearchResultForm {
	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date departureDate;
	
	@NotNull
	private String searchedDepartureName;
	
	@NotNull
	private String searchedArrivalName;
	
	@NotNull
	private String routeId;
	
	@NotNull
	private String busId;
	
	
	public String getRouteId() {
		return routeId;
	}


	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}


	public String getBusId() {
		return busId;
	}


	public void setBusId(String busId) {
		this.busId = busId;
	}


	public SearchResultForm(Date departureDate, String searchedDepartureName, String searchedArrivalName
							,String routeId, String busId) {
		this.departureDate = departureDate;
		this.searchedDepartureName = searchedDepartureName;
		this.searchedArrivalName = searchedArrivalName;
		this.routeId = routeId;
		this.busId = busId;
	}
	
	
	public Date getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}

	public String getSearchedDepartureName() {
		return searchedDepartureName;
	}

	public void setSearchedDepartureName(String searchedDepartureName) {
		this.searchedDepartureName = searchedDepartureName;
	}

	public String getSearchedArrivalName() {
		return searchedArrivalName;
	}

	public void setSearchedArrivalName(String searchedArrivalName) {
		this.searchedArrivalName = searchedArrivalName;
	}
	
	

}
