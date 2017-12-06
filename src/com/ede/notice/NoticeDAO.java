package com.ede.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.ede.board.BoardDAO;
import com.ede.board.BoardDTO;
import com.ede.util.DBConnector;
import com.ede.util.MakeRow;

public class NoticeDAO implements BoardDAO {
	
	public int getNum() throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "select board_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int num= rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		
		return num;
	}
	
	public int insert(BoardDTO boardDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="insert into notice values(?,?,?,?,sysdate,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, boardDTO.getNot_num());
		st.setString(2, boardDTO.getNot_title());
		st.setString(3, boardDTO.getWriter());
		st.setString(4, boardDTO.getContents());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}

	public int update(BoardDTO boardDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update notice set not_title=?, contents=?, not_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, boardDTO.getNot_title());
		st.setString(2, boardDTO.getContents());
		st.setInt(3, boardDTO.getNot_num());
		return 0;
	}

	public int delete(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public BoardDTO selectOne(int num) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<BoardDTO> selectList(MakeRow makeRow) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public int getTotalCount(MakeRow makeRow) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public int hit(int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
