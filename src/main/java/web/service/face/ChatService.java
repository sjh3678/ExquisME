package web.service.face;

import java.util.List;

import web.dto.Message;
import web.dto.Room;
import web.dto.User;

public interface ChatService {

	/**
	 * 채팅방 개설
	 * @param user
	 */
	public void setRoom(User user);
	
	/**
	 * 채팅방 내 주고받은 메세지 조회
	 * @param room
	 * @return
	 */
	public List<Message> getMessageList(Room room);
	
	/**
	 * 메세지 전송
	 * @param message
	 */
	public void setMessage(Message message);
	
	/**
	 * 열려 있는 모든 채팅방 조회
	 * @return
	 */
	public List<Room> getRoomList();
	
	/**
	 * 채팅방 종료
	 * @param room - 닫으려는 룸넘버가 포함된 룸 객체
	 */
	public void roomDelete(Room room);
	
}
