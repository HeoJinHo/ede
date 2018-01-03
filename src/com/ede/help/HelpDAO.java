package com.ede.help;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ede.board.BoardDAO;
import com.ede.board.BoardDTO;
import com.ede.member.MemberDTO;
import com.ede.util.MakeRow;
import com.ede.util.DBConnector;

public class HelpDAO implements BoardDAO {

	public int getNum() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select qna_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int num = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		
		return num;
	}
	
	@Override
	public int insert(BoardDTO boardDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="insert into qna values(?,?,?,?,0,sysdate,?,0,0,1,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, boardDTO.getNum());
		st.setString(2, boardDTO.getTitle());
		st.setString(3, boardDTO.getContents());
		st.setString(4, boardDTO.getWriter());
		st.setInt(5, boardDTO.getNum());
		st.setString(6, boardDTO.getWriter());
 		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql="update qna set title=?, contents=? where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, boardDTO.getTitle());
		st.setString(2, boardDTO.getContents());
		st.setInt(3, boardDTO.getNum());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}

	@Override
	public int delete(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="delete qna where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		
		return result;
	}

	@Override
	public BoardDTO selectOne(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select * from qna where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		HelpDTO helpDTO = null;
		if(rs.next()) {
			helpDTO = new HelpDTO();
			helpDTO.setNum(rs.getInt("num"));
			helpDTO.setTitle(rs.getString("title"));
			helpDTO.setWriter(rs.getString("writer"));
			helpDTO.setContents(rs.getString("contents"));
			helpDTO.setReg_date(rs.getDate("reg_date"));
			helpDTO.setHit(rs.getInt("hit"));
			helpDTO.setRef(rs.getInt("ref"));
			helpDTO.setStep(rs.getInt("step"));
			helpDTO.setDepth(rs.getInt("depth"));
			helpDTO.setId(rs.getString("id"));

		}
		DBConnector.disConnect(rs, st, con);
		return helpDTO;
	}

	@Override
	public List<BoardDTO> selectList(MakeRow makeRow) throws Exception {		
		return null;
	}
	
	public List<BoardDTO> selectList(MakeRow makeRow, MemberDTO memberDTO) throws Exception {
		List<BoardDTO> ar = new ArrayList<BoardDTO>();
		Connection con = DBConnector.getConnect();
		String sql ="select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from qna where partition=1 and (id=? or 1=?) order by ref desc, step asc) N) "
				+ "where R between ? and ?";
				
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setInt(2, memberDTO.getLev());
		st.setInt(3, makeRow.getStartRow());
		st.setInt(4, makeRow.getLastRow());
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			HelpDTO helpDTO = new HelpDTO();
			helpDTO.setNum(rs.getInt("num"));
			helpDTO.setTitle(rs.getString("title"));
			helpDTO.setWriter(rs.getString("writer"));
			helpDTO.setContents(rs.getString("contents"));
			helpDTO.setReg_date(rs.getDate("reg_date"));
			helpDTO.setHit(rs.getInt("hit"));
			helpDTO.setRef(rs.getInt("ref"));
			helpDTO.setStep(rs.getInt("step"));
			helpDTO.setDepth(rs.getInt("depth"));
			ar.add(helpDTO);
		}
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}

	@Override
	public int getTotalCount(MakeRow makeRow) throws Exception {		
		return 0;
	}
	
	public int getTotalCount(MakeRow makeRow, MemberDTO memberDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from qna where partition=1 and (id=? or 1=?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setInt(2, memberDTO.getLev());
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount= rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		
		return totalCount;
	}

	@Override
	public int hit(int num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="update qna set hit=hit+1 where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	public int replyInsert(HelpDTO helpDTO, HelpDTO parent)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="insert into qna values(qna_seq.nextval,?,?,?,0,sysdate,?,?,?,1,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, helpDTO.getTitle());
		st.setString(2, helpDTO.getContents());
		st.setString(3, helpDTO.getWriter());
		st.setInt(4, parent.getRef());
		st.setInt(5, parent.getStep()+1);
		st.setInt(6, parent.getDepth()+1);
		st.setString(7, parent.getId());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int replyUpdate(HelpDTO helpDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "update qna set step=step+1 where ref=? and step>?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, helpDTO.getRef());
		st.setInt(2, helpDTO.getStep());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
		
	}
}
