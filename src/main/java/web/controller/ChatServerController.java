package web.controller;

import java.io.IOException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint(value="/chat/server")
public class ChatServerController {
	
	private static final List<Session> sessionList = new ArrayList<Session>();
	private static final Logger logger = LoggerFactory.getLogger(ChatServerController.class);
	
	public ChatServerController() {logger.info(" * * * * * WEB SOCKET CREATED * * * * * ");}
	
	@OnOpen
	public void onOpen(Session session) {
		logger.info("session.getId() : {}", session.getId());
		try {
			final Basic basic = session.getBasicRemote();
			basic.sendText("채팅방에 입장하였습니다.");
		} catch (IOException e) {
			e.printStackTrace();
		}
		sessionList.add(session);
	}

    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	
        try {
            for(Session session : ChatServerController.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    LocalTime now = LocalTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
                    String time = now.format(formatter);
                    String messageEsc = message.replaceAll("<", "&lt;");
                	String form = "<div class=\"item yourmsg on\"><div class=\"box\"><p class=\"msg\"> "+ sender + " : " + messageEsc +" </p><span class=\"time\">" + time + "</span></div></div>";
                    session.getBasicRemote().sendText(form);
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message, Session session) {
    	
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	
        logger.info("Message From [" + sender + "] : "+message);
        try {
            final Basic basic=session.getBasicRemote();
            LocalTime now = LocalTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
            String time = now.format(formatter);
            String messageEsc = message.replaceAll("<", "&lt;");
            String form = "<div class=\"item mymsg on\"><div class=\"box\"><p class=\"msg\"> " + messageEsc + " </p><span class=\"time\">" + time + "</span></div></div>";
            basic.sendText(form);
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message);
    }
    
    @OnError
    public void onError(Throwable e, Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }

}
