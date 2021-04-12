package com.we.art.board.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.we.art.board.model.vo.Board;

public interface BoardService {
	public void insertBoard(Board board, List<MultipartFile> files);
}
