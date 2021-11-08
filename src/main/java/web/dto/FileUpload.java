package web.dto;

public class FileUpload {
	private int fileNo;
	private String originName;
	private String storedName;
	private int fileSize;
	@Override
	public String toString() {
		return "TbFile [fileNo=" + fileNo + ", originName=" + originName + ", storedName=" + storedName + ", fileSize="
				+ fileSize + "]";
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	
}
