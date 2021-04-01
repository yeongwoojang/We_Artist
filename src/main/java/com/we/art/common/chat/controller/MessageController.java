package com.we.art.common.chat.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.messaging.simp.annotation.support.SimpAnnotationMethodMessageHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.we.art.user.model.vo.User;

@Controller
public class MessageController {
	
	@GetMapping("chatting")
	public String chat() {
		return "chat_test/chatting";
	}
	
	
	@MessageMapping("info")
	@SendTo("/queue/info")
	public String info(String message,SimpMessageHeaderAccessor messageHeaderAccessor) {
		User talker = (User) messageHeaderAccessor.getSessionAttributes().get("session");
		System.out.println("메세지 내용 :"+ message);
		return message;
	}

}
