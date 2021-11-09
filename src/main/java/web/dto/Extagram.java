package web.dto;

import java.util.Date;

public class Extagram {
	private int exPostNo;
	private int fileNo;
	private int userNo;
	private String content;
	private Date exDate;
	private int exViews;
	
	
	
	
	
	@Override
	public String toString() {
		return "Extagram [exPostNo=" + exPostNo + ", fileNo=" + fileNo + ", userNo=" + userNo + ", content=" + content
				+ ", exDate=" + exDate + ", exViews=" + exViews + "]";
	}
	
	
	
	
	
	public int getExPostNo() {
		return exPostNo;
	}
	public void setExPostNo(int exPostNo) {
		this.exPostNo = exPostNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getExDate() {
		return exDate;
	}
	public void setExDate(Date exDate) {
		this.exDate = exDate;
	}
	public int getExViews() {
		return exViews;
	}
	public void setExViews(int exViews) {
		this.exViews = exViews;
	}

	
}
