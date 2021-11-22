package web.dto;

import java.util.Arrays;

public class Perf {
	private int perfumeNo;
	private int brandNo;
	private int fileNo;
	private String perfumeName;
	private String perfumeVitality;
	private int perfumeGender;
	private int[] noteNo;
	@Override
	public String toString() {
		return "Perf [perfumeNo=" + perfumeNo + ", brandNo=" + brandNo + ", fileNo=" + fileNo + ", perfumeName="
				+ perfumeName + ", perfumeVitality=" + perfumeVitality + ", perfumeGender=" + perfumeGender
				+ ", noteNo=" + Arrays.toString(noteNo) + "]";
	}
	public int getPerfumeNo() {
		return perfumeNo;
	}
	public void setPerfumeNo(int perfumeNo) {
		this.perfumeNo = perfumeNo;
	}
	public int getBrandNo() {
		return brandNo;
	}
	public void setBrandNo(int brandNo) {
		this.brandNo = brandNo;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getPerfumeName() {
		return perfumeName;
	}
	public void setPerfumeName(String perfumeName) {
		this.perfumeName = perfumeName;
	}
	public String getPerfumeVitality() {
		return perfumeVitality;
	}
	public void setPerfumeVitality(String perfumeVitality) {
		this.perfumeVitality = perfumeVitality;
	}
	public int getPerfumeGender() {
		return perfumeGender;
	}
	public void setPerfumeGender(int perfumeGender) {
		this.perfumeGender = perfumeGender;
	}
	public int[] getNoteNo() {
		return noteNo;
	}
	public void setNoteNo(int[] noteNo) {
		this.noteNo = noteNo;
	}
	
	
	

	
	
	
	
	
	
}
