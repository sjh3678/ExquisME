package web.dto;

import java.util.Date;

public class User {
	private int userNo;
	private int fileNo;
	private String id;
	private String pwd;
	private String salt;
	private String nick;
	private String email;
	private Date birth;
	private String isAdmin;
	private Date createDate;
	private String questionAnwser;
	private int questionNo;
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", fileNo=" + fileNo + ", id=" + id + ", pwd=" + pwd + ", salt=" + salt
				+ ", nick=" + nick + ", email=" + email + ", birth=" + birth + ", isAdmin=" + isAdmin + ", createDate="
				+ createDate + ", questionAnwser=" + questionAnwser + ", questionNo=" + questionNo + "]";
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getQuestionAnwser() {
		return questionAnwser;
	}
	public void setQuestionAnwser(String questionAnwser) {
		this.questionAnwser = questionAnwser;
	}
	public int getQuestionNo() {
		return questionNo;
	}
	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}
	
}
