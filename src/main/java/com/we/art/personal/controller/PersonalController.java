package com.we.art.personal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.we.art.personal.model.service.PersonalService;
import com.we.art.user.model.vo.User;

@Controller
@RequestMapping("personal")
public class PersonalController {

	
	private final PersonalService personalService;
	
	
	public PersonalController(PersonalService personalService) {
		this.personalService = personalService;
	}

	@GetMapping("personal")
	public String personalPage(@RequestParam("nickName") String nickName,Model model) {
		User user = new User();
		user.setNickName(nickName);
		user = personalService.selectUserByNickName(user);
		model.addAttribute("personalUserInfo",user);
		return "personal/personal_page";
	}

	@GetMapping("personalprivate")
	public String personalPrivatePage() {
		return "personal/personal_private_page";
	}
}
