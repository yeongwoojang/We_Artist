package com.we.art.search.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("search")
public class SearchController {
	
	
	@GetMapping("main")
	public String searchMain(HttpSession session) {
		int randomUserId = (int)(Math.random()*100)+1;
		session.setAttribute("userId", "유저"+randomUserId);
		return "search/search_main";
	}
	

}
