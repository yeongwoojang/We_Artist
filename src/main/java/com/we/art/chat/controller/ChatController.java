package com.we.art.chat.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("chat")
public class ChatController {

	@GetMapping("direct")
	public String direct(@SessionAttribute("userId") String userId,HttpSession session) {
//		int randomUserId = (int)(Math.random()*100)+1;
//		session.setAttribute("userId","장영우");
		System.out.println("저장된 유저아이디 : "+ userId);
		return "mypage/direct";
	}
	
}
