package com.we.art.communication.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.we.art.communication.model.vo.Following;
import com.we.art.communication.model.vo.History;
import com.we.art.user.model.vo.User;

public interface CommunicationService {

	public List<User> selectAllUser();
	public int insertHistory(History history);
	public int insertFollowing(Following following);
	public int deleteHistory(History history);
	public int deleteFollowing(Following following);
	public List<History> selectHistoryById(String userId);
}
