package com.mindtree.hbs.model;

import java.util.List;

public class RoomBookingAjaxRes {

	private String msg;
	private List<String> cityNameList;
	private List<String> hotelNameList;
	private List<Integer> tariffList;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
    public List<String> getCityNameList() {
        return cityNameList;
    }
    
    public void setCityNameList(List<String> cityNameList) {
        this.cityNameList = cityNameList;
    }

    public List<String> getHotelNameList() {
        return hotelNameList;
    }
    
    public void setHotelNameList(List<String> hotelNameList) {
        this.hotelNameList = hotelNameList;
    }

    /**
     * @return the tariffList
     */
    public List<Integer> getTariffList() {
        return tariffList;
    }

    /**
     * @param tariffList the tariffList to set
     */
    public void setTariffList(List<Integer> tariffList) {
        this.tariffList = tariffList;
    }

    @Override
	public String toString() {
		return "AjaxResponseResult [msg=" + msg + ", code=" + ", result=" +  "]";
	}
}
