package com.we.art.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("join")
	public String ShowGallery() {
		return "user/join";
	}

}
