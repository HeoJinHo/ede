package com.ede.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ede.util.DBConnector;

public class CategoryDAO {
	public List<CategoryDTO> selectList() throws Exception {
		List<CategoryDTO> ar = new ArrayList<CategoryDTO>();
		Connection con = DBConnector.getConnect();
		String sql = "select * from product";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			CategoryDTO categoryDTO = new CategoryDTO();
			categoryDTO.setBrand(rs.getString("brand"));
			ar.add(categoryDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
}
