/**
 * 
 */
package com.mindtree.hbs.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import com.mindtree.hbs.model.RoomBookingVO;

/**
 * 
 */
public class RoomBookingDAOImpl implements RoomBookingDAO {

    /**
     * {@inheritDoc}
     * @throws SQLException 
     * @throws ClassNotFoundException 
     */

    @Override
    public void getCityList(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException {
        Connection con  =    getConnection();
        getCityNames(con, rbVO);
    }
    
    @Override
    public void getHotelList(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException {
        Connection con  =    getConnection();
        getHotelNames(con, rbVO);
    }
    
    @Override
    public TreeSet<Integer> getRoomNumbersBooked(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException {
        Connection con  =    getConnection();
        return getBookedRoomNums(con, rbVO);        
    }
    
    @Override
    public void getbookingDetails(RoomBookingVO rbVO, TreeSet<Integer> roomsAlreadyBooked) throws ClassNotFoundException, SQLException {
        Connection con  =    getConnection();
        getRequiredBookingDetails(con, rbVO, roomsAlreadyBooked);        
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
    
    private void getCityNames(Connection con, RoomBookingVO rbVO) throws SQLException {
        final String stm = "select distinct city_name from city_hotel_list";
        PreparedStatement  pst = null;
        ResultSet rs = null;
        List<String>    cityList    =   new ArrayList<String>();
        try {
            pst = con.prepareStatement(stm);
            rs = pst.executeQuery();
            while (rs.next()){
                cityList.add(rs.getString(1));
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
        System.out.println("A188109 : cityList : "+cityList);
        rbVO.setCityNameList(cityList);
    }

    private void getHotelNames(Connection con, RoomBookingVO rbVO) throws SQLException {
        final String stm = "select distinct hrl.hotel_name from city_hotel_list chl, hotel_room_list hrl where chl.hotel_name = hrl.hotel_name and chl.city_name like ?";
        PreparedStatement  pst = null;
        ResultSet rs = null;
        List<String>    hotelList    =   new ArrayList<String>();
        try {
            pst = con.prepareStatement(stm);
            pst.setString(1, "%"+rbVO.getCityName()+"%");
            rs = pst.executeQuery();
            while (rs.next()){
                hotelList.add(rs.getString(1));
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
        rbVO.setHotelNameList(hotelList);
    }
    
    private TreeSet<Integer> getBookedRoomNums(Connection con, RoomBookingVO rbVO) throws SQLException {

        final String stm1 = "select room_number from booking_details where hotel_name = ? and check_in_date <= to_date(?, 'mm/dd/yyyy') and check_out_date >= to_date(?, 'mm/dd/yyyy')";
        PreparedStatement  pst1 = null;
        ResultSet rs = null;
        TreeSet<Integer>  availableRooms    =   new TreeSet<Integer>();
        try {
            pst1 = con.prepareStatement(stm1);
            pst1.setString(1, rbVO.getHotelName());
            pst1.setString(2, rbVO.getCheckInDate());
            pst1.setString(3, rbVO.getCheckOutDate());
            rs = pst1.executeQuery();
            while (rs.next()){
                availableRooms.add(rs.getInt(1));
            }
        } catch (SQLException sqlE) {
            throw new SQLException();
        }finally{
            if (rs != null) {
                rs.close();
            }
            if (pst1 != null) {
                pst1.close();
            }
            if (con != null) {
                con.close();
            }
        }
        System.out.println("A188109 : availableRooms : "+availableRooms);
        return availableRooms;
    }
    
    private void getRequiredBookingDetails(Connection con, RoomBookingVO rbVO, TreeSet<Integer> roomsAlreadyBooked) throws SQLException {

        final String stm1 = "select max(booking_id) as max_booking_id from booking_details";
        
        StringBuffer stm2 = null;
        if(roomsAlreadyBooked.size()    >   0){
            Iterator<Integer> iterator = roomsAlreadyBooked.iterator();
            stm2 = new StringBuffer("select room_number from hotel_room_list where hotel_name  = ? and room_number not in ("+iterator.next());
            while (iterator.hasNext()) {
                stm2.append(", "+iterator.next());
            }
            stm2.append(")");
        } else {
            stm2 = new StringBuffer("select room_number from hotel_room_list where hotel_name  = ?");
        }
        
        final String stm3 = "select MAX(CAST(substring(booking_ref_id, 4) as Integer )) as booking_ref_id from booking_details";
        PreparedStatement  pst1 = null;
        PreparedStatement  pst2 = null;
        PreparedStatement  pst3 = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
        TreeSet<Integer> availableRooms    =   new TreeSet<Integer>();
        int bookingRefId    =   0;
        try {
            pst1 = con.prepareStatement(stm1);
            rs1 =   pst1.executeQuery();
            while (rs1.next()){
                rbVO.setMaxBookingId(rs1.getInt(1));
            }
            pst2 = con.prepareStatement(stm2.toString());
            pst2.setString(1, rbVO.getHotelName());
            rs2 = pst2.executeQuery();
            while (rs2.next()){
                availableRooms.add(rs2.getInt(1));
            }
            
            pst3 = con.prepareStatement(stm3);
           /* pst3.setString(1, rbVO.getCityName());
            pst3.setString(2, rbVO.getHotelName());*/
            rs3 = pst3.executeQuery();
            while (rs3.next()){
                bookingRefId    =   rs3.getInt(1)+1;
            }
        } catch (SQLException sqlE) {
            throw new SQLException();
        }finally{
            if (rs1 != null) {
                rs1.close();
            }
            if (rs2 != null) {
                rs2.close();
            }
            if (rs3 != null) {
                rs3.close();
            }
            if (pst1 != null) {
                pst1.close();
            }
            if (pst2 != null) {
                pst2.close();
            }
            if (pst3 != null) {
                pst3.close();
            }
            if (con != null) {
                con.close();
            }
        }
        
        if(bookingRefId < 10){
            rbVO.setBookingRefId("HBS"+"000"+bookingRefId);
        } else if(bookingRefId < 100){
            rbVO.setBookingRefId("HBS"+"00"+bookingRefId);
        } else if(bookingRefId < 1000){
            rbVO.setBookingRefId("HBS"+"0"+bookingRefId);
        } else {
            rbVO.setBookingRefId("HBS"+bookingRefId);
        }
        
        System.out.println("A188109 : maxBookingId : "+rbVO.getMaxBookingId());
        System.out.println("A188109 : availableRooms : "+availableRooms);
        System.out.println("A188109 : bookingRefId : "+rbVO.getBookingRefId());
        rbVO.setRoomNumbers(availableRooms);
        
    }
    
    @Override
    public void bookRoom(RoomBookingVO rbVO) throws ClassNotFoundException, SQLException {
        
        //bookRooms(con, rbVO);
        
        Connection  con = null;
        int returnNum   =   0;
        try {
            con = getConnection();
            con.setAutoCommit(false);
            returnNum   =   executeInsertCommand(con, rbVO);
            if(returnNum    ==  1){
                getTotalTariff(con, rbVO);
                con.commit();
            }
        } catch (SQLException sqlE) {
            con.rollback();
            throw new SQLException();
        } finally{
            if (con != null) {
                con.close();
            }
        }
    }
    
    private int executeInsertCommand(Connection con, RoomBookingVO rbVO) throws SQLException {

        final int numOfRooms    =   rbVO.getNumOfRooms();
        int maxBookingId    =   rbVO.getMaxBookingId();
        TreeSet<Integer> availableRooms   =   rbVO.getRoomNumbers();
        TreeSet<Integer> roomsBooked   =   new TreeSet<Integer>();
        Iterator<Integer> itr    =   availableRooms.iterator();
        final String stm1 = "INSERT INTO booking_details(booking_id, hotel_name, city_name, room_number, check_in_date, check_out_date, first_name, last_name, date_of_birth, ph_number, email_id, address, ref_id_type, ref_id_num, booking_ref_id) VALUES (?, ?, ?, ?, to_date(?, 'mm/dd/yyyy'), to_date(?, 'mm/dd/yyyy'), ?, ?, to_date(?, 'mm/dd/yyyy'), ?, ?, ?, ?, ?, ?)";
        PreparedStatement  pst1 = null;
        int result = 0;
        Integer nextRoomNum = 0;
        try {
            for (int i=0;i<numOfRooms;i++){
                nextRoomNum = itr.next();
                pst1 = con.prepareStatement(stm1);
                pst1.setInt(1, ++maxBookingId);
                pst1.setString(2, rbVO.getHotelName());
                pst1.setString(3, rbVO.getCityName());
                pst1.setInt(4, nextRoomNum);
                roomsBooked.add(nextRoomNum);
                pst1.setString(5, rbVO.getCheckInDate());
                pst1.setString(6, rbVO.getCheckOutDate());
                pst1.setString(7, rbVO.getFirstName());
                pst1.setString(8, rbVO.getLastName());
                pst1.setString(9, rbVO.getDateOfBirth());
                pst1.setBigDecimal(10, new BigDecimal(rbVO.getPhNumber()));
                pst1.setString(11, rbVO.getEmailId());
                pst1.setString(12, rbVO.getAddress());
                pst1.setString(13, rbVO.getReferenceType());
                pst1.setString(14, rbVO.getReferenceNum());
                pst1.setString(15, rbVO.getBookingRefId());
                result = pst1.executeUpdate();
                System.out.println("result :: "+result);
            }
        } catch (SQLException sqlE) {
            throw new SQLException();
        }finally{
            if (pst1 != null) {
                pst1.close();
            }
        }
        rbVO.setRoomsBooked(roomsBooked);
        return result;
    }
    
    private void getTotalTariff(Connection con, RoomBookingVO rbVO) throws SQLException {
        
        final TreeSet<Integer> roomsBooked = rbVO.getRoomsBooked();
        Iterator<Integer> iterator = roomsBooked.iterator();
        StringBuffer stm = new StringBuffer("select sum(tariff) as total_tariff from hotel_room_list where hotel_name = ? and room_number in ("+iterator.next());
        while (iterator.hasNext()) {
            stm.append(", "+iterator.next());
        }
        stm.append(")");
        PreparedStatement  pst = null;
        ResultSet rs = null;
        try {
            pst = con.prepareStatement(stm.toString());
            pst.setString(1, rbVO.getHotelName());
            rs = pst.executeQuery();
            while (rs.next()){
                rbVO.setTotalTariff(rs.getInt(1));
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
        }
        System.out.println("A188109 : totalTariff : "+rbVO.getTotalTariff());
    }
    
}