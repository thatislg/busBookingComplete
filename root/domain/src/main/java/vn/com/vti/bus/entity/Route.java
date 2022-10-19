package vn.com.vti.bus.entity;

import java.util.Date;

public class Route {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.departure_bus_stop_id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    private Integer departureBusStopId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.arrival_bus_stop_id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    private Integer arrivalBusStopId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.departure_time
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    private Date departureTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.arrival_time
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    private Date arrivalTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.price
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    private Integer price;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.bus_id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    private Integer busId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.run_start_date
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    private Date runStartDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column public.route.run_end_date
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    private Date runEndDate;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.id
     *
     * @return the value of public.route.id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.id
     *
     * @param id the value for public.route.id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.departure_bus_stop_id
     *
     * @return the value of public.route.departure_bus_stop_id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public Integer getDepartureBusStopId() {
        return departureBusStopId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.departure_bus_stop_id
     *
     * @param departureBusStopId the value for public.route.departure_bus_stop_id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setDepartureBusStopId(Integer departureBusStopId) {
        this.departureBusStopId = departureBusStopId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.arrival_bus_stop_id
     *
     * @return the value of public.route.arrival_bus_stop_id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public Integer getArrivalBusStopId() {
        return arrivalBusStopId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.arrival_bus_stop_id
     *
     * @param arrivalBusStopId the value for public.route.arrival_bus_stop_id
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setArrivalBusStopId(Integer arrivalBusStopId) {
        this.arrivalBusStopId = arrivalBusStopId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.departure_time
     *
     * @return the value of public.route.departure_time
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public Date getDepartureTime() {
        return departureTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.departure_time
     *
     * @param departureTime the value for public.route.departure_time
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.arrival_time
     *
     * @return the value of public.route.arrival_time
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public Date getArrivalTime() {
        return arrivalTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.arrival_time
     *
     * @param arrivalTime the value for public.route.arrival_time
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setArrivalTime(Date arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.price
     *
     * @return the value of public.route.price
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
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
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
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
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
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
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setBusId(Integer busId) {
        this.busId = busId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.run_start_date
     *
     * @return the value of public.route.run_start_date
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public Date getRunStartDate() {
        return runStartDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.run_start_date
     *
     * @param runStartDate the value for public.route.run_start_date
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setRunStartDate(Date runStartDate) {
        this.runStartDate = runStartDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column public.route.run_end_date
     *
     * @return the value of public.route.run_end_date
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public Date getRunEndDate() {
        return runEndDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column public.route.run_end_date
     *
     * @param runEndDate the value for public.route.run_end_date
     *
     * @mbg.generated Tue Jun 02 05:35:19 JST 2020
     */
    public void setRunEndDate(Date runEndDate) {
        this.runEndDate = runEndDate;
    }
}