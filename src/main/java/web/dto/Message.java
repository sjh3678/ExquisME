package web.dto;

import java.util.Date;

public class Message {
	private int chatNo;
	private int userNo;
	private String chatComm;
	private Date chatDate;
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getChatComm() {
		return chatComm;
	}
	public void setChatComm(String chatComm) {
		this.chatComm = chatComm;
	}
	public Date getChatDate() {
		return chatDate;
	}
	public void setChatDate(Date chatDate) {
		this.chatDate = chatDate;
	}
	@Override
	public String toString() {
		return "Message [chatNo=" + chatNo + ", userNo=" + userNo + ", chatComm=" + chatComm + ", chatDate=" + chatDate
				+ "]";
	}
}
