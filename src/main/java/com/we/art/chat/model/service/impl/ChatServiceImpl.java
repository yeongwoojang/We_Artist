package com.we.art.chat.model.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.we.art.chat.model.repository.ChatRepository;
import com.we.art.chat.model.service.ChatService;
import com.we.art.chat.model.vo.ChatRoom;

@Service
public class ChatServiceImpl implements ChatService{

	private final ChatRepository chatRepository;
	
	
	public ChatServiceImpl(ChatRepository chatRepository) {
		this.chatRepository = chatRepository;
	}


	@Override
	public int insertChatRoom(ChatRoom chatRoom) {
		return chatRepository.insertChatRoom(chatRoom);
	}


	@Override
	public List<String> selectFollowingList(String userId) {
		return chatRepository.selectFollowingList(userId);
	}

	
	
}
