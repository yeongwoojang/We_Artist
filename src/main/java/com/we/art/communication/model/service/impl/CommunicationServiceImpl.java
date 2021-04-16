package com.we.art.communication.model.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.we.art.communication.model.repository.CommunicationRepository;
import com.we.art.communication.model.service.CommunicationService;
import com.we.art.communication.model.vo.Following;
import com.we.art.communication.model.vo.History;
import com.we.art.user.model.vo.User;
@Service
public class CommunicationServiceImpl implements CommunicationService{

	private final CommunicationRepository communicationRepository;
	
	
	public CommunicationServiceImpl(CommunicationRepository communicationRepository) {
		this.communicationRepository = communicationRepository;
	}


	@Override
	public List<User> selectAllUser() {
		return communicationRepository.selectAllUser();
	}


	@Override
	public int insertHistory(History history) {
		return communicationRepository.insertHistory(history);
	}


	@Override
	public int insertFollowing(Following following) {
		return communicationRepository.insertFollowing(following);
	}

	
	
	@Override
	public int deleteHistory(History history) {
		return communicationRepository.deleteHistory(history);
	}


	@Override
	public int deleteFollowing(Following following) {
		return communicationRepository.deleteFollowing(following);
	}


	@Override
	public List<History> selectHistoryById(String userId) {
		return communicationRepository.selectHistoryById(userId);
	}
	
	

}
