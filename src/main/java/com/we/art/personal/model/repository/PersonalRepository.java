package com.we.art.personal.model.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.we.art.user.model.vo.User;

@Mapper
public interface PersonalRepository {
	
	@Select("SELECT *FROM TB_USER WHERE NICKNAME = #{nickName}")
	public User selectUserByNickName(User user);
}
