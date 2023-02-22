package com.mystudy.house.model.vo;

public class myscrapVO {

	private int scrapNum, postIdx;
	private String id;
	private int postType;
	private String thumbnail;

	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getScrapNum() {
		return scrapNum;
	}
	public void setScrapNum(int scrapNum) {
		this.scrapNum = scrapNum;
	}
	public int getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(int postIdx) {
		this.postIdx = postIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPostType() {
		return postType;
	}
	public void setPostType(int postType) {
		this.postType = postType;
	}
	@Override
	public String toString() {
		return "myscrapVO [scrapNum=" + scrapNum + ", postIdx=" + postIdx + ", id=" + id + ", postType=" + postType
				+ "]";
	}
	
	
}
