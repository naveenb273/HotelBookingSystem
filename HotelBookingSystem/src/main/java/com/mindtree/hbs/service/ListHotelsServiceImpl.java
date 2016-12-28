/**
 * 
 */
package com.mindtree.hbs.service;

import java.sql.SQLException;

import com.mindtree.hbs.dao.ListHotelsDAO;
import com.mindtree.hbs.model.RoomBookingVO;

/**
 * 
 */
public class ListHotelsServiceImpl implements ListHotelsService {
    
    public  ListHotelsDAO listHotelsDAO;
    
    public void setListHotelsDAO(ListHotelsDAO listHotelsDAO) {
        this.listHotelsDAO = listHotelsDAO;
    }

    @Override
    public boolean listHotelNames(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException {
        
        listHotelsDAO.getListOfHotelNamest(rbVO);
        
        if(rbVO.getHotelNameList().isEmpty()){
            rbVO.setMsg("Currently there are no Hotels available in the selected City!");
        }
        
        return true;
    }

}
