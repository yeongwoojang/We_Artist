package com.we.art.chat.model.service;

import java.util.List;
import java.util.Map;

import com.we.art.chat.model.vo.ChatContent;
import com.we.art.chat.model.vo.ChatRoom;

public interface ChatService {

	public int insertChatRoom(ChatRoom charRoom);
	public List<Map<String,String>> selectFollowingList(String userId);
	public ChatRoom selectRoomId(ChatRoom chatRoom);
	public List<ChatRoom> selectMyChatRoomList(String userId);
	public int insertChatContent(ChatContent chatContent);
	public List<Map<String,Object>> selectChatContentList(ChatRoom chatRoom);
	public List<Map<String,Object>> selectLastMessageList(List<ChatRoom> myChatRoomList);
}
