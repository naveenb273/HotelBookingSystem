package com.mindtree.hbs.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.TreeSet;

public class TestClass {

    public static void main(String[] args) {

        Connection con  =   getConnection();
        //getBookedRoomNums(con, "Taj Vivantha", "12/26/2016", "12/29/2016");
        TreeSet<Integer> roomsAlreadyBooked = new TreeSet<Integer>();
        roomsAlreadyBooked.add(1001);
        roomsAlreadyBooked.add(1002);
        roomsAlreadyBooked.add(1003);
        roomsAlreadyBooked.add(2001);
        roomsAlreadyBooked.add(2002);
        getRequiredBookingDetails(con, "Taj Vivantha", roomsAlreadyBooked);
    }

    private static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/hbsdb", "postgres", "A188109");
        } catch (ClassNotFoundException cNFE) {
            cNFE.printStackTrace();
        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
        }
        System.out.println("Opened database successfully");
        return con;
    }
    
    private static TreeSet<Integer> getBookedRoomNums(Connection con, final String hotelName, final String checkInDate, final String checkOutDate) {

        //final String stm1j = "set datestyle to MDY";
        final String stm2 = "select room_number from booking_details where hotel_name = ? and check_in_date <= to_date(?, 'mm/dd/yyyy') and check_out_date >= to_date(?, 'mm/dd/yyyy')";
        //PreparedStatement  pst1 = null;
        PreparedStatement  pst2 = null;
        ResultSet rs = null;
        TreeSet<Integer>  availableRooms    =   new TreeSet<Integer>();
        try {
            //pst1 = con.prepareStatement(stm1);
            //pst1.execute();
            pst2 = con.prepareStatement(stm2);
            pst2.setString(1, hotelName);
            pst2.setString(2, checkInDate);
            pst2.setString(3, checkOutDate);
            rs = pst2.executeQuery();
            while (rs.next()){
                availableRooms.add(rs.getInt(1));
            }
        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            System.out.println(sqlE);
        }finally{
            try {
                if (rs != null) {
                    rs.close();
                }
                /*if (pst1 != null) {
                    pst1.close();
                }*/
                if (pst2 != null) {
                    pst2.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException sqlE) {
                sqlE.printStackTrace();
            }
        }
        System.out.println("A188109 : availableRooms : "+availableRooms);
        return availableRooms;
    }
    
    private static void getRequiredBookingDetails(Connection con, final String hotelName, TreeSet<Integer> roomsAlreadyBooked){

        StringBuffer stm1 = null;
        if(roomsAlreadyBooked.size()    >   0){
            Iterator<Integer> iterator = roomsAlreadyBooked.iterator();
            stm1 = new StringBuffer("select room_number from hotel_room_list where hotel_name  = ? and room_number not in ("+iterator.next());
            while (iterator.hasNext()) {
                stm1.append(", "+iterator.next());
            }
            stm1.append(")");
        } else {
            stm1 = new StringBuffer("select room_number from hotel_room_list where hotel_name  = ?");
        }
        
        PreparedStatement  pst1 = null;
        ResultSet rs1 = null;
        TreeSet<Integer> availableRooms    =   new TreeSet<Integer>();
        try {

            pst1 = con.prepareStatement(stm1.toString());
            pst1.setString(1, hotelName);
            rs1 = pst1.executeQuery();
            while (rs1.next()){
                availableRooms.add(rs1.getInt(1));
            }
            
        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            System.out.println(sqlE);
        }finally{
            try {
                if (rs1 != null) {
                    rs1.close();
                }
                if (pst1 != null) {
                    pst1.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        
        System.out.println("A188109 : availableRooms : "+availableRooms);
        
    }
}
