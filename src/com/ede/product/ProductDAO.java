package com.ede.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ede.util.DBConnector;

public class ProductDAO {
	public List<ProductDTO> selectList() throws Exception {
		List<ProductDTO> ar = new ArrayList<ProductDTO>();
		Connection con = DBConnector.getConnect();
		String sql = "select * from product";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			ProductDTO categoryDTO = new ProductDTO();
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
			categoryDTO.setCategory(rs.getString("category"));
			ar.add(categoryDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}
}
