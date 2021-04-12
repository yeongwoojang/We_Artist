package com.we.art.communication.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.we.art.communication.model.service.CommunicationService;
import com.we.art.communication.model.vo.Following;
import com.we.art.user.model.vo.User;

@Controller
@RequestMapping("communication")
public class CommunicationController {

	private final CommunicationService communicationService;
	
	
	public CommunicationController(CommunicationService communicationService) {
		this.communicationService = communicationService;
	}


	@GetMapping("alluser")
	public String allUser(@SessionAttribute("userInfo")User userInfo, Model model) {
		List<User> allUserList = communicationService.selectAllUser();
		model.addAttribute("allUserList",allUserList);
		return "communication/alluser";
	}

	@PostMapping("followingimpl")
	public String followingImpl(@SessionAttribute("userInfo")User userInfo, @ModelAttribute Following following, Model model) {
		
		return " ";
	}
	
	
	
}












