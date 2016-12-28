/**
 * 
 */
package com.mindtree.hbs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.mindtree.hbs.model.RoomBookingVO;

/**
 * 
 */
public class ListHotelsDAOImpl implements ListHotelsDAO {

    @Override
    public void getListOfHotelNamest(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException {
        Connection con  =    getConnection();
        fetchHotelLists(con, rbVO);    
    }

    private Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/hbsdb", "postgres", "A188109");
        } catch (ClassNotFoundException cNFE) {
            throw new ClassNotFoundException();
        } catch (SQLException sqlE) {
            throw new SQLException();
        }
        System.out.println("Opened database successfully");
        return con;
    }
    
    /**
     * select * from (SELECT DISTINCT ON (chl.hotel_name) chl.hotel_name AS hotel_name, hrl.tariff AS tariff FROM city_hotel_list chl 
     * LEFT JOIN hotel_room_list hrl ON hrl.hotel_name = chl.hotel_name where chl.city_name = 'Davanagere'
     * ORDER  BY chl.hotel_name, hrl.tariff asc) subquery order by tariff asc fetch first 5 rows only
     */
    private void fetchHotelLists(Connection con, RoomBookingVO rbVO) throws SQLException {
        final String stm = "select * from (SELECT DISTINCT ON (chl.hotel_name) chl.hotel_name AS hotel_name, hrl.tariff AS tariff FROM city_hotel_list chl "
                + "LEFT JOIN hotel_room_list hrl ON hrl.hotel_name = chl.hotel_name where chl.city_name = ? "
                + "ORDER  BY chl.hotel_name, hrl.tariff asc) subquery order by tariff asc fetch first 5 rows only";
        PreparedStatement  pst = null;
        ResultSet rs = null;
        LinkedList<String>    hotelList    =   new LinkedList<String>();
        LinkedList<Integer>    tarifflList    =   new LinkedList<Integer>();
        try {
            pst = con.prepareStatement(stm);
            pst.setString(1, rbVO.getCityName());
            rs = pst.executeQuery();
            while (rs.next()){
                hotelList.add(rs.getString(1));
                tarifflList.add(rs.getInt(2));
            }
        } catch (SQLException sqlE) {
            throw new SQLException();
        }finally{
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        System.out.println("A188109 : hotelList : "+hotelList);
        System.out.println("A188109 : tarifflList : "+tarifflList);
        rbVO.setHotelNameList(hotelList);
        rbVO.setTariffList(tarifflList);
    }
}
