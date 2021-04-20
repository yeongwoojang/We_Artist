package com.we.art.search.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.we.art.common.util.file.FileVo;
import com.we.art.search.model.service.SearchService;
import com.we.art.user.model.vo.User;

@Controller
@RequestMapping("search")
public class SearchController {
	
	
	private final SearchService searchService;
	
	
	public SearchController(SearchService searchService) {
		this.searchService = searchService;
	}


	@GetMapping("main")
	public String searchMain(@SessionAttribute("userInfo") User userInfo,HttpSession session,Model model) {
		List<FileVo> imageList = searchService.selectAllImageFile();
		System.out.println("이미지 리스트 : "+imageList);
		if(imageList.size()==0) {
			imageList = new ArrayList<FileVo>();
		}
		model.addAttribute("imageList",imageList);
		return "search/search_sub";
	}
	
	
	@GetMapping("tag")
	@ResponseBody
	public List<Map<String,Object>>searchByTag(@RequestParam("tag") String tag, Model model) {
		System.out.println("검색할 태그 : "+ tag);
		List<Map<String, Object>> searchResultList = searchService.selectBoardByTag("#"+tag);
		if(searchResultList.size()==0) {
			searchResultList = new ArrayList<>();
		}
		System.out.println("검색 결과 : "+searchResultList);
		return searchResultList;
	}
}
