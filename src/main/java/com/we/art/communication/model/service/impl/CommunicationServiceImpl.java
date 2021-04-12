package com.we.art.communication.model.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.we.art.communication.model.repository.CommunicationRepository;
import com.we.art.communication.model.service.CommunicationService;
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

	
}
