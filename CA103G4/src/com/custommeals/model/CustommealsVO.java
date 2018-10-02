package com.custommeals.model;

import com.menu.model.MenuVO;

public class CustommealsVO extends MenuVO implements java.io.Serializable {

	private String custom_No;
	private String mem_No;
	private String custom_Name;
	private Integer custom_Price;
//	private byte[] custom_Photo;

	public CustommealsVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CustommealsVO(String custom_No, String mem_No, String custom_Name, Integer custom_Price) {
		super();
		this.custom_No = custom_No;
		this.mem_No = mem_No;
		this.custom_Name = custom_Name;
		this.custom_Price = custom_Price;
//		this.custom_Photo = custom_Photo;
	}

	
	public String getcustom_No() {
		// TODO Auto-generated method stub
		return custom_No;
	}
	
	public void setcustom_No(String custom_No) {
		this.custom_No = custom_No;
	}

	public String getmem_No() {
		// TODO Auto-generated method stub
		return mem_No;
	}
	
	public void setmem_No(String mem_No) {
		this.mem_No = mem_No;
	}
	
	public String getcustom_Name() {
		// TODO Auto-generated method stub
		return custom_Name;
	}
	
	public void setcustom_Name(String custom_Name) {
		this.custom_Name = custom_Name;
	}

	public int getcustom_Price() {
		// TODO Auto-generated method stub
		return custom_Price;
	}
	
	public void setcustom_Price(Integer custom_Price) {
		this.custom_Price = custom_Price;
	}
	
;
//	public byte[] getcustom_Photo() {
//		return custom_Photo;
//	}
//	
//	public void setcustom_Photo(byte[] custom_Photo) {
//		this.custom_Photo = custom_Photo;
//	}
	

}
