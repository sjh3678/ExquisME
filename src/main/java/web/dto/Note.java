package web.dto;

public class Note {
	private int noteLikeNo;
	private int userNo;
	private int perfumeNo;
	private int noteNo;
	
	@Override
	public String toString() {
		return "Note [noteLikeNo=" + noteLikeNo + ", userNo=" + userNo + ", perfumeNo=" + perfumeNo + ", noteNo="
				+ noteNo + "]";
	}
	
	public int getNoteLikeNo() {
		return noteLikeNo;
	}
	public void setNoteLikeNo(int noteLikeNo) {
		this.noteLikeNo = noteLikeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPerfumeNo() {
		return perfumeNo;
	}
	public void setPerfumeNo(int perfumeNo) {
		this.perfumeNo = perfumeNo;
	}
	public int getNoteNo() {
		return noteNo;
	}
	public void setNoteNo(int noteNo) {
		this.noteNo = noteNo;
	}
	
}
