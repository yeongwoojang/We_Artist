package com.we.art.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
import com.we.art.chat.model.vo.ChatRoom;
import com.we.art.user.model.vo.User;

@Controller
@RequestMapping("chat")
public class ChatController {

	private final ChatService chatService;

	public ChatController(ChatService chatService) {
		this.chatService = chatService;
	}

	@GetMapping("direct")
	public String direct(@SessionAttribute("userInfo") User userInfo, HttpSession session, Model model) {
		System.out.println("유저세션 : ");
		List<String> followingList = chatService.selectFollowingList(userInfo.getUserId());
		System.out.println(followingList.toString());
		model.addAttribute("followingList", followingList);
		return "mypage/direct";
	}

	@PostMapping("subscribeimpl")
	@ResponseBody
	public String subscribeImpl(@SessionAttribute("userInfo") User userInfo, @RequestBody ChatContent chatContent,
			HttpSession session, Model model) {
		model.addAttribute("chatContent", chatContent);
		return "success";
	}

	@PostMapping("enterchatroomimpl")
	@ResponseBody
	public String enterChatRoom(@RequestBody ChatRoom chatRoom) {
		ChatRoom currentChatRoom = chatService.selectRoomId(chatRoom);
		if(currentChatRoom!=null) {
			System.out.println("있다.");
			return currentChatRoom.getChatRoomNo();
		}else {
			System.out.println("없다.");
			int res = chatService.insertChatRoom(chatRoom);
			if(res!=0) {
				currentChatRoom = chatService.selectRoomId(chatRoom);
				if(currentChatRoom!=null) {
					return currentChatRoom.getChatRoomNo();
				}else {
					return "failed";
				}
			}else {
				return "failed";
			}
		}
	}
	
	@PostMapping("insertchatcontentimpl")
	@ResponseBody
	public String insertChatContentImpl(@RequestBody ChatContent chatContent) {
		int res = chatService.insertChatContent(chatContent);
		if(res!=0) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	@PostMapping("selectchatcontentlistimpl")
	@ResponseBody
	public List<ChatContent> selectChatContentListImpl(@RequestBody ChatRoom chatRoom){
		List<ChatContent> chatContentList = new ArrayList<ChatContent>();
		chatContentList = chatService.selectChatContentList(chatRoom);
		return chatContentList;
	}
}













