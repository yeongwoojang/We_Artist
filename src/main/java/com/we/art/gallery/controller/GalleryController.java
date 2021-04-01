package com.we.art.gallery.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.we.art.common.code.ConfigCode;

@Controller
public class GalleryController {
	
	@GetMapping("gallery")
	public String ShowGallery() {
		return "gallery/gallery";
	}
	
	@GetMapping("galleryinfo")
	public String setGallery() {
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
	
}
