package com.we.art.chat.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("chat")
public class ChatController {

	@GetMapping("direct")
	public String direct(HttpSession session) {
		int randomUserId = (int)(Math.random()*100)+1;
		session.setAttribute("userId","유저: "+randomUserId );
		return "mypage/direct";
	}
	
}
