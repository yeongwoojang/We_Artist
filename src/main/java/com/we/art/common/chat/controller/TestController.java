package com.we.art.common.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	
	@GetMapping("read")
	public String test() {
		return "chat_test/read";
	}
}
