package com.ede.meet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ede.util.DBConnector;
import com.ede.util.MakeRow;

public class MeetDAO {

	//totalCount
	public int getTotalCount(MakeRow makeRow) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from meet where "+makeRow.getKind() +" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount= rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		
		return totalCount;
	}
	
	//selectList
	
	public List<MeetDTO> selectList(MakeRow makeRow) throws Exception {
		List<MeetDTO> ar = new ArrayList<>();
		Connection con = DBConnector.getConnect();
		String sql ="select * from "
				+ "(select rownum R, M.* from "
				+ "(select * from meet where "+makeRow.getKind()+" like ? order by num desc) M) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+makeRow.getSearch()+"%");
		st.setInt(2, makeRow.getStartRow());
		st.setInt(3, makeRow.getLastRow());
		ResultSet rs = st.executeQuery();
		
		while (rs.next()) {
			MeetDTO meetDTO = new MeetDTO();
			meetDTO.setM_seq((rs.getInt("m_seq")));
			meetDTO.setId(rs.getString("id"));
			meetDTO.setM_name(rs.getString("m_name"));
			meetDTO.setM_title(rs.getString("m_title"));
			meetDTO.setM_contents(rs.getString("m_contents"));
			meetDTO.setStart_date(rs.getString("start_date"));
			meetDTO.setLast_date(rs.getString("last_date"));
			meetDTO.setStart_apply(rs.getString("start_apply"));
			meetDTO.setLast_apply(rs.getString("last_apply"));
			meetDTO.setM_addr(rs.getString("m_addr"));
			meetDTO.setM_detail_addr(rs.getString("m_detail_addr"));
			meetDTO.setM_price(rs.getInt("m_price"));
			meetDTO.setM_ref(rs.getInt("m_ref"));
			meetDTO.setM_step(rs.getInt("m_step"));
			meetDTO.setM_depth(rs.getInt("m_depth"));
			meetDTO.setM_phone(rs.getString("m_phone"));
			meetDTO.setM_email(rs.getString("m_email"));
			ar.add(meetDTO);
			
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	
	public MeetDTO selectOne(int num) throws Exception {
		MeetDTO meetDTO = null;
		Connection con = DBConnector.getConnect();
		String sql = "select * from meet where m_seq = ?";
		PreparedStatement st = con.prepareStatement(sql);
		System.out.println(num);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		System.out.println("오셨나여~!=====================================================1");
		if(rs.next()) {
			System.out.println("오셨나여~!=====================================================2");
			meetDTO = new MeetDTO();
			meetDTO.setM_seq((rs.getInt("m_seq"))); 
			meetDTO.setId(rs.getString("id"));
			meetDTO.setM_name(rs.getString("m_name"));
			meetDTO.setM_title(rs.getString("m_title"));
			meetDTO.setM_contents(rs.getString("m_contents"));
			meetDTO.setStart_date(rs.getString("start_date"));
			meetDTO.setLast_date(rs.getString("last_date"));
			meetDTO.setStart_apply(rs.getString("start_apply"));
			meetDTO.setLast_apply(rs.getString("last_apply"));
			meetDTO.setM_addr(rs.getString("m_addr"));
			meetDTO.setM_detail_addr(rs.getString("m_detail_addr"));
			meetDTO.setM_price(rs.getInt("m_price"));
			meetDTO.setM_ref(rs.getInt("m_ref"));
			meetDTO.setM_step(rs.getInt("m_step"));
			meetDTO.setM_depth(rs.getInt("m_depth"));
			meetDTO.setM_phone(rs.getString("m_phone"));
			meetDTO.setM_email(rs.getString("m_email"));
			System.out.println(meetDTO.getM_depth());
		}
		DBConnector.disConnect(rs, st, con);
		return meetDTO;
	}
}
