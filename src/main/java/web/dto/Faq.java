package web.dto;

import java.util.Date;

public class Faq {
	private int faqNo;
	private int userNo;
	private String faqTitle;
	private String faqContent;
	private Date faqDate;
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public Date getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}
	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", userNo=" + userNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent
				+ ", faqDate=" + faqDate + "]";
	}
}
