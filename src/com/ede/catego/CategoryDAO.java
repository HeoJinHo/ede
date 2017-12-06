package com.ede.catego;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ede.util.DBConnector;

public class CategoryDAO {
	
	public List<CategoryDTO> selectList() throws Exception {
		List<CategoryDTO> ar = new ArrayList<>();
		Connection con = DBConnector.getConnect();
		String sql = "select * from product";
		PreparedStatement st =  con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			CategoryDTO categoryDTO = new CategoryDTO();
			categoryDTO.setBrand(rs.getString("brand"));
			categoryDTO.setPro_name(rs.getString("pro_name"));
			categoryDTO.setPro_price(rs.getInt("pro_price"));
			categoryDTO.setCapacity(rs.getInt("capacity"));
			categoryDTO.setInfo(rs.getString("info"));
			categoryDTO.setGrade1(rs.getInt("grade1"));
			categoryDTO.setGrade2(rs.getInt("grade2"));
			categoryDTO.setGrade3(rs.getInt("grade3"));
			categoryDTO.setGrade4(rs.getInt("grade4"));
			categoryDTO.setGrade5(rs.getInt("grade5"));
			categoryDTO.setPic_realName(rs.getString("pic_realName"));
			categoryDTO.setPic_compName(rs.getString("pic_compName"));
			categoryDTO.setEvt(rs.getInt("evt"));
			categoryDTO.setPro_num(rs.getInt("pro_num"));
			//자바에서 카멜기법으로 불러도 db를 제대로 가져오는지
			ar.add(categoryDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	

}
