package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.ChatDao;
import web.dto.Message;
import web.dto.Room;
import web.dto.User;
import web.service.face.ChatService;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired ChatDao chatDao;
	
	@Override
	public void setRoom(User user) {

	}

	@Override
	public List<Message> getMessageList(Room room) {
		return null;
	}

	@Override
	public void setMessage(Message message) {

	}
	
	@Override
	public List<Room> getRoomList() {
		return null;
	}
	
	@Override
	public void roomDelete(Room room) {
		
	}

}
