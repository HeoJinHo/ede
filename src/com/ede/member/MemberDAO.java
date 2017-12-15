package com.ede.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ede.util.DBConnector;
import com.ede.member.MemberDTO;

public class MemberDAO {

	
	//회원가입
	public int join(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, 0, 0, 0, 0,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getNickname());
		st.setString(5, memberDTO.getEmail());
		st.setString(6, memberDTO.getPhone());
		st.setString(7, memberDTO.getGender());
		st.setString(8, memberDTO.getBirth());
		st.setString(9, memberDTO.getAddr());
		st.setString(10, memberDTO.getSkin());
	/*	st.setString(10, memberDTO.getPic_name());
		st.setString(11, memberDTO.getPic_path());*/
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select * from member where id=? and pw=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			memberDTO.setName(rs.getString("name"));
			memberDTO.setNickname(rs.getString("nickname"));
			memberDTO.setEmail(rs.getString("email"));
			memberDTO.setPhone(rs.getString("phone"));
			memberDTO.setGender(rs.getString("gender"));
			memberDTO.setBirth(rs.getString("birth"));
			memberDTO.setAddr(rs.getString("addr"));
			memberDTO.setSkin(rs.getString("skin"));
			memberDTO.setLev(rs.getInt("lev"));
		}else {
			memberDTO=null;
		}
		DBConnector.disConnect(rs, st, con);
		return memberDTO;
	}
	
	public int update(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "update member set pw=?, name=?, nickname=?, birth=?, gender=?, skin=?, addr=?, phone=?, email=? where id=? ";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getName());
		st.setString(3, memberDTO.getNickname());
		st.setString(4, memberDTO.getBirth());
		st.setString(5, memberDTO.getGender());
		st.setString(6, memberDTO.getSkin());
		st.setString(7, memberDTO.getAddr());
		st.setString(8, memberDTO.getPhone());
		st.setString(9, memberDTO.getEmail());
		st.setString(10, memberDTO.getId());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int delete(String id) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "delete member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}
	
	public int userdelete(MemberDeleteDTO memberDeleteDTO, MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into userdelete values(?, ?, ?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDeleteDTO.getDeletereason());
		st.setString(2, memberDeleteDTO.getReason());
		st.setString(3, memberDTO.getId());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;	
	}
	
	//idCheck
	public boolean idCheck(String id) throws Exception {
		boolean check=true;
		Connection con = DBConnector.getConnect();
		String sql ="select * from member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			check=false;
		}
		DBConnector.disConnect(rs, st, con);
		return check;
	}
	
}























