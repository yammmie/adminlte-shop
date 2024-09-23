package com.shopping.domain;

import java.util.Date;

public class OrderVO {
	private int ord_code;
	private String member_id;
	private String ord_name;
	private String ord_zipcode;
	private String ord_addr;
	private String ord_detailaddr;
	private String ord_tel;
	private int ord_price;
	private Date ord_regdate;
	
	public int getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(int ord_code) {
		this.ord_code = ord_code;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getOrd_name() {
		return ord_name;
	}
	public void setOrd_name(String ord_name) {
		this.ord_name = ord_name;
	}
	public String getOrd_zipcode() {
		return ord_zipcode;
	}
	public void setOrd_zipcode(String ord_zipcode) {
		this.ord_zipcode = ord_zipcode;
	}
	public String getOrd_addr() {
		return ord_addr;
	}
	public void setOrd_addr(String ord_addr) {
		this.ord_addr = ord_addr;
	}
	public String getOrd_detailaddr() {
		return ord_detailaddr;
	}
	public void setOrd_detailaddr(String ord_detailaddr) {
		this.ord_detailaddr = ord_detailaddr;
	}
	public String getOrd_tel() {
		return ord_tel;
	}
	public void setOrd_tel(String ord_tel) {
		this.ord_tel = ord_tel;
	}
	public int getOrd_price() {
		return ord_price;
	}
	public void setOrd_price(int ord_price) {
		this.ord_price = ord_price;
	}
	public Date getOrd_regdate() {
		return ord_regdate;
	}
	public void setOrd_regdate(Date ord_regdate) {
		this.ord_regdate = ord_regdate;
	}
	
	@Override
	public String toString() {
		return "OrderVO [ord_code=" + ord_code + ", member_id=" + member_id + ", ord_name=" + ord_name
				+ ", ord_zipcode=" + ord_zipcode + ", ord_addr=" + ord_addr + ", ord_detailaddr=" + ord_detailaddr
				+ ", ord_tel=" + ord_tel + ", ord_price=" + ord_price + ", ord_regdate=" + ord_regdate + "]";
	}
}
