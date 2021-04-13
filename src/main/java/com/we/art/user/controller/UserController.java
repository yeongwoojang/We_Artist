package com.we.art.user.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.we.art.chat.model.service.ChatService;
import com.we.art.chat.model.vo.ChatRoom;
import com.we.art.common.code.ConfigCode;
import com.we.art.common.code.ErrorCode;
import com.we.art.common.exception.ToAlertException;
import com.we.art.user.model.service.UserService;
import com.we.art.user.model.service.impl.UserServiceImpl;
import com.we.art.user.model.vo.User;
import com.we.art.user.validator.UserValidator;

@RequestMapping("user")
@Controller
public class UserController {

	private final UserService userService;
	private final ChatService chatService;
	private final UserValidator userValidator;

	

	public UserController(UserService userService, ChatService chatService, UserValidator userValidator) {
		this.userService = userService;
		this.chatService = chatService;
		this.userValidator = userValidator;
	}

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {

		webDataBinder.addValidators(userValidator);
	}

	@GetMapping("join")
	public String UserJoin() {
		return "user/join";
	}

	@GetMapping("joinimpl/{authPath}")
	public String joinImpl(@PathVariable("authPath") String urlPath, HttpSession session,
			@SessionAttribute("authPath") String sessionPath, @SessionAttribute("persistInfo") User persistInfo,
			Model model) {

		if (!urlPath.equals(sessionPath)) {
			throw new ToAlertException(ErrorCode.AUTH02);
		}

		persistInfo.setLoginMethod("public");
		userService.insertUser(persistInfo);
		session.removeAttribute("persistInfo");

		model.addAttribute("alertMsg", "회원가입이 완료되었습니다.");
		model.addAttribute("url", ConfigCode.DOMAIN + "/index");
		return "common/result";

	}

	@GetMapping("idcheck")
	@ResponseBody
	public String idCheck(String userId) {
		if (userService.selectUserById(userId) != null) {
			return "fail";
		}
		return "success";
	}

	@PostMapping("mailauth")
	public String authenticateEmail(@Valid User persistInfo, Errors errors, HttpSession session, Model model) {

		if (errors.hasErrors()) {
			return "user/join";
		}

		String authPath = UUID.randomUUID().toString();
		session.setAttribute("authPath", authPath);
		session.setAttribute("persistInfo", persistInfo);

		userService.authenticateEmail(persistInfo, authPath);
		model.addAttribute("alertMsg", "이메일이 발송되었습니다.");
		model.addAttribute("url", "/index");
		return "common/result";
	}

	@GetMapping("profile")
	public String ShowProfile() {
		return "user/profile";
	}
	
	@PostMapping("update")
	public String updateProfile(@ModelAttribute User persistInfo, Errors errors
			, HttpSession session) {
		
		System.out.println(persistInfo);
		System.out.println(session.getAttribute("userInfo"));
		
		
		userService.updateUser(persistInfo);
		User userInfo = userService.selectUserById(persistInfo.getUserId());
		session.setAttribute("userInfo", userInfo);
		return "index/index";
	}

	@GetMapping("login")
	public String login() {
		return "user/login";
	}

	@PostMapping("loginimpl")
	public String loginImpl(@ModelAttribute User user, HttpSession session,Model model) {
		System.out.println(user);
		String result = null;
		User userInfo = userService.selectUserForLogin(user); //입력받은 값으 DB를 조회하여 결과를 userInfo에 저장
		if (userInfo != null) { //만약에 userInfo가 null이 아니면 (DB에 입력받은 Id가 다면)
			session.setAttribute("userInfo", userInfo); //세션에 그 유저 아이디를 저장
			model.addAttribute("url",ConfigCode.DOMAIN+"/search/main");	//이동할 경로를 설정 
			
			//장영우가 추가한 부분 (유저의 채팅방 리스트를 로그인하자마자 얻어야 함.)
			List<ChatRoom> myChatRoomList = new ArrayList<ChatRoom>();
			myChatRoomList = chatService.selectMyChatRoomList(userInfo.getUserId());
//			if(myChatRoomList.size()!=0) {
				session.setAttribute("myChatRoomList",myChatRoomList);
				System.out.println(myChatRoomList);
//			}
			//장영우가 추가한 부분 여기까지.
		}
		
		else { //만약에 userInfo가 null이라  (DB에 입력받은 Id가 없다면)
			model.addAttribute("alertMsg" , "로그인 실패하였습니다.");//result.jsp에 alert안에 들어갈 문자열 지장
			model.addAttribute("url",ConfigCode.DOMAIN+"/user/login"); //이동할 경로를 설정 
		}
		
		return "common/result"; //model에 담긴 값을 result.jsp로 전달

	}
	
	//김지연 시작
	//비밀번호 찾기
	@GetMapping("findId") 
	public String findId() {
		return "user/findId";
	}
	
	//비밀번호 찾기 요청
	@PostMapping("findId")
	public String findPw(@RequestBody User user) throws Exception {
		System.out.println("폼에서 받아온 E-mail 값 : " + user);
		
		return findPw(user);
	}
	

}
