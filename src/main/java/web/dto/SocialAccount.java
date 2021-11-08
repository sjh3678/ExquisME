package web.dto;

public class SocialAccount {
	private int socialNo;
	private int userNo;
	private String socialProvider;
	private String socialKey;
	@Override
	public String toString() {
		return "SocialAccount [socialNo=" + socialNo + ", userNo=" + userNo + ", socialProvider=" + socialProvider
				+ ", socialKey=" + socialKey + "]";
	}
	public int getSocialNo() {
		return socialNo;
	}
	public void setSocialNo(int socialNo) {
		this.socialNo = socialNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getSocialProvider() {
		return socialProvider;
	}
	public void setSocialProvider(String socialProvider) {
		this.socialProvider = socialProvider;
	}
	public String getSocialKey() {
		return socialKey;
	}
	public void setSocialKey(String socialKey) {
		this.socialKey = socialKey;
	}
	
}
