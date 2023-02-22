package com.mystudy.house.model.vo;

public class RequestVO {
	private String requestIdx, id, subject, regdate, views, comments, likes, fileName, oriName, ip, rNum, thumbNail, likeCnt, myid;
	
	
	
	public String getMyid() {
		return myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

	public String getrNum() {
		return rNum;
	}

	public void setrNum(String rNum) {
		this.rNum = rNum;
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

	public String getLikes() {
		return likes;
	}

	public void setLikes(String likes) {
		this.likes = likes;
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
	
	

	public String getThumbNail() {
		return thumbNail;
	}

	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}

	
	
	public String getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(String likeCnt) {
		this.likeCnt = likeCnt;
	}

	
	@Override
	public String toString() {
		return "RequestVO [requestIdx=" + requestIdx + ", id=" + id + ", subject=" + subject + ", regdate=" + regdate
				+ ", views=" + views + ", comments=" + comments + ", likes=" + likes + ", fileName=" + fileName
				+ ", oriName=" + oriName + ", ip=" + ip + ", rNum=" + rNum + ", thumbNail=" + thumbNail + ", likeCnt="
				+ likeCnt + "]";
	}
	
	
	
	
	
}
