package com.we.art.login;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.we.art.user.model.vo.User;

@Service
public class LoginServiceImpl implements LoginService {
	

//	@Override
//	public String loginpros(User user, HttpSession session) throws Exception {
//		// TODO Auto-generated method stub
//		
//		String status = dao.loginpros(user);
//		if(status==null) {
//			return null;
//		}else {
//			session.setAttribute("status", status);
//			session.setAttribute("userId", user.getUserId());
//		}
//		return status;
//	}

}
