package web.dto;

public class PerfLike {
	private int perfumeLikeNo;
	private int perfumeNo;
	private int userNo;
	private String perfumeLike;
	private String likeType;
	@Override
	public String toString() {
		return "PerfLike [perfumeLikeNo=" + perfumeLikeNo + ", perfumeNo=" + perfumeNo + ", userNo=" + userNo
				+ ", perfumeLike=" + perfumeLike + ", likeType=" + likeType + "]";
	}
	public int getPerfumeLikeNo() {
		return perfumeLikeNo;
	}
	public void setPerfumeLikeNo(int perfumeLikeNo) {
		this.perfumeLikeNo = perfumeLikeNo;
	}
	public int getPerfumeNo() {
		return perfumeNo;
	}
	public void setPerfumeNo(int perfumeNo) {
		this.perfumeNo = perfumeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getPerfumeLike() {
		return perfumeLike;
	}
	public void setPerfumeLike(String perfumeLike) {
		this.perfumeLike = perfumeLike;
	}
	public String getLikeType() {
		return likeType;
	}
	public void setLikeType(String likeType) {
		this.likeType = likeType;
	}
	
	
	
	
}
