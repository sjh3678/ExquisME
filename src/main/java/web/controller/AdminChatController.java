package web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Message;
import web.dto.Room;
import web.service.face.ChatService;

@Controller
public class AdminChatController {

	@Autowired ChatService chatService;
	
	@RequestMapping(value="/admin/chat/list")
	public void roomList(Model model) {}
	
	@RequestMapping(value="/view")
	public void messageList(Room room) {}

	@RequestMapping(value="/message")
	public void messageWrite(Message message) {}
	
	//@@@URL 이름 같이 생각해봐야 함!???!?
	@RequestMapping(value="/admin/chat/finish")
	public void roomDelete(Room room) {}
}
