package com.we.art.search.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

@Controller
@RequestMapping("search")
public class SearchController {
	
	
	@GetMapping("main")
	public String searchMain(@SessionAttribute("userId") String userId,HttpSession session) {
		System.out.println("저장된 유저아이디 : "+ userId);
		return "search/search_main";
	}
	

}
