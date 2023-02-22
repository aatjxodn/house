package com.mystudy.house.model.vo;

public class Request_comVO {
	private String comIdx, requestIdx, id, regdate, comments, likes;

	public String getComIdx() {
		return comIdx;
	}

	public void setComIdx(String comIdx) {
		this.comIdx = comIdx;
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

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
	}

	@Override
	public String toString() {
		return "Request_comVO [comIdx=" + comIdx + ", requestIdx=" + requestIdx + ", id=" + id + ", regdate=" + regdate
				+ ", comments=" + comments + ", likes=" + likes + "]";
	}
	
	
}
