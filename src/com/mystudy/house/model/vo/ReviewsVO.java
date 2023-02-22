package com.mystudy.house.model.vo;

public class ReviewsVO {
	private String idx, orderNum, cartNum, subject, regdate, views,
				comments, star, fileName, oriName, ip, id, rNum;
	
	


	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}

	public String getCartNum() {
		return cartNum;
	}

	public void setCartNum(String cartNum) {
		this.cartNum = cartNum;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
			this.star = star;
	}
	
	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	

	public String getrNum() {
		return rNum;
	}

	public void setrNum(String rNum) {
		this.rNum = rNum;
	}

	@Override
	public String toString() {
		return "ReviewsVO [idx=" + idx + ", orderNum=" + orderNum + ", cartNum=" + cartNum + ", subject=" + subject
				+ ", regdate=" + regdate + ", views=" + views + ", comments=" + comments + ", star=" + star
				+ ", fileName=" + fileName + ", oriName=" + oriName + ", ip=" + ip + ", id=" + id + ", rNum=" + rNum
				+ "]";
	}


	
}
