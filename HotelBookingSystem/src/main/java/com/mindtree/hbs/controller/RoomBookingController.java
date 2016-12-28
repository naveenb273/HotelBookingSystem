/**
 * 
 */
package com.mindtree.hbs.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mindtree.hbs.model.RoomBookingAjaxReq;
import com.mindtree.hbs.model.RoomBookingAjaxRes;
import com.mindtree.hbs.model.RoomBookingVO;
import com.mindtree.hbs.service.RoomBookingService;

/**
 * 
 */
@RestController
public class RoomBookingController {

    @RequestMapping(value = "/goToRoomBooking/fetchCityList", method = RequestMethod.GET)
    public RoomBookingAjaxRes fetchCityList(ModelMap model){
        
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
        String reponseStr = "failure";

        RoomBookingService rbService = (RoomBookingService) context.getBean("rbService");
        RoomBookingAjaxRes result = (RoomBookingAjaxRes) context.getBean("roomBookingAjaxRes");
        RoomBookingVO rbVO = (RoomBookingVO) context.getBean("roomBookingVO");
        
        boolean status  =   false;
        
        try {
            status  =   rbService.getCityList(rbVO);
        } catch (ClassNotFoundException cNFE) {
            rbVO.setMsg("ClassNotFoundException Occured");
            System.out.println("ClassNotFoundException occured :: "+cNFE);
            cNFE.printStackTrace();
        } catch (SQLException sqlE) {
            rbVO.setMsg("SQLException Occured");
            System.out.println("SQLException occured :: "+sqlE);
            sqlE.printStackTrace();
        } finally{
            context.close();
        }
        
        if(status){
            reponseStr  =   "success";
            rbVO.setMsg("");
        }
        
        result.setCityNameList(rbVO.getCityNameList());
        result.setMsg(rbVO.getMsg());
        model.addAttribute(reponseStr, rbVO.getMsg());
        return result;
        
    }
    
    @RequestMapping(value = "/goToRoomBooking/fetchHotelList", method = RequestMethod.POST)
    public RoomBookingAjaxRes fetchHotelList(@RequestBody RoomBookingAjaxReq roomBookingAjaxReq, ModelMap model){
        
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
        String reponseStr = "failure";

        RoomBookingService rbService = (RoomBookingService) context.getBean("rbService");
        RoomBookingAjaxRes result = (RoomBookingAjaxRes) context.getBean("roomBookingAjaxRes");
        RoomBookingVO rbVO = (RoomBookingVO) context.getBean("roomBookingVO");
        
        rbVO.setCityName(roomBookingAjaxReq.getCityName());
        boolean status  =   false;
        
        try {
            status  =   rbService.getHotelList(rbVO);
        } catch (ClassNotFoundException cNFE) {
            rbVO.setMsg("ClassNotFoundException Occured");
            System.out.println("ClassNotFoundException occured :: "+cNFE);
            cNFE.printStackTrace();
        } catch (SQLException sqlE) {
            rbVO.setMsg("SQLException Occured");
            System.out.println("SQLException occured :: "+sqlE);
            sqlE.printStackTrace();
        } finally{
            context.close();
        }
        
        if(status){
            reponseStr  =   "success";
            rbVO.setMsg("");
        }
        
        if(result.getHotelNameList() !=  null){
            result.getHotelNameList().clear();
        }
        result.setHotelNameList(rbVO.getHotelNameList());
        result.setMsg(rbVO.getMsg());
        model.addAttribute(reponseStr, rbVO.getMsg());
        return result;
    }
    
    @RequestMapping(value = "/goToRoomBooking/bookRoom", method = RequestMethod.POST)
    public RoomBookingAjaxRes bookRoom(@RequestBody RoomBookingAjaxReq roomBookingAjaxReq, ModelMap model){
        
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
        String reponseStr = "failure";

        RoomBookingService rbService = (RoomBookingService) context.getBean("rbService");
        RoomBookingAjaxRes result = (RoomBookingAjaxRes) context.getBean("roomBookingAjaxRes");
        RoomBookingVO rbVO = (RoomBookingVO) context.getBean("roomBookingVO");
        
        boolean status  =   false;
        
        final String cityName = roomBookingAjaxReq.getCityName();
        final String hotelName = roomBookingAjaxReq.getHotelName();
        final String checkInDateStr = roomBookingAjaxReq.getCheckInDate();
        final String checkOutDateStr = roomBookingAjaxReq.getCheckOutDate();
        final int numOfRooms = roomBookingAjaxReq.getNumOfRooms();
        final String firstName = roomBookingAjaxReq.getFirstName();
        final String lastName = roomBookingAjaxReq.getLastName();
        final String dateOfBirthStr = roomBookingAjaxReq.getDateOfBirth();
        final String phNumber = roomBookingAjaxReq.getPhNumber();
        final String emailId = roomBookingAjaxReq.getEmailId();
        final String address = roomBookingAjaxReq.getAddress();
        String referenceType = roomBookingAjaxReq.getReferenceType();
        if("PP".equals(referenceType)){
            referenceType   =   "Passport";
        } else if("AC".equals(referenceType)){
            referenceType   =   "Aadhaar Card";
        } else if("EIC".equals(referenceType)){
            referenceType   =   "Election ID Card";
        } else if("RC".equals(referenceType)){
            referenceType   =   "Ration Card";
        }
        final String referenceNum = roomBookingAjaxReq.getReferenceNum();
        
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
        Date checkInDate = null;
        Date checkOutDate = null;
        Date dateOfBirth = null;
        Date currentDate = new Date();
        try {
            if("".equals(checkInDateStr)){
                rbVO.setMsg("Please Select Check In Date!");
            } else {
                checkInDate = sdf.parse(checkInDateStr);
            }
            if("".equals(checkOutDateStr)){
                rbVO.setMsg("Please Select Check Out Date!");
            } else {
                checkOutDate = sdf.parse(checkOutDateStr);
            }
            if("".equals(dateOfBirthStr)){
                rbVO.setMsg("Please Select Check Out Date!");
            } else {
                dateOfBirth = sdf.parse(dateOfBirthStr);
            }
        } catch (ParseException pE) {
            rbVO.setMsg("ParseException Occured");
            System.out.println("ParseException occured :: "+pE);
            pE.printStackTrace();
        }
        if("CC".equals(cityName)){
            rbVO.setMsg("Please Select City Name!");
        } else if("CH".equals(hotelName)){
            rbVO.setMsg("Please Select Hotel Name!");
        } else if("".equals(checkInDateStr)){
            rbVO.setMsg("Please Select Check In Date!");
        } else if(currentDate.compareTo(checkInDate) > 0){
            rbVO.setMsg("Check In Date cannot be before Current Date!");
        } else if(currentDate.compareTo(checkOutDate) > 0){
            rbVO.setMsg("Check Out Date cannot be before Current Date!");
        } else if(checkInDate.compareTo(checkOutDate) > 0){
            rbVO.setMsg("Check Out Date cannot be before Check In Date!");
        } else if(numOfRooms    <   0){
            rbVO.setMsg("Please Enter Room Number!");
        } else if("".equals(firstName)){
            rbVO.setMsg("Please Enter First Name!");
        } else if("".equals(lastName)){
            rbVO.setMsg("Please Enter First Name!");
        } else if(dateOfBirth.compareTo(currentDate) > 0){
            rbVO.setMsg("Date Of Birth cannot be After Current Date!");
        } else if("".equals(phNumber)){
            rbVO.setMsg("Please Enter Phone Number!");
        } else if("".equals(emailId)){
            rbVO.setMsg("Please Enter Email ID!");
        } else if("".equals(address)){
            rbVO.setMsg("Please Enter Address!");
        } else if("CRT".equals(referenceType)){
            rbVO.setMsg("Please Select Reference Type!");
        } else if("".equals(referenceNum)){
            rbVO.setMsg("Please Enter Reference Number!");
        } else {
            rbVO.setCityName(cityName);
            rbVO.setHotelName(hotelName);
            rbVO.setCheckInDate(checkInDateStr);
            rbVO.setCheckOutDate(checkOutDateStr);
            rbVO.setNumOfRooms(numOfRooms);
            rbVO.setFirstName(firstName);
            rbVO.setLastName(lastName);
            rbVO.setDateOfBirth(dateOfBirthStr);
            rbVO.setPhNumber(phNumber);
            rbVO.setEmailId(emailId);
            rbVO.setAddress(address);
            rbVO.setReferenceType(referenceType);
            rbVO.setReferenceNum(referenceNum);
            
            try {
                status  =   rbService.bookRoom(rbVO);
            } catch (ClassNotFoundException cNFE) {
                rbVO.setMsg("ClassNotFoundException Occured");
                System.out.println("ClassNotFoundException occured :: "+cNFE);
                cNFE.printStackTrace();
            } catch (SQLException sqlE) {
                rbVO.setMsg("SQLException Occured");
                System.out.println("SQLException occured :: "+sqlE);
                sqlE.printStackTrace();
            } finally{
                context.close();
            }
        }
        
        if(status){
            reponseStr  =   "success";
            rbVO.setMsg("Room Booking Successful with Booking Reference ID "+rbVO.getBookingRefId()+" and total tariff of "+rbVO.getTotalTariff()+" Rs");
        }
        
        result.setMsg(rbVO.getMsg());
        model.addAttribute(reponseStr, rbVO.getMsg());
        return result;
    }
    
}
