package com.mystudy.house.model.vo;

public class ProductInquiryVO {
	private String proinIdx, productNum, partnerNum, subject, regdate, views, comments, id, fileName, oriName, ip, rNum;

	public String getProinIdx() {
		return proinIdx;
	}

	public void setProinIdx(String proinIdx) {
		this.proinIdx = proinIdx;
	}

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public String getPartnerNum() {
		return partnerNum;
	}

	public void setPartnerNum(String partnerNum) {
		this.partnerNum = partnerNum;
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
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	

	public String getrNum() {
		return rNum;
	}

	public void setrNum(String rNum) {
		this.rNum = rNum;
	}

	@Override
	public String toString() {
		return "ProductInquiryVO [proinIdx=" + proinIdx + ", productNum=" + productNum + ", partnerNum=" + partnerNum
				+ ", subject=" + subject + ", regdate=" + regdate + ", views=" + views + ", comments=" + comments
				+ ", id=" + id + ", fileName=" + fileName + ", oriName=" + oriName + ", ip=" + ip + ", rNum=" + rNum
				+ "]";
	}
	
	
	
}
