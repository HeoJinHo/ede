package com.ede.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}

	public int delete(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "delete notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}

	public BoardDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		NoticeDTO noticeDTO = null;
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNot_num(rs.getInt("not_num"));
			noticeDTO.setNot_title(rs.getString("not_title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		DBConnector.disConnect(rs, st, con);
		
		return noticeDTO;
	}

	public List<BoardDTO> selectList(MakeRow makeRow) throws Exception {
		List<BoardDTO> ar = new ArrayList<BoardDTO>();
		Connection con = DBConnector.getConnect();
		String sql ="select * from" 
				+"(select rownum R, N.* from"
				+"(select * from notice where "+makeRow.getKind()+" like ? order by num desc) N) "
				+"where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNot_num(rs.getInt("not_num"));
			noticeDTO.setNot_title(rs.getString("not_title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));	
			ar.add(noticeDTO);
		}
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}

	public int getTotalCount(MakeRow makeRow) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select nvl(count(num), 0) from notice where "+makeRow.getKind()+" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		
		return totalCount;
	}

	public int hit(int num) throws Exception {
		
		return 0;
	}

}
