package com.mystudy.house.model.vo;

public class OrderPVO {

	int orderpNum, orderNum, productNum, count;
	String id;
	
	public int getOrderpNum() {
		return orderpNum;
	}

	public void setOrderpNum(int orderpNum) {
		this.orderpNum = orderpNum;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "OrderPVO [orderpNum=" + orderpNum + ", orderNum=" + orderNum + ", productNum=" + productNum + ", count="
				+ count + "]";
	}
	
	
}
