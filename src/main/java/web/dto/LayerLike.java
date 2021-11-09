package web.dto;

public class LayerLike {

	private int layeringLikeNo;
	private int userNo;
	private int layeringNo;
	@Override
	public String toString() {
		return "LayerLike [layeringLikeNo=" + layeringLikeNo + ", userNo=" + userNo + ", layeringNo=" + layeringNo
				+ "]";
	}
	
	public int getLayeringLikeNo() {
		return layeringLikeNo;
	}
	public void setLayeringLikeNo(int layeringLikeNo) {
		this.layeringLikeNo = layeringLikeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getLayeringNo() {
		return layeringNo;
	}
	public void setLayeringNo(int layeringNo) {
		this.layeringNo = layeringNo;
	}
	
	
}
