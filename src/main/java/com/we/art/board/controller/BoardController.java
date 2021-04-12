package com.we.art.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.we.art.board.model.service.BoardService;
import com.we.art.board.model.vo.Board;
import com.we.art.user.model.vo.User;

@Controller
public class BoardController {

	private final BoardService boardService;
	
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@PostMapping("upload")
	public String uploadBorad(@RequestParam List<MultipartFile> files, Board board,
			@SessionAttribute(name="userInfo", required = false)User user) {
		
		// board객체에 업로드한 회원의 아이디를 넣는다.
		String userId = "test1";
		//String userId = user.getUserId();
		
		board.setUserId(userId);
		
		boardService.insertBoard(board, files);
		return "common/filetest";
	}
	
	@GetMapping("filetest")
	public String test() {
		return "common/filetest";
	}
	
}
