package com.we.art.chat.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.we.art.chat.model.service.ChatService;
import com.we.art.chat.model.vo.ChatContent;
import com.we.art.user.model.vo.User;

@Controller
@RequestMapping("chat")
public class ChatController {

	private final ChatService chatService;
	
	
	public ChatController(ChatService chatService) {
		this.chatService = chatService;
	}


	@GetMapping("direct")
	public String direct(@SessionAttribute("userInfo") User userInfo,HttpSession session,Model model) {
		System.out.println("유저세션 : ");
		List<String> followingList = chatService.selectFollowingList(userInfo.getUserId());
		System.out.println(followingList.toString());
		model.addAttribute("followingList",followingList);
		return "mypage/direct";
	}
	
	@PostMapping("subscribeimpl")
	@ResponseBody
	public String subscribeImpl(
			@SessionAttribute("userInfo") User userInfo,
			@RequestBody ChatContent chatContent,
			HttpSession session,
			Model model
			) {
		model.addAttribute("chatContent",chatContent);
		return "success";
	}
	
}
