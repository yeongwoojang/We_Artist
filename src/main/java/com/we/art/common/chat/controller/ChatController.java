package com.we.art.common.chat.controller;



import java.util.Date;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.we.art.common.chat.model.vo.Chat;

@Controller
public class ChatController {

		//채팅 메세지 전달
	@MessageMapping("/hello/{roomNo}")
	@SendTo("subscribe/chat/{roomNo}")
	public Chat broadcasting(Chat chat) {
		
		chat.setSendDate(new Date());
		
		return chat;
	}
	
	@GetMapping("chatting")
	public String chatting() {
		return "chat_test/chatting";
	}
}
