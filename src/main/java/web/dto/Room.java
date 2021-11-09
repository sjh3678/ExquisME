package web.dto;

public class Room {
	private int roomNo;
	private int userNo;
	private String roomTitle;
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getRoomTitle() {
		return roomTitle;
	}
	public void setRoomTitle(String roomTitle) {
		this.roomTitle = roomTitle;
	}
	@Override
	public String toString() {
		return "Room [roomNo=" + roomNo + ", userNo=" + userNo + ", roomTitle=" + roomTitle + "]";
	}
}
