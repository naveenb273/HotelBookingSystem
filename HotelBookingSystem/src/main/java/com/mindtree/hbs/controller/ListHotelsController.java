/**
 * 
 */
package com.mindtree.hbs.controller;

import java.sql.SQLException;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mindtree.hbs.model.RoomBookingAjaxReq;
import com.mindtree.hbs.model.RoomBookingAjaxRes;
import com.mindtree.hbs.model.RoomBookingVO;
import com.mindtree.hbs.service.ListHotelsService;

/**
 * 
 */
@RestController
public class ListHotelsController {
    
    @RequestMapping(value = "/fetchListOfHotels", method = RequestMethod.POST)
    public RoomBookingAjaxRes fetchListOfHotels(@RequestBody RoomBookingAjaxReq roomBookingAjaxReq, ModelMap model){
        
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("root-context.xml");
        String reponseStr = "failure";

        ListHotelsService lhService = (ListHotelsService) context.getBean("lhService");
        RoomBookingAjaxRes result = (RoomBookingAjaxRes) context.getBean("roomBookingAjaxRes");
        RoomBookingVO rbVO = (RoomBookingVO) context.getBean("roomBookingVO");
        
        rbVO.setCityName(roomBookingAjaxReq.getCityName());
        boolean status  =   false;
        
        try {
            status  =   lhService.listHotelNames(rbVO);
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
        
        result.setHotelNameList(rbVO.getHotelNameList());
        result.setTariffList(rbVO.getTariffList());
        result.setMsg(rbVO.getMsg());
        model.addAttribute(reponseStr, rbVO.getMsg());
        return result;
    }
    
}