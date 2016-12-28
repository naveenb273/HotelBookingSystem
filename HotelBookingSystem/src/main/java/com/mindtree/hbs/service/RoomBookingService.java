/**
 * 
 */
package com.mindtree.hbs.service;

import java.sql.SQLException;

import com.mindtree.hbs.model.RoomBookingVO;

/**
 * 
 */
public interface RoomBookingService {

    boolean getCityList(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException;

    boolean getHotelList(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException;

    boolean bookRoom(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException;

}
