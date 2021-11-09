package web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import web.dto.Message;
import web.dto.Room;
import web.dto.User;
import web.service.face.ChatService;

@Controller
public class ChatController {

	@Autowired ChatService chatService;
	
	//채팅방 만들기
	@RequestMapping(value="/chat/room")
	public String roomWrite(HttpSession session) {
		
		return "redirect:/chat/view";
	}

	//채팅방 입장 = 메세지 리스트 조회
	@RequestMapping(value="/chat/view")
	public void messageList(HttpSession session) {}
	
	//메세지 전송
	@RequestMapping(value="/chat/message")
	public String messageWrite(Message message) {
		
		return "redirect:/chat/view";
	}
}
