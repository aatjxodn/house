package com.mystudy.house.model.vo;

public class CartviewVO {

	private String id;
	private int count, productNum;
	private String productName;
	private int productPrice, stock;
	private String companyName, imagefile;
	private int shipping;
	private int totp;
	
	//값계산
	public void computeTotAvg() {
		totp = productPrice*count;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
		computeTotAvg();
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
		computeTotAvg();
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getImagefile() {
		return imagefile;
	}
	public void setImagefile(String imagefile) {
		this.imagefile = imagefile;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	public int getTotp() {
		return totp;
	}
	public void setTotp(int totp) {
		this.totp = totp;
	}
	
	
	@Override
	public String toString() {
		return "CartviewVO [id=" + id + ", count=" + count + ", productNum=" + productNum + ", productName="
				+ productName + ", productPrice=" + productPrice + ", stock=" + stock + ", companyName=" + companyName
				+ ", imagefile=" + imagefile + ", shipping=" + shipping + "]";
	}
	
}
