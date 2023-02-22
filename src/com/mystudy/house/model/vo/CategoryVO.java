package com.mystudy.house.model.vo;

public class CategoryVO {

	
	private int categoryNum;
	private String categoryName;
	private String categoryDetail;
	
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryDetail() {
		return categoryDetail;
	}
	public void setCategoryDetail(String categoryDetail) {
		this.categoryDetail = categoryDetail;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [categoryNum=" + categoryNum + ", categoryName=" + categoryName + ", categoryDetail="
				+ categoryDetail + "]";
	}
	
	
}
