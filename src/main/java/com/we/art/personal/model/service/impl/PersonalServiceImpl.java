package com.we.art.personal.model.service.impl;

import org.springframework.stereotype.Service;

import com.we.art.personal.model.repository.PersonalRepository;
import com.we.art.personal.model.service.PersonalService;
import com.we.art.user.model.vo.User;

@Service
public class PersonalServiceImpl implements PersonalService{

	private final PersonalRepository personalRepository;
	
	public PersonalServiceImpl(PersonalRepository personalRepository) {
		this.personalRepository = personalRepository;
	}


	@Override
	public User selectUserByNickName(User user) {
		return personalRepository.selectUserByNickName(user);
	}
	
	

}
