package web.dto;

public class ExLike {
	private int exLikeNo;
	private int userNo;
	private int exPostNo;
	
	
	
	
	
	@Override
	public String toString() {
		return "ExLike [exLikeNo=" + exLikeNo + ", userNo=" + userNo + ", exPostNo=" + exPostNo + "]";
	}
	
	
	
	
	
	public int getExLikeNo() {
		return exLikeNo;
	}
	public void setExLikeNo(int exLikeNo) {
		this.exLikeNo = exLikeNo;
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
	
}
