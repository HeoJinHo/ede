package com.ede.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ede.util.DBConnector;

public class MemberDAO {

	
	//회원가입
	public int join(MemberDTO memberDTO) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getAddr());
		st.setString(4, memberDTO.getPhone());
		st.setString(5, memberDTO.getNickname());
		st.setString(6, memberDTO.getName());
		st.setString(7, memberDTO.getBirth());
		st.setString(8, memberDTO.getGender());
		st.setInt(9, memberDTO.getPoint());
		st.setString(10, memberDTO.getPic_name());
		st.setString(11, memberDTO.getPic_path());
		st.setInt(12, memberDTO.getLev());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	
	
	
	
	
	
}
