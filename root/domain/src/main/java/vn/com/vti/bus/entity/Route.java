package vn.com.vti.bus.entity;


import java.security.Timestamp;
import java.util.Date;

public class Route {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.route_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    private Integer routeId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.departure_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    private Integer departureId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.arrival_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    private Integer arrivalId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.price
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    private Integer price;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.bus_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    private Integer busId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.operation_start_date
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    private Date operationStartDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.operation_end_date
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    private Date operationEndDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.scheduled_departure_time
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    private Timestamp scheduledDepartureTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.scheduled_arrival_time
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    private Timestamp scheduledArrivalTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.route_id
     *
     * @return the value of public.route.route_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public Integer getRouteId() {
        return routeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.route_id
     *
     * @param routeId the value for public.route.route_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public void setRouteId(Integer routeId) {
        this.routeId = routeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.departure_id
     *
     * @return the value of public.route.departure_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public Integer getDepartureId() {
        return departureId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.departure_id
     *
     * @param departureId the value for public.route.departure_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public void setDepartureId(Integer departureId) {
        this.departureId = departureId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.arrival_id
     *
     * @return the value of public.route.arrival_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public Integer getArrivalId() {
        return arrivalId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.arrival_id
     *
     * @param arrivalId the value for public.route.arrival_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public void setArrivalId(Integer arrivalId) {
        this.arrivalId = arrivalId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.price
     *
     * @return the value of public.route.price
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public Integer getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.price
     *
     * @param price the value for public.route.price
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public void setPrice(Integer price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.bus_id
     *
     * @return the value of public.route.bus_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public Integer getBusId() {
        return busId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.bus_id
     *
     * @param busId the value for public.route.bus_id
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public void setBusId(Integer busId) {
        this.busId = busId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.operation_start_date
     *
     * @return the value of public.route.operation_start_date
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public Date getOperationStartDate() {
        return operationStartDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.operation_start_date
     *
     * @param operationStartDate the value for public.route.operation_start_date
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public void setOperationStartDate(Date operationStartDate) {
        this.operationStartDate = operationStartDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.operation_end_date
     *
     * @return the value of public.route.operation_end_date
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public Date getOperationEndDate() {
        return operationEndDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.operation_end_date
     *
     * @param operationEndDate the value for public.route.operation_end_date
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public void setOperationEndDate(Date operationEndDate) {
        this.operationEndDate = operationEndDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.scheduled_departure_time
     *
     * @return the value of public.route.scheduled_departure_time
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public Timestamp getScheduledDepartureTime() {
        return scheduledDepartureTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.scheduled_departure_time
     *
     * @param scheduledDepartureTime the value for public.route.scheduled_departure_time
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public void setScheduledDepartureTime(Timestamp scheduledDepartureTime) {
        this.scheduledDepartureTime = scheduledDepartureTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.scheduled_arrival_time
     *
     * @return the value of public.route.scheduled_arrival_time
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public Timestamp getScheduledArrivalTime() {
        return scheduledArrivalTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.scheduled_arrival_time
     *
     * @param scheduledArrivalTime the value for public.route.scheduled_arrival_time
     *
     * @mbg.generated Fri Oct 28 23:10:12 JST 2022
     */
    public void setScheduledArrivalTime(Timestamp scheduledArrivalTime) {
        this.scheduledArrivalTime = scheduledArrivalTime;
    }

	
}