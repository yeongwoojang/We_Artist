package com.we.art.search.model.service;

import java.util.List;
import java.util.Map;

import com.we.art.common.util.file.FileVo;

public interface SearchService {

	public List<Map<String,Object>> selectBoardByTag(String tag);
	
	public List<Map<String,Object>> selectAllImageFile();
}
