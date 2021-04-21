package com.we.art.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.we.art.board.model.service.BoardService;
import com.we.art.board.model.vo.Board;
import com.we.art.common.util.file.FileVo;
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
		String userId = "test01";
		//String userId = user.getUserId();
		
		board.setUserId(userId);
		
		boardService.insertBoard(board, files);
		return "redirect:/filetest";
	}
	
	@GetMapping("filetest")
	public String test() {
		for(Map<String, Object> data:boardService.selectBoardByUserId("test01")) {
			System.out.println("-----------------------------------------------------");
			System.out.println(data.get("board"));
			System.out.println(data.get("files"));
		}
		return "common/filetest";
	}
	
	@GetMapping("fetchselectedboard")
	@ResponseBody
	public Map<String,Object> fetchSelectedBoard(@RequestParam("bdNo") String bdNo) {
		Map<String,Object> commandMap = new HashMap<String,Object>();
		commandMap = boardService.selectBoardByBdNo(bdNo);
		System.out.println("게시물 번호로 알아본 게시물의 정보 : "+ commandMap);
		return commandMap;
	}
	
	
	@GetMapping("fetchlikeuserlist")
	@ResponseBody
	public List<Map<String,String>> fetchlikeuserlist(@RequestParam("bdNo") String bdNo){
		List<Map<String,String>> likeUserList = boardService.selectLikeListByBdNo(bdNo);
		if(likeUserList==null) {
			likeUserList = new ArrayList<>();
		}
		
		return likeUserList;
	}
}
