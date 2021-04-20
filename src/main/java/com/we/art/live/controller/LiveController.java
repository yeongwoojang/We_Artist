package com.we.art.live.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LiveController {
	
	@GetMapping("/live")
	public String live() {
		return "live/live";
	}
	
	@GetMapping("/showlive")
	public String showlive() {
		return "live/showLive";
	}
	
}
