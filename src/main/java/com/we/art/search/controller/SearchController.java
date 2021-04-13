package com.we.art.search.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.we.art.user.model.vo.User;

@Controller
@RequestMapping("search")
public class SearchController {
	
	
	@GetMapping("main")
	public String searchMain(@SessionAttribute("userInfo") User userInfo,HttpSession session) {
		return "search/search_sub";
	}
	
	
	
	
}
