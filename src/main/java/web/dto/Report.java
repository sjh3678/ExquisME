package web.dto;

import java.util.Date;

public class Report {
	private int reportNo;
	private int exPostNo;
	private int reporter;
	private int defendant;
	private String reportContent;
	private Date reportDate;
	private String isExecute;
	private Date banDate;
	private Date expireDate;
	private String banType;
	private String reason;
	
	
	
	
	
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", exPostNo=" + exPostNo + ", reporter=" + reporter + ", defendant="
				+ defendant + ", reportContent=" + reportContent + ", reportDate=" + reportDate + ", isExecute="
				+ isExecute + ", banDate=" + banDate + ", expireDate=" + expireDate + ", banType=" + banType
				+ ", reason=" + reason + "]";
	}
	
	
	
	
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getExPostNo() {
		return exPostNo;
	}
	public void setExPostNo(int exPostNo) {
		this.exPostNo = exPostNo;
	}
	public int getReporter() {
		return reporter;
	}
	public void setReporter(int reporter) {
		this.reporter = reporter;
	}
	public int getDefendant() {
		return defendant;
	}
	public void setDefendant(int defendant) {
		this.defendant = defendant;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getIsExecute() {
		return isExecute;
	}
	public void setIsExecute(String isExecute) {
		this.isExecute = isExecute;
	}
	public Date getBanDate() {
		return banDate;
	}
	public void setBanDate(Date banDate) {
		this.banDate = banDate;
	}
	public Date getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}
	public String getBanType() {
		return banType;
	}
	public void setBanType(String banType) {
		this.banType = banType;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}

	
}
