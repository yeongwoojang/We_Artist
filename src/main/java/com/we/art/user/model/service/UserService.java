package com.we.art.user.model.service;

import com.we.art.user.model.vo.User;

public interface UserService {
	
	User selectUserById(String userId);
	int selectUserByEmail(String email);

	int insertUser(User persitInfo);
	void authenticateEmail(User persistInfo, String authPath);
	
	User selectUserForLogin(User user);

}


