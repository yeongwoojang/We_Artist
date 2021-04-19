package com.we.art.search.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.we.art.common.util.file.FileVo;
import com.we.art.search.model.repository.SearchRepository;
import com.we.art.search.model.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService{

	private final SearchRepository searchRepository;
	
	public SearchServiceImpl(SearchRepository searchRepository) {
		this.searchRepository = searchRepository;
	}

	@Override
	public List<Map<String, Object>> selectBoardByTag(String tag) {
		return searchRepository.selectBoardByTag(tag);
	}

	@Override
	public List<FileVo> selectAllImageFile() {
		return searchRepository.selectAllImageFile();
	}
	
	

}
