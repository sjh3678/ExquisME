package web.dto;

import java.util.Date;

public class Layer {

	private int layeringNo;
	private int userNo;
	private int perfumeNo1;
	private int perfumeNo2;
	private int perfume1Per;
	private String layeringContent;
	private Date layeringDate;
	@Override
	public String toString() {
		return "Layer [layeringNo=" + layeringNo + ", userNo=" + userNo + ", perfumeNo1=" + perfumeNo1 + ", perfumeNo2="
				+ perfumeNo2 + ", perfume1Per=" + perfume1Per + ", layeringContent=" + layeringContent
				+ ", layeringDate=" + layeringDate + "]";
	}
	public int getLayeringNo() {
		return layeringNo;
	}
	public void setLayeringNo(int layeringNo) {
		this.layeringNo = layeringNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPerfumeNo1() {
		return perfumeNo1;
	}
	public void setPerfumeNo1(int perfumeNo1) {
		this.perfumeNo1 = perfumeNo1;
	}
	public int getPerfumeNo2() {
		return perfumeNo2;
	}
	public void setPerfumeNo2(int perfumeNo2) {
		this.perfumeNo2 = perfumeNo2;
	}
	public int getPerfume1Per() {
		return perfume1Per;
	}
	public void setPerfume1Per(int perfume1Per) {
		this.perfume1Per = perfume1Per;
	}
	public String getLayeringContent() {
		return layeringContent;
	}
	public void setLayeringContent(String layeringContent) {
		this.layeringContent = layeringContent;
	}
	public Date getLayeringDate() {
		return layeringDate;
	}
	public void setLayeringDate(Date layeringDate) {
		this.layeringDate = layeringDate;
	}

	
	
}
