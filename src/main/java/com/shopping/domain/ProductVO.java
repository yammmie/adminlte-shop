package com.shopping.domain;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private int pro_code;
	private String cate_code; // 하위 카테고리 코드
	private String cate_prtcode; // 상위 카테고리 코드
	private String pro_name;
	private int pro_price;
	private int pro_discount;
	private String pro_company;
	private String pro_content;
	private String pro_img; // 썸네일 파일명
	private int pro_amount;
	private String pro_buy = "Y";
	
	private MultipartFile file1; // 파일 추가
	
	public int getPro_code() {
		return pro_code;
	}
	public void setPro_code(int pro_code) {
		this.pro_code = pro_code;
	}
	public String getCate_code() {
		return cate_code;
	}
	public void setCate_code(String cate_code) {
		this.cate_code = cate_code;
	}
	public String getCate_prtcode() {
		return cate_prtcode;
	}
	public void setCate_prtcode(String cate_prtcode) {
		this.cate_prtcode = cate_prtcode;
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
	public int getPro_discount() {
		return pro_discount;
	}
	public void setPro_discount(int pro_discount) {
		this.pro_discount = pro_discount;
	}
	public String getPro_company() {
		return pro_company;
	}
	public void setPro_company(String pro_company) {
		this.pro_company = pro_company;
	}
	public String getPro_content() {
		return pro_content;
	}
	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}
	public int getPro_amount() {
		return pro_amount;
	}
	public void setPro_amount(int pro_amount) {
		this.pro_amount = pro_amount;
	}
	public String getPro_buy() {
		return pro_buy;
	}
	public void setPro_buy(String pro_buy) {
		this.pro_buy = pro_buy;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pro_code=" + pro_code + ", cate_code=" + cate_code + ", cate_prtcode=" + cate_prtcode
				+ ", pro_name=" + pro_name + ", pro_price=" + pro_price + ", pro_discount=" + pro_discount
				+ ", pro_company=" + pro_company + ", pro_content=" + pro_content + ", pro_img=" + pro_img
				+ ", pro_amount=" + pro_amount + ", pro_buy=" + pro_buy + ", file1=" + file1 + "]";
	}
}
