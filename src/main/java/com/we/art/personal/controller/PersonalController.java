package com.we.art.personal.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.we.art.board.model.service.BoardService;
import com.we.art.personal.model.service.PersonalService;
import com.we.art.user.model.vo.User;

@Controller
@RequestMapping("personal")
public class PersonalController {

	
	private final PersonalService personalService;
	private final BoardService boardService;
	
	public PersonalController(PersonalService personalService,BoardService boardService) {
		this.personalService = personalService;
		this.boardService = boardService;
		
	}

	@GetMapping("personal")
	public String personalPage(@RequestParam("nickName") String nickName,Model model) {
		User user = new User();
		user.setNickName(nickName);
		user = personalService.selectUserByNickName(user);
		List<Map<String,Object>> boardInfo = boardService.selectBoardByUserId(user.getUserId());
		System.out.println("길이 : "+ boardInfo.size());
		for(int i = 0; i< boardInfo.size(); i++) {
			System.out.println("게시물정보 :"+boardInfo.get(i).get("board"));		
			System.out.println("파일들 정보 :"+boardInfo.get(i).get("files"));		
		}
		model.addAttribute("personalBoardInfoList",boardInfo);
		model.addAttribute("personalUserInfo",user);
		return "personal/personal_page";
	}

	@GetMapping("personalprivate")
	public String personalPrivatePage() {
		return "personal/personal_private_page";
	}
}
