package web.dto;

import java.util.Date;

public class Extagram {
	private int exNo;
	private int fileNo;
	private int userNo;
	private String exContent;
	private Date exDate;
	private int exViews;
	
	
	
	
	
	@Override
	public String toString() {
		return "Extagram [exNo=" + exNo + ", fileNo=" + fileNo + ", userNo=" + userNo + ", exContent=" + exContent
				+ ", exDate=" + exDate + ", exViews=" + exViews + "]";
	}
	
	
	
	
	
	public int getExNo() {
		return exNo;
	}
	public void setExNo(int exNo) {
		this.exNo = exNo;
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
	public String getExContent() {
		return exContent;
	}
	public void setExContent(String exContent) {
		this.exContent = exContent;
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
