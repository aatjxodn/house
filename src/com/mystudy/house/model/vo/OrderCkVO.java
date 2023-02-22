package com.mystudy.house.model.vo;

public class OrderCkVO {

	private int cartNum;
	private String id;
	private int count, productNum;
	private String productName;
	private int productPrice;
	private int stock;
	private String companyName, imagefile;
	private int shipping, gradeNum;
	private String name, email, addr, phone, addrDetail;
	private int point;
	private int totp;
	
	//값계산
		public void computeTotAvg() {
			totp = productPrice*count;
		}
	
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
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
	public int getGradeNum() {
		return gradeNum;
	}
	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotp() {
		return totp;
	}
	public void setTotp(int totp) {
		this.totp = totp;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}


	@Override
	public String toString() {
		return "OrderCkVO [cartNum=" + cartNum + ", id=" + id + ", count=" + count + ", productNum=" + productNum
				+ ", productName=" + productName + ", productPrice=" + productPrice + ", stock=" + stock
				+ ", companyName=" + companyName + ", imagefile=" + imagefile + ", shipping=" + shipping + ", gradeNum="
				+ gradeNum + ", name=" + name + ", email=" + email + ", addr=" + addr + ", phone=" + phone + ", point="
				+ point + ", getCartNum()=" + getCartNum() + ", getId()=" + getId() + ", getCount()=" + getCount()
				+ ", getProductNum()=" + getProductNum() + ", getProductName()=" + getProductName()
				+ ", getProductPrice()=" + getProductPrice() + ", getStock()=" + getStock() + ", getCompanyName()="
				+ getCompanyName() + ", getImagefile()=" + getImagefile() + ", getShipping()=" + getShipping()
				+ ", getGradeNum()=" + getGradeNum() + ", getName()=" + getName() + ", getEmail()=" + getEmail()
				+ ", getAddr()=" + getAddr() + ", getPhone()=" + getPhone() + ", getPoint()=" + getPoint()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
