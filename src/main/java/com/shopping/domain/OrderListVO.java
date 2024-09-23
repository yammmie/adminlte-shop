package com.shopping.domain;

// 관리자
public class OrderListVO {
	private int ord_code;
	private String pro_img;
	private String pro_name;
	private int ordtl_amount;
	private int ordtl_price;
	private String ord_regdate;
	
	public int getOrd_code() {
		return ord_code;
	}
	public void setOrd_code(int ord_code) {
		this.ord_code = ord_code;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
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
	public String getOrd_regdate() {
		return ord_regdate;
	}
	public void setOrd_regdate(String ord_regdate) {
		this.ord_regdate = ord_regdate;
	}
	
	@Override
	public String toString() {
		return "OrderListVO [ord_code=" + ord_code + ", pro_img=" + pro_img + ", pro_name=" + pro_name
				+ ", ordtl_amount=" + ordtl_amount + ", ordtl_price=" + ordtl_price + ", ord_regdate=" + ord_regdate
				+ "]";
	}
}
