package com.we.art.communication.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.we.art.user.model.vo.User;

public interface CommunicationService {

	public List<User> selectAllUser();
}
