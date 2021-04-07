package com.we.art.chat.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.we.art.chat.model.vo.ChatRoom;

@Mapper
public interface ChatRepository {
	
	@Insert("INSERT INTO CHAT_ROOM(CHAT_ROOM_NO,FIRST_USER,SECOND_USER)"
			+ " VALUES('CHATROOM'||SC_CHAT_ROOM_IDX.NEXTVAL,#{firstUser},#{secondUser})")
	int insertChatRoom(ChatRoom chatRoom);
	
	@Select("SELECT TO_ID FROM TB_FOLLOWING WHERE FROM_ID =#{userId}")
	List<String> selectFollowingList(String userId);
}
