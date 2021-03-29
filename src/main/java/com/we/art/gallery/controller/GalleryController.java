package com.we.art.gallery.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	@PostMapping("galleryupload")
	@ResponseBody
	public String uploadGallery(@RequestBody MultipartFile file) {
		System.out.println(file.getOriginalFilename());
		return "ok";
	}
	
	@GetMapping("headtest")
	public String headtest() {
		return "gallery/headTest";
	}
	
}
