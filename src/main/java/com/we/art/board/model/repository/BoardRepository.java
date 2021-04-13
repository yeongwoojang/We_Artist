package com.we.art.board.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.we.art.board.model.vo.Board;
import com.we.art.common.util.file.FileVo;

@Mapper
public interface BoardRepository {
	
	@Insert("insert into tb_board(bd_no, user_id, bd_title, bd_content, tag)"
			+ " values('b'||sc_bd_idx.nextval, #{userId}, #{bdTitle}, #{bdContent}, #{tag})")
	int insertBoard(Board board);
	
	@Insert("insert into tb_file(f_idx, f_origin, f_rename, user_id, f_save_path)"
			+ " values('f'||sc_file_idx.nextval, #{fOrigin}, #{fRename}, #{userId}, #{fSavePath})")
	int insertFile(FileVo file);
	
	@Insert("insert into tb_board_master(bd_no, f_idx)"
			+ " values('b'||sc_bd_idx.currval, 'f'||sc_file_idx.currval)")
	int insertBoardMaster();
	
	@Insert("insert into tb_like(bd_no, lk_no, lk_id)"
			+ " values('b'||sc_bd_idx.currval, 'l'||sc_like_idx.nextval, #{userId})")
	int insertLike(String userId);
	
	List<Board> selectBoardByUserId(String userId);
	
	List<FileVo> selectFileByBdNo(String bdNo);
	
}