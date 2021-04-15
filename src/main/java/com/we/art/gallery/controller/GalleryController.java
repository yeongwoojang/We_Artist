package com.we.art.gallery.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.we.art.board.model.service.BoardService;
import com.we.art.common.code.ConfigCode;
import com.we.art.user.model.vo.User;

@Controller
public class GalleryController {
	
	private final BoardService boardService;
	
	public GalleryController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@GetMapping("gallery")
	public String ShowGallery() {
		return "gallery/gallery";
	}
	
	@GetMapping("galleryinfo")
	public String setGallery(@SessionAttribute(name="userInfo", required = false)User user,Model model) {
		String userId = "test01";
		//String userId = user.getUserId();
		
		model.addAttribute("userBoardData", boardService.selectBoardByUserId(userId));
		return "gallery/galleryinfo";
	}
	
	// 갤러리에 필요한 이미지정보를 받아온다
	@PostMapping(value = "sendimage", headers = ("content-type=multipart/*"))
	@ResponseBody
	public String uploadGallery(@RequestParam("test") List<MultipartFile> files) {
		
		//후에 유저 아이디로 받아올 예정이다
		
		System.out.println(files);
		
		
		
		
		/*
		File file = new File(ConfigCode.GALLERY_PATH.desc + files.get(0).getName() + '.' + files.get(0).getContentType());
		if(!file.exists()) {
			new File(ConfigCode.GALLERY_PATH.desc).mkdirs();
		}
		try {
			files.get(0).transferTo(file);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		return "ok";
	}
	
	@GetMapping("headtest")
	public String headtest() {
		return "gallery/headTest";
	}
	
	@GetMapping("load")
	public ResponseEntity<byte[]> loadImage(HttpServletResponse response) {
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null; 
		
		try {
			in = new FileInputStream("C://CODE/test.png");
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in) ,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return entity;
	}
}

















