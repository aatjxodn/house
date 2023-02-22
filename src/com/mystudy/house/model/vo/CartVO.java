package com.mystudy.house.model.vo;

public class CartVO {

	private int cartNum, productNum;
	private String id;
	private int count;
	
	public int getCartNum() {
		return cartNum;
	}
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
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
	}
	
	@Override
	public String toString() {
		return "CartVO [cartNum=" + cartNum + ", productNum=" + productNum + ", id=" + id + ", count=" + count + "]";
	}
	
}
