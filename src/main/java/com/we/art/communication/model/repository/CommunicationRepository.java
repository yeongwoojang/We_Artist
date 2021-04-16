package com.we.art.communication.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.we.art.communication.model.vo.Following;
import com.we.art.communication.model.vo.History;
import com.we.art.user.model.vo.User;
@Mapper
public interface CommunicationRepository {

	@Select("SELECT * FROM TB_USER")
	public List<User> selectAllUser();
	
	@Insert("INSERT INTO TB_HISTORY(TO_ID,FROM_ID) VALUES(#{toId},#{fromId})")
	public int insertHistory(History history);
	
	@Insert("INSERT INTO TB_FOLLOWING(FROM_ID,TO_ID) VALUES(#{fromId},#{toId})")
	public int insertFollowing(Following following);
	
	@Delete("DELETE FROM TB_HISTORY WHERE FROM_ID=#{fromId} AND TO_ID=#{toId} AND IS_CHECK = 0")
	public int deleteHistory(History history);
	
	@Delete("DELETE FROM TB_FOLLOWING WHERE FROM_ID =#{fromId} AND TO_ID=#{toId}")
	public int deleteFollowing(Following following);
	
	@Select("SELECT *FROM TB_HISTORY WHERE TO_ID =#{userId} AND IS_CHECK = 0")
	public List<History> selectHistoryById(String userId);
	
}
