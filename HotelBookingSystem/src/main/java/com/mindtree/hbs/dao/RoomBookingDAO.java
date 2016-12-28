/**
 * 
 */
package com.mindtree.hbs.dao;

import java.sql.SQLException;
import java.util.TreeSet;

import com.mindtree.hbs.model.RoomBookingVO;

/**
 * 
 */
public interface RoomBookingDAO {

    void getCityList(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException;

    void getHotelList(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException;

    TreeSet<Integer> getRoomNumbersBooked(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException;

    void bookRoom(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException;

    void getbookingDetails(RoomBookingVO rbVO, TreeSet<Integer> roomsAlreadyBooked) throws ClassNotFoundException, SQLException;

}