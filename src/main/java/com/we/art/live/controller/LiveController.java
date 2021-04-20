package com.we.art.live.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/live")
public class LiveController {
	
	@GetMapping("/host")
	public String live() {
		return "live/live";
	}
	
	@GetMapping("/guest")
	public String showlive() {
		return "live/showLive";
	}
	
}
