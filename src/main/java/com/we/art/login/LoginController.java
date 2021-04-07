package com.we.art.login;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.we.art.user.model.vo.User;

@Controller
public class LoginController {
	
	LoginService service;
	
	
	@RequestMapping(value="loginpros", method=RequestMethod.POST)
	public ModelAndView loginpros(@ModelAttribute User user, HttpSession session) throws Exception{
		String status = service.loginpros(user, session);
		ModelAndView mav = new ModelAndView();
		if(status == null) {
			System.out.println("로그인 실패");
			mav.setViewName("login");
			mav.addObject("msg","error");
			
			//사용자
		}else {
			mav.setViewName("direct");
		}
		return mav;
		
	}

}
