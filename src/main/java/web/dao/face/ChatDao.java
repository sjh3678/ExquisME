package web.dao.face;

import java.util.List;

import web.dto.Message;
import web.dto.Room;
import web.dto.User;

public interface ChatDao {

	/**
	 * 새로운 Room 삽입
	 * @param user
	 */
	public void InsertRoom(User user);
	
	/**
	 * 기존 메세지 조회하여 리스트로 반환
	 * @param room
	 * @return
	 */
	public List<Message> selectMessage(Room room);
	
	/**
	 * 새로운 메세지 삽입
	 * @param message
	 */
	public void insertMessage(Message message);
	
	/**
	 * Room 행 삭제
	 * @param room
	 */
	public void deleteRoom(Room room);
}
