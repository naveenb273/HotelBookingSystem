/**
 * 
 */
package com.mindtree.hbs.service;

import java.sql.SQLException;
import java.util.TreeSet;

import com.mindtree.hbs.dao.RoomBookingDAO;
import com.mindtree.hbs.model.RoomBookingVO;

/**
 * 
 */
public class RoomBookingServiceImpl implements RoomBookingService {

    public  RoomBookingDAO roomBookingDAO;
    
    
    public void setRoomBookingDAO(RoomBookingDAO roomBookingDAO) {
        this.roomBookingDAO = roomBookingDAO;
    }
    
    @Override
    public boolean getCityList(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException {

        roomBookingDAO.getCityList(rbVO);
        
        if(rbVO.getCityNameList().isEmpty()){
            rbVO.setMsg("Currently there are no Cities available!");
        }
        return true;
    }

    @Override
    public boolean getHotelList(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException {
        
        roomBookingDAO.getHotelList(rbVO);
        
        if(rbVO.getHotelNameList().isEmpty()){
            rbVO.setMsg("Currently there are no Hotels available in the selected City!");
        }
        
        return true;
    }

    @Override
    public boolean bookRoom(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException {

        final TreeSet<Integer> roomsAlreadyBooked    =   roomBookingDAO.getRoomNumbersBooked(rbVO);
        // get booking details - available room numbers, max booking Id
        roomBookingDAO.getbookingDetails(rbVO, roomsAlreadyBooked);
        if(rbVO.getRoomNumbers().size()  <   rbVO.getNumOfRooms()){
            rbVO.setMsg("The Specified number of rooms are currently not available for the preferred Hotel and preferred Hotel!");
        } else {
            roomBookingDAO.bookRoom(rbVO);
        }
        
        return true;
    }

}
