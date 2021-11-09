package web.dto;

public class Perf {
	private int perfumeNo;
	private int brandNo;
	private int fileNo;
	private String perfumeName;
	private String perfumeVitality;
	
	@Override
	public String toString() {
		return "Perf [perfumeNo=" + perfumeNo + ", brandNo=" + brandNo + ", fileNo=" + fileNo + ", perfumeName="
				+ perfumeName + ", perfumeVitality=" + perfumeVitality + "]";
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
	
}
