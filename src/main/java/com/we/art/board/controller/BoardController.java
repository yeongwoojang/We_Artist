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
		return "personal/personal_page";
	}
	
	@GetMapping("fileupload")
	public String test() {
		for(Map<String, Object> data:boardService.selectBoardByUserId("test01")) {
			System.out.println("-----------------------------------------------------");
			System.out.println(data.get("board"));
			System.out.println(data.get("files"));
		}
		return "personal/fileupload";
	}
	
	@GetMapping("fetchselectedboard")
	@ResponseBody
	public Map<String,Object> fetchSelectedBoard(@RequestParam("bdNo") String bdNo) {
		Map<String,Object> commandMap = new HashMap<String,Object>();
		commandMap = boardService.selectBoardByBdNo(bdNo);
		return commandMap;
	}
	
	
	@GetMapping("fetchlikeuserlist")
	@ResponseBody
	public List<Map<String,String>> fetchlikeuserlist(@RequestParam("bdNo") String bdNo){
		List<Map<String,String>> likeUserList = boardService.selectLikeListByBdNo(bdNo);
		System.out.println(likeUserList);
		if(likeUserList==null) {
			likeUserList = new ArrayList<>();
		}
		
		return likeUserList;
	}
	
	
	@GetMapping("certificatelike")
	@ResponseBody
	public String certificateLike(@RequestParam("bdNo") String bdNo, @RequestParam("lkId") String lkId) {
		Map<String,String> like = boardService.certificateLike(bdNo, lkId);
		//좋아요을 한 적이 없다면 테이블을 조회한 값이 null이다.
		if(like==null) {
			return "ok"; //좋아요를 할 수있음
		}else {
			return "no"; //좋아요를 취소할 수 있음.
		}
	}
	
	@GetMapping("insertlike")
	@ResponseBody
	public String insertLike(@RequestParam("bdNo") String bdNo, @RequestParam("lkId") String lkId) {
		int res = boardService.insertLike(bdNo, lkId);
		System.out.println("좋아요 요청 결과 :"+res);
		if(res!=0) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	
	@GetMapping("deletelike")
	@ResponseBody
	public String deleteLike(@RequestParam("bdNo") String bdNo, @RequestParam("lkId") String lkId) {
		int res = boardService.deleteLike(bdNo, lkId);
		System.out.println("좋아요 취소 결과 :"+res);
		if(res!=0) {
			return "success";
		}else {
			return "failed";
		}
	}
	
	@GetMapping("selectlikecount")
	@ResponseBody
	public int selectLikeCount(@RequestParam("bdNo") String bdNo) {
		int likeCount = boardService.selectLikeCount(bdNo);
		System.out.println("좋아요 갯수 : "+ likeCount);
		return likeCount;
	}
	
	
	
	
	
	
	
	
}
