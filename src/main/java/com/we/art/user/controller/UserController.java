package com.we.art.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("join")
	public String UserJoin() {
		return "user/join";
	}
	
	@GetMapping("profile")
	public String ShowProfile() {
		return "user/profile";
	}


}
