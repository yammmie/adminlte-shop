package com.shopping.domain;

public class CartListVO {
	private int cart_code;
	private int pro_code;
	private String pro_name;
	private int pro_price;
	private String pro_img;
	private int cart_amount;
	private String member_id;
	
	public int getCart_code() {
		return cart_code;
	}
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	@Override
	public String toString() {
		return "CartListVO [cart_code=" + cart_code + ", pro_code=" + pro_code + ", pro_name=" + pro_name
				+ ", pro_price=" + pro_price + ", pro_img=" + pro_img + ", cart_amount=" + cart_amount + ", member_id="
				+ member_id + "]";
	}
}
