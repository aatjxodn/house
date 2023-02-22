package com.mystudy.house.model.vo;

public class ProductImgVO {

	private int productNum,	categoryNum, partnerNum;
	private String productName, productInfo;
	private int productPrice, stock, sales;
	private String categoryDetail, imagefile, companyName;
	private int shipping;
	
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public int getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(int partnerNum) {
		this.partnerNum = partnerNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
	}
	public String getCategoryDetail() {
		return categoryDetail;
	}
	public void setCategoryDetail(String categoryDetail) {
		this.categoryDetail = categoryDetail;
	}
	public String getImagefile() {
		return imagefile;
	}
	public void setImagefile(String imagefile) {
		this.imagefile = imagefile;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	
	@Override
	public String toString() {
		return "ProductImgVO [productNum=" + productNum + ", categoryNum=" + categoryNum + ", partnerNum=" + partnerNum
				+ ", productName=" + productName + ", productInfo=" + productInfo + ", productPrice=" + productPrice
				+ ", stock=" + stock + ", sales=" + sales + ", categoryDetail=" + categoryDetail + ", imagefile="
				+ imagefile + ", companyName=" + companyName + ", shipping=" + shipping + "]";
	}
	
}
