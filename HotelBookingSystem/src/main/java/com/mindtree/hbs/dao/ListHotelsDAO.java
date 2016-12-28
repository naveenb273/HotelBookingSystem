/**
 * 
 */
package com.mindtree.hbs.dao;

import java.sql.SQLException;

import com.mindtree.hbs.model.RoomBookingVO;

/**
 * 
 */
public interface ListHotelsDAO {

    void getListOfHotelNamest(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException;

}
