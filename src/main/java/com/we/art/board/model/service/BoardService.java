package com.we.art.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.we.art.board.model.vo.Board;

public interface BoardService {
	public void insertBoard(Board board, List<MultipartFile> files);

	public List<Map<String, Object>> selectBoardByUserId(String userId);

	public Map<String, Object> selectBoardByBdNo(String bdNo);

	public List<Map<String, String>> selectLikeListByBdNo(String bdNo);

	public int insertLike(String bdNo, String lkId);

	int deleteLike(String bdNo, String lkId);

	Map<String, String> certificateLike(String bdNo, String lkId);
}
