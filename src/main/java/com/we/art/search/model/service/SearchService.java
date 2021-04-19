package com.we.art.search.model.service;

import java.util.List;
import java.util.Map;

public interface SearchService {

	public List<Map<String,Object>> selectBoardByTag(String tag);
}
