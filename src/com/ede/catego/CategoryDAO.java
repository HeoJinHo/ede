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
			CategoryDTO kimochiDTO = new CategoryDTO();
			kimochiDTO.setBrand(rs.getString("brand"));
			//자바에서 카멜기법으로 불러도 db를 제대로 가져오는지
			ar.add(kimochiDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
	

}
