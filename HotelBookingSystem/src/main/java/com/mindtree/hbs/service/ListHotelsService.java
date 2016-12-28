/**
 * 
 */
package com.mindtree.hbs.service;

import java.sql.SQLException;

import com.mindtree.hbs.model.RoomBookingVO;

/**
 * 
 */
public interface ListHotelsService {

    boolean listHotelNames(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException;
}
