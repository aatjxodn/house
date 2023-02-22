package com.mystudy.house.model.vo;

public class HouseVO {
	private String id, subject, email, comments, name, fileName, oriName, ip;

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	

	@Override
	public String toString() {
		return "HouseVO [id=" + id + ", subject=" + subject + ", email=" + email + ", comments=" + comments + ", name="
				+ name + ", fileName=" + fileName + ", oriName=" + oriName + ", ip=" + ip + "]";
	}
	
	
	
	
}
