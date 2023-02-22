package com.mystudy.house.model.vo;

public class RequestLikeVO {
	private String likeNum, requestIdx, id, regdate;

	public String getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(String likeNum) {
		this.likeNum = likeNum;
	}

	public String getRequestIdx() {
		return requestIdx;
	}

	public void setRequestIdx(String requestIdx) {
		this.requestIdx = requestIdx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "RequestLikeVO [likeNum=" + likeNum + ", requestIdx=" + requestIdx + ", id=" + id + ", regdate="
				+ regdate + "]";
	}
	
	
}
