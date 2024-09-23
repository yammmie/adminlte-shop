package com.shopping.domain;

public class OrdDetailVO {
	private int ord_code;
	private int pro_code;
	private int ordtl_amount;
	private int ordtl_price;
	
	public int getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(int ord_code) {
		this.ord_code = ord_code;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public int getOrdtl_amount() {
		return ordtl_amount;
	}
	public void setOrdtl_amount(int ordtl_amount) {
		this.ordtl_amount = ordtl_amount;
	}
	public int getOrdtl_price() {
		return ordtl_price;
	}
	public void setOrdtl_price(int ordtl_price) {
		this.ordtl_price = ordtl_price;
	}
	
	@Override
	public String toString() {
		return "OrdDetailVO [ord_code=" + ord_code + ", pro_code=" + pro_code + ", ordtl_amount=" + ordtl_amount
				+ ", ordtl_price=" + ordtl_price + "]";
	}
}
