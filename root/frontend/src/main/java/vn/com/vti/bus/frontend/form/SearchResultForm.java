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
	
	@NotNull
	private String searchedDeparturePrefecture;
	
	@NotNull
	private String searchedArrivalPrefecture;
	
	
	
	
	public String getSearchedDeparturePrefecture() {
		return searchedDeparturePrefecture;
	}


	public void setSearchedDeparturePrefecture(String searchedDeparturePrefecture) {
		this.searchedDeparturePrefecture = searchedDeparturePrefecture;
	}


	public String getSearchedArrivalPrefecture() {
		return searchedArrivalPrefecture;
	}


	public void setSearchedArrivalPrefecture(String searchedArrivalPrefecture) {
		this.searchedArrivalPrefecture = searchedArrivalPrefecture;
	}


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
							,String routeId, String busId,String searchedDeparturePrefecture, String searchedArrivalPrefecture) {
		this.departureDate = departureDate;
		this.searchedDepartureName = searchedDepartureName;
		this.searchedArrivalName = searchedArrivalName;
		this.routeId = routeId;
		this.busId = busId;
		this.searchedDeparturePrefecture = searchedDeparturePrefecture;
		this.searchedArrivalPrefecture = searchedArrivalPrefecture;
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
