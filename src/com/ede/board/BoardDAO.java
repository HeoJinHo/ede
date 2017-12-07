package com.ede.board;

import java.util.List;

import com.ede.board.BoardDTO;
import com.ede.util.MakeRow;

public interface BoardDAO {

	//insert
	public int insert(BoardDTO boardDTO) throws Exception;
	
	//Update
	public int update(BoardDTO boardDTO) throws Exception;
	
	//delete
	public int delete(int num) throws Exception;
	
	//selectOne
	public BoardDTO selectOne(int num) throws Exception;
	
	//selectList
	public List<BoardDTO> selectList(MakeRow makeRow)throws Exception;
	
	//getCount
	public int getTotalCount(MakeRow makeRow)throws Exception;
	
	//hit
	public int hit(int num)throws Exception;
	
}
