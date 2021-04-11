package com.we.art.chat.model.service;

import java.util.List;

import com.we.art.chat.model.vo.ChatContent;
import com.we.art.chat.model.vo.ChatRoom;

public interface ChatService {

	public int insertChatRoom(ChatRoom charRoom);
	public List<String> selectFollowingList(String userId);
	public ChatRoom selectRoomId(ChatRoom chatRoom);
	public List<ChatRoom> selectMyChatRoomList(String userId);
	public int insertChatContent(ChatContent chatContent);
	public List<ChatContent> selectChatContentList(ChatRoom chatRoom);
	public List<ChatContent> selectLastMessageList(List<ChatRoom> myChatRoomList);
}
