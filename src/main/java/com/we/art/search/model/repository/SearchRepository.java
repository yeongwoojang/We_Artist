package com.we.art.search.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.we.art.common.util.file.FileVo;

@Mapper
public interface SearchRepository {
	public List<Map<String,Object>> selectBoardByTag(String tag);
	
	public List<Map<String,Object>> selectAllImageFile();
}
