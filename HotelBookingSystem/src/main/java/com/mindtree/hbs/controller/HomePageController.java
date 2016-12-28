/**
 * 
 */
package com.mindtree.hbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 */
@Controller
public class HomePageController {
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String loadLoginPage(ModelMap model) {
        model.addAttribute("name", "Naveen");
        return "home";
    }

    @RequestMapping(value = "/goToRoomBooking", method = RequestMethod.GET)
    public String loadRoomBookingPage(ModelMap model) {
        model.addAttribute("name", "Naveen");
        return "bookroom";
    }
    
    @RequestMapping(value = "/goToListHotels", method = RequestMethod.GET)
    public String loadListHotelsPage(ModelMap model) {
        model.addAttribute("name", "Naveen");
        return "listhotels";
    }
}