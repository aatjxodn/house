package com.mystudy.house.model.vo;


public class MyidperiodVO {
	private String ago, today;
	private String id;
	
	public String getAgo() {
		return ago;
	}
	public void setAgo(String ago) {
		this.ago = ago;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public MyidperiodVO(String ago, String today, String id) {
		super();
		this.ago = ago;
		this.today = today;
		this.id = id;
	}
	@Override
	public String toString() {
		return "MyidperiodVO [ago=" + ago + ", today=" + today + ", id=" + id + "]";
	}
	
	
	
	
	
	
	
	
}
