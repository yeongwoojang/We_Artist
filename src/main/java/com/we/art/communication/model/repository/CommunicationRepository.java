package com.we.art.communication.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.we.art.user.model.vo.User;
@Mapper
public interface CommunicationRepository {

	@Select("SELECT * FROM TB_USER")
	public List<User> selectAllUser();
}
