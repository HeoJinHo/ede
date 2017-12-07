package com.ede.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.ede.util.DBConnector;

public class ProductDAO {
	//getNum
	public int getNum() throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "select inc_seq.nextval from dual";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int num = rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return num;
	}
	
	//list
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
	
	//regist
	public int regist(ProductDTO productDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql =  "insert into product values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, productDTO.getBrand());
		st.setString(2, productDTO.getPro_name());
		st.setInt(3, productDTO.getPro_price());
		st.setInt(4, productDTO.getCapacity());
		st.setString(5, productDTO.getInfo());
		st.setInt(6, productDTO.getGrade1());
		st.setInt(7, productDTO.getGrade2());
		st.setInt(8, productDTO.getGrade3());
		st.setInt(9, productDTO.getGrade4());
		st.setInt(10, productDTO.getGrade5());
		st.setString(11, "pic_realName");
		st.setString(12, "pic_compName");
		st.setInt(13, productDTO.getEvt());
		st.setInt(14, productDTO.getPro_num());
		st.setString(15, productDTO.getCategory());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}



		 
}
