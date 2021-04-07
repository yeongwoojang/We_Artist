package com.we.art.user.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.we.art.common.code.ConfigCode;
import com.we.art.common.code.ErrorCode;
import com.we.art.common.exception.ToAlertException;
import com.we.art.user.model.service.UserService;
import com.we.art.user.model.vo.User;
import com.we.art.user.validator.UserValidator;

@RequestMapping("user")
@Controller
public class UserController {
	
	private final UserService userService;
	private final UserValidator userValidator;
	
	public UserController(UserService userService, UserValidator userValidator) {
		this.userService = userService;
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
	public String joinImpl(@PathVariable("authPath") String urlPath
			,HttpSession session
			,@SessionAttribute("authPath") String sessionPath
			,@SessionAttribute("persistInfo") User persistInfo
			,Model model) {
		
		if(!urlPath.equals(sessionPath)) {
			throw new ToAlertException(ErrorCode.AUTH02);
		}
		
		
		persistInfo.setLoginMethod("public");
		userService.insertUser(persistInfo);
		session.removeAttribute("psersistInfo");
		
		model.addAttribute("alertMsg","회원가입이 완료되었습니다.");
		model.addAttribute("url", ConfigCode.DOMAIN + "/index");
		return "common/result";
		
	}
	
	@GetMapping("idcheck")
	@ResponseBody
	public String idCheck(String userId) {
		if(userService.selectUserById(userId) != null) {
			return "fail";
		}
		return "success";
	}
	
	@PostMapping("mailauth")
	public String authenticateEmail(@Valid User persistInfo, Errors errors
			, HttpSession session, Model model) {
		
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
	public String updateProfile(@Valid User persistInfo, Errors errors
			, HttpSession session) {
		
		if (errors.hasErrors()) {
			return "user/profile";
		}
		
		session.setAttribute("persistInfo", persistInfo);
		userService.updateUser(persistInfo);
		return "/index/index";
	}


}
