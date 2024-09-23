package com.shopping.domain;

public class CartVO {
	private int cart_code;
	private int pro_code;
	private String member_id;
	private int cart_amount;
	
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}
	
	@Override
	public String toString() {
		return "CartVO [cart_code=" + cart_code + ", pro_code=" + pro_code + ", member_id=" + member_id
				+ ", cart_amount=" + cart_amount + "]";
	}
}
