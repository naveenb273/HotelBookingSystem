/**
 * 
 */
package com.mindtree.hbs.model;

import java.util.LinkedList;
import java.util.List;
import java.util.TreeSet;

/**
 * 
 */
public class RoomBookingVO {

    private String msg;
    private List<String> cityNameList;
    private List<String> hotelNameList;
    private String cityName;
    private String hotelName;
    private String checkInDate;
    private String checkOutDate;
    private int numOfRooms;
    private String firstName;
    private String lastName;
    private String dateOfBirth;
    private String phNumber;
    private String emailId;
    private String address;
    private String referenceType;
    private String referenceNum;
    private TreeSet<Integer> roomNumbers;
    private int maxBookingId;
    private TreeSet<Integer> roomsBooked;
    private String bookingRefId;
    private int totalTariff;
    private LinkedList<Integer> tariffList;
    
    /**
     * @return the msg
     */
    public String getMsg() {
        return msg;
    }
    /**
     * @param msg the msg to set
     */
    public void setMsg(String msg) {
        this.msg = msg;
    }
    /**
     * @return the cityNameList
     */
    public List<String> getCityNameList() {
        return cityNameList;
    }
    /**
     * @param cityNameList the cityNameList to set
     */
    public void setCityNameList(List<String> cityNameList) {
        this.cityNameList = cityNameList;
    }
    /**
     * @return the hotelNameList
     */
    public List<String> getHotelNameList() {
        return hotelNameList;
    }
    /**
     * @param hotelNameList the hotelNameList to set
     */
    public void setHotelNameList(List<String> hotelNameList) {
        this.hotelNameList = hotelNameList;
    }
    /**
     * @return the cityName
     */
    public String getCityName() {
        return cityName;
    }
    /**
     * @param cityName the cityName to set
     */
    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
    /**
     * @return the hotelName
     */
    public String getHotelName() {
        return hotelName;
    }
    /**
     * @param hotelName the hotelName to set
     */
    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }
    /**
     * @return the checkInDate
     */
    public String getCheckInDate() {
        return checkInDate;
    }
    /**
     * @param checkInDate the checkInDate to set
     */
    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }
    /**
     * @return the checkOutDate
     */
    public String getCheckOutDate() {
        return checkOutDate;
    }
    /**
     * @param checkOutDate the checkOutDate to set
     */
    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }
    /**
     * @return the numOfRooms
     */
    public int getNumOfRooms() {
        return numOfRooms;
    }
    /**
     * @param numOfRooms the numOfRooms to set
     */
    public void setNumOfRooms(int numOfRooms) {
        this.numOfRooms = numOfRooms;
    }
    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }
    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }
    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    /**
     * @return the dateOfBirth
     */
    public String getDateOfBirth() {
        return dateOfBirth;
    }
    /**
     * @param dateOfBirth the dateOfBirth to set
     */
    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    /**
     * @return the phNumber
     */
    public String getPhNumber() {
        return phNumber;
    }
    /**
     * @param phNumber the phNumber to set
     */
    public void setPhNumber(String phNumber) {
        this.phNumber = phNumber;
    }
    /**
     * @return the emailId
     */
    public String getEmailId() {
        return emailId;
    }
    /**
     * @param emailId the emailId to set
     */
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }
    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }
    /**
     * @return the referenceType
     */
    public String getReferenceType() {
        return referenceType;
    }
    /**
     * @param referenceType the referenceType to set
     */
    public void setReferenceType(String referenceType) {
        this.referenceType = referenceType;
    }
    /**
     * @return the referenceNum
     */
    public String getReferenceNum() {
        return referenceNum;
    }
    /**
     * @param referenceNum the referenceNum to set
     */
    public void setReferenceNum(String referenceNum) {
        this.referenceNum = referenceNum;
    }
    /**
     * @return the roomNumbers
     */
    public TreeSet<Integer> getRoomNumbers() {
        return roomNumbers;
    }
    /**
     * @param roomNumbers the roomNumbers to set
     */
    public void setRoomNumbers(TreeSet<Integer> roomNumbers) {
        this.roomNumbers = roomNumbers;
    }
    /**
     * @return the maxBookingId
     */
    public int getMaxBookingId() {
        return maxBookingId;
    }
    /**
     * @param maxBookingId the maxBookingId to set
     */
    public void setMaxBookingId(int maxBookingId) {
        this.maxBookingId = maxBookingId;
    }
    /**
     * @return the roomsBooked
     */
    public TreeSet<Integer> getRoomsBooked() {
        return roomsBooked;
    }
    /**
     * @param roomsBooked the roomsBooked to set
     */
    public void setRoomsBooked(TreeSet<Integer> roomsBooked) {
        this.roomsBooked = roomsBooked;
    }
    /**
     * @return the bookingRefId
     */
    public String getBookingRefId() {
        return bookingRefId;
    }
    /**
     * @param bookingRefId the bookingRefId to set
     */
    public void setBookingRefId(String bookingRefId) {
        this.bookingRefId = bookingRefId;
    }
    /**
     * @return the totalTariff
     */
    public int getTotalTariff() {
        return totalTariff;
    }
    /**
     * @param totalTariff the totalTariff to set
     */
    public void setTotalTariff(int totalTariff) {
        this.totalTariff = totalTariff;
    }
    /**
     * @return the tariffList
     */
    public LinkedList<Integer> getTariffList() {
        return tariffList;
    }
    /**
     * @param tariffList the tariffList to set
     */
    public void setTariffList(LinkedList<Integer> tariffList) {
        this.tariffList = tariffList;
    }
}