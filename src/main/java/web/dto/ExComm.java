package web.dto;

import java.util.Date;

public class ExComm {
	private int exCommNo;
	private int userNo;
	private int exPostNo;
	private String exComm;
	private Date exCommDate;
	@Override
	public String toString() {
		return "Ex_comm [exCommNo=" + exCommNo + ", userNo=" + userNo + ", exPostNo=" + exPostNo + ", exComm=" + exComm
				+ ", exCommDate=" + exCommDate + "]";
	}
	public int getExCommNo() {
		return exCommNo;
	}
	public void setExCommNo(int exCommNo) {
		this.exCommNo = exCommNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getExPostNo() {
		return exPostNo;
	}
	public void setExPostNo(int exPostNo) {
		this.exPostNo = exPostNo;
	}
	public String getExComm() {
		return exComm;
	}
	public void setExComm(String exComm) {
		this.exComm = exComm;
	}
	public Date getExCommDate() {
		return exCommDate;
	}
	public void setExCommDate(Date exCommDate) {
		this.exCommDate = exCommDate;
	}
	
}
