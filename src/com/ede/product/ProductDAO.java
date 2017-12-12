package com.ede.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	//categoryList
	public List<ProductDTO> categoryList(String del) throws Exception {
		List<ProductDTO> ar = new ArrayList<ProductDTO>();
		Connection con = DBConnector.getConnect();
		if(del.equals("category")) {
			String sql = "select category from product group by category";
			PreparedStatement st =  con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setCategory(rs.getString("category"));
				ar.add(productDTO);
			}
			DBConnector.disConnect(rs, st, con);
		} else  if(del.equals("brand")) {
			String sql = "select brand,count(brand) from product group by brand";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setBrand(rs.getString(1));
				productDTO.setCapacity(rs.getInt(2));	//등록된 갯수
				ar.add(productDTO);
			}
			DBConnector.disConnect(rs, st, con);
		}
		return ar;
	}
	
	//productList
	public List<ProductDTO> productList(String del, String brand) throws Exception {
		List<ProductDTO> ar = new ArrayList<ProductDTO>();
		Connection con = DBConnector.getConnect();
		if(del.equals("category")) {
			String sql = "select * from product order by grade5 desc";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setBrand(rs.getString("brand"));
				productDTO.setPro_name(rs.getString("pro_name"));
				productDTO.setPro_price(rs.getInt("pro_price"));
				productDTO.setCapacity(rs.getInt("capacity"));
				productDTO.setInfo(rs.getString("info"));
				productDTO.setGrade1(rs.getInt("grade1"));
				productDTO.setGrade2(rs.getInt("grade2"));
				productDTO.setGrade3(rs.getInt("grade3"));
				productDTO.setGrade4(rs.getInt("grade4"));
				productDTO.setGrade5(rs.getInt("grade5"));
				productDTO.setPic_realName(rs.getString("pic_realName"));
				productDTO.setPic_compName(rs.getString("pic_compName"));
				productDTO.setEvt(rs.getInt("evt"));
				productDTO.setPro_num(rs.getInt("pro_num"));
				productDTO.setCategory(rs.getString("category"));
				ar.add(productDTO);
			}
			DBConnector.disConnect(rs, st, con);
		} else  if(del.equals("brand")) {
			String sql = "select * from product where brand=? order by grade5 desc ";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, brand);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setBrand(rs.getString("brand"));
				productDTO.setPro_name(rs.getString("pro_name"));
				productDTO.setPro_price(rs.getInt("pro_price"));
				productDTO.setCapacity(rs.getInt("capacity"));
				productDTO.setInfo(rs.getString("info"));
				productDTO.setGrade1(rs.getInt("grade1"));
				productDTO.setGrade2(rs.getInt("grade2"));
				productDTO.setGrade3(rs.getInt("grade3"));
				productDTO.setGrade4(rs.getInt("grade4"));
				productDTO.setGrade5(rs.getInt("grade5"));
				productDTO.setPic_realName(rs.getString("pic_realName"));
				productDTO.setPic_compName(rs.getString("pic_compName"));
				productDTO.setEvt(rs.getInt("evt"));
				productDTO.setPro_num(rs.getInt("pro_num"));
				productDTO.setCategory(rs.getString("category"));
				ar.add(productDTO);
			}
			DBConnector.disConnect(rs, st, con);
		}
		return ar;
	}
	
	//Regist
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
	
	//view
	public ProductDTO view(String pro_name) throws Exception {
		ProductDTO productDTO = null;
		Connection con = DBConnector.getConnect();
		String sql = "select * from product where pro_name=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, pro_name);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			productDTO = new ProductDTO();
			productDTO.setBrand(rs.getString("brand"));
			productDTO.setPro_name(rs.getString("pro_name"));
			productDTO.setPro_price(rs.getInt("pro_price"));
			productDTO.setCapacity(rs.getInt("capacity"));
			productDTO.setInfo(rs.getString("info"));
			productDTO.setGrade1(rs.getInt("grade1"));
			productDTO.setGrade2(rs.getInt("grade2"));
			productDTO.setGrade3(rs.getInt("grade3"));
			productDTO.setGrade4(rs.getInt("grade4"));
			productDTO.setGrade5(rs.getInt("grade5"));
			productDTO.setPic_realName(rs.getString("pic_realName"));
			productDTO.setPic_compName(rs.getString("pic_compName"));
			productDTO.setEvt(rs.getInt("evt"));
			productDTO.setPro_num(rs.getInt("pro_num"));
			productDTO.setCategory(rs.getString("category"));
		}
		DBConnector.disConnect(rs, st, con);
		return productDTO;
	}

}
