package com.we.art.board.model.service.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.we.art.board.model.repository.BoardRepository;
import com.we.art.board.model.service.BoardService;
import com.we.art.board.model.vo.Board;
import com.we.art.common.code.ErrorCode;
import com.we.art.common.exception.ToAlertException;
import com.we.art.common.util.file.FileUtil;
import com.we.art.common.util.file.FileVo;

@Service
public class BoardServiceImpl implements BoardService{
	
	private final BoardRepository boardRepository;
	
	public BoardServiceImpl(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}

	@Override
	public void insertBoard(Board board, List<MultipartFile> files) {
		FileUtil fileUtil = new FileUtil();
		String userId = board.getUserId();
		
		boardRepository.insertBoard(board); // TB_BOARD 테이블 인서트
		boardRepository.insertLike(userId); // TB_LIKE 해당 게시물 좋아요 테이블 인서트
		
		try {
			List<FileVo> fileList = fileUtil.fileUpload(files);
			for(FileVo fileVo : fileList) {
				fileVo.setUserId(userId); // 파일 저장시 필요한 userId
				boardRepository.insertFile(fileVo); // TB_FILE 테이블에 파일 넣기
				boardRepository.insertBoardMaster(); // TB_BOARD_MASTER 해당 게시물에 어떤 파일이 업로드 되어있는지 확인용
			}
		} catch (Exception e) {
			throw new ToAlertException(ErrorCode.IB01,e);
		}
	}

	@Override
	public List<Map<String, Object>> selectBoardByUserId(String userId) {
		
		List<Map<String, Object>> commandList = new ArrayList<Map<String,Object>>();
		List<Board> boardList = boardRepository.selectBoardByUserId(userId);
		
		for(Board board : boardList) {
			Map<String, Object> commandMap = new HashMap<String, Object>();
			commandMap.put("board", board);
			commandMap.put("files", boardRepository.selectFileByBdNo(board.getBdNo()));
			commandList.add(commandMap);
		}
		return boardList.isEmpty() ? null : commandList;
	}

//	장영우가 추가한 부분
	@Override
	public Map<String, Object> selectBoardByBdNo(String bdNo) {
		Map<String,Object> board = null;
		board = boardRepository.selectBoardByBdNo(bdNo);
		List<FileVo> fileList = new ArrayList<>();
		fileList = boardRepository.selectFileByBdNo(bdNo);
		Map<String,Object> commandMap = new HashMap<String,Object>();
		if(board!=null) {
			commandMap.put("board", board);
			commandMap.put("files",fileList);
		}
		return commandMap;
	}

	@Override
	public List<Map<String, String>> selectLikeListByBdNo(String bdNo) {
		return boardRepository.selectLikeListByBdNo(bdNo);
	}

	@Override
	public int insertLike(String bdNo, String lkId) {
		return 0;
	}
	
	
	
}
