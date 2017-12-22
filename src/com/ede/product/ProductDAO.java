package com.ede.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ede.util.DBConnector;

public class ProductDAO {
	
	//avgUpdate
	public int avgUpdate (int grade,int pro_num) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql=null;
		if(grade==5) {
			sql = "update product set avg=(select ((grade5+1)*5+grade4*4+grade3*3+grade2*2+grade1)/(grade5+grade4+grade3+grade2+grade1+1) avg from product where pro_num=?)\r\n" + 
					",reply=(select max(reply)+1 reply from product where pro_num=?),grade5=(select max(grade5)+1 grade5 from product) where pro_num=?";
		} else if (grade==4) {
			sql = "update product set avg=(select (grade5*5+(grade4+1)*4+grade3*3+grade2*2+grade1)/(grade5+grade4+grade3+grade2+grade1+1) avg from product where pro_num=?)\r\n" + 
					",reply=(select max(reply)+1 reply from product where pro_num=?),grade4=(select max(grade4)+1 grade4 from product) where pro_num=?";
		} else if (grade==3) {
			sql = "update product set avg=(select (grade5*5+grade4*4+(grade3+1)*3+grade2*2+grade1)/(grade5+grade4+grade3+grade2+grade1+1) avg from product where pro_num=?)\r\n" + 
					",reply=(select max(reply)+1 reply from product where pro_num=?),grade3=(select max(grade3)+1 grade3 from product) where pro_num=?";
		} else if (grade==2) {
			sql = "update product set avg=(select (grade5*5+grade4*4+grade3*3+(grade2+1)*2+grade1)/(grade5+grade4+grade3+grade2+grade1+1) avg from product where pro_num=?)\r\n" + 
					",reply=(select max(reply)+1 reply from product where pro_num=?),grade2=(select max(grade2)+1 grade2 from product) where pro_num=?";
		} else if (grade==1) {
			sql = "update product set avg=(select (grade5*5+grade4*4+grade3*3+grade2*2+grade1+1)/(grade5+grade4+grade3+grade2+grade1+1) avg from product where pro_num=?)\r\n" + 
					",reply=(select max(reply)+1 reply from product where pro_num=?),grade1=(select max(grade1)+1 grade1 from product) where pro_num=?";
		}
		//System.out.println(sql);
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, pro_num);
		st.setInt(2, pro_num);
		st.setInt(3, pro_num);
		int result=st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	// Fileter
	public List<ProductDTO> filterList(String del, String[] type, String category, String brand) throws Exception {
		
		List<ProductDTO> ar = new ArrayList<ProductDTO>();
		Connection con = DBConnector.getConnect();
		String sql = null;
		if (del.equals("category")) {
			PreparedStatement st = null;
			if(category.equals("reviewCount")) {
				sql = "select * from product where";
				if(type.length>0) {
					sql=sql+"  type in (";
					for(int i=0;i<type.length;i++) {
						sql=sql+"?";
						if(i != type.length-1) {
							sql=sql+",";
						}
					}
					sql=sql+") order by reply desc";
				}
				st = con.prepareStatement(sql);
				for(int i=0;i<type.length;i++) {
					st.setString(i+1, type[i]);
				}
			} else if (category.equals("avg")) {
				sql = "select * from product ";
				if(type.length>0) {
					sql=sql+"where type in (";
					for(int i=0;i<type.length;i++) {
						sql=sql+"?";
						if(i != type.length-1) {
							sql=sql+",";
						}
					}
					sql=sql+") order by avg desc";
				}
				st = con.prepareStatement(sql);
				for(int i=0;i<type.length;i++) {
					st.setString(i+1, type[i]);
				}
			}
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
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
				productDTO.setType(rs.getString("type"));
				productDTO.setAvg(rs.getDouble("avg"));
				productDTO.setReply(rs.getInt("reply"));
				ar.add(productDTO);
			}
			DBConnector.disConnect(rs, st, con);
		} else if (del.equals("brand")) {
			PreparedStatement st =null;
			if(category.equals("reviewCount")) {
				sql = "select * from product where";
				if(type.length>0) {
					sql=sql+"  type in (";
					for(int i=0;i<type.length;i++) {
						sql=sql+"?";
						if(i != type.length-1) {
							sql=sql+",";
						}
					}
					sql=sql+") and brand='"+brand+"' order by reply desc";
				}
				st = con.prepareStatement(sql);
				for(int i=0;i<type.length;i++) {
					st.setString(i+1, type[i]);
				}
			} else if (category.equals("avg")) {
				sql = "select * from product ";
				if(type.length>0) {
					sql=sql+"where type in (";
					for(int i=0;i<type.length;i++) {
						sql=sql+"?";
						if(i != type.length-1) {
							sql=sql+",";
						}
					}
					sql=sql+") and brand='"+brand+"' order by avg desc";
				}
				st = con.prepareStatement(sql);
				for(int i=0;i<type.length;i++) {
					st.setString(i+1, type[i]);
				}
			}
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
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
				productDTO.setType(rs.getString("type"));
				productDTO.setAvg(rs.getDouble("avg"));
				productDTO.setReply(rs.getInt("reply"));
				ar.add(productDTO);
			}
			DBConnector.disConnect(rs, st, con);
		}
		return ar;
	}

	// getNum
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

	// review
	public int review(ReplyDTO replyDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into reply values(inc_seq.nextval,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, replyDTO.getId());
		st.setString(2, replyDTO.getContents());
		st.setString(3, replyDTO.getReport());
		st.setInt(4, replyDTO.getGrade());
		st.setInt(5, replyDTO.getPro_num());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	// selectReview
	public List<ReplyDTO> reviewList(int pro_num) throws Exception {
		ReplyDTO replyDTO = null;
		List<ReplyDTO> ar = new ArrayList<ReplyDTO>();
		Connection con = DBConnector.getConnect();
		String sql = "select * from reply where pro_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, pro_num);
		ResultSet rs = st.executeQuery();
		while (rs.next()) {
			replyDTO = new ReplyDTO();
			replyDTO.setNum(rs.getInt("num"));
			replyDTO.setId(rs.getString("id"));
			replyDTO.setContents(rs.getString("contents"));
			replyDTO.setReport(rs.getString("report"));
			replyDTO.setGrade(rs.getInt("grade"));
			replyDTO.setPro_num(pro_num);
			ar.add(replyDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}

	// categoryList
	public List<ProductDTO> categoryList(String del) throws Exception {
		List<ProductDTO> ar = new ArrayList<ProductDTO>();
		Connection con = DBConnector.getConnect();
		if (del.equals("category")) {
			String sql = "select category from product group by category";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setCategory(rs.getString("category"));
				ar.add(productDTO);
			}
			DBConnector.disConnect(rs, st, con);
		} else if (del.equals("brand")) {
			String sql = "select brand,count(brand) from product group by brand";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setBrand(rs.getString(1));
				productDTO.setCapacity(rs.getInt(2)); // 등록된 갯수
				ar.add(productDTO);
			}
			DBConnector.disConnect(rs, st, con);
		}
		return ar;
	}

	// productList
	public List<ProductDTO> productList(String del, String brand) throws Exception {
		List<ProductDTO> ar = new ArrayList<ProductDTO>();
		Connection con = DBConnector.getConnect();
		ResultSet rs = null;
		PreparedStatement st = null;
		if (del.equals("category")) {
			String sql = "select * from product order by reply desc";
			st = con.prepareStatement(sql);
		} else if (del.equals("brand")) {
			String sql = "select * from product where brand=? order by reply desc ";
			st = con.prepareStatement(sql);
			st.setString(1, brand);
		}
		rs = st.executeQuery();
		while (rs.next()) {
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
			productDTO.setType(rs.getString("type"));
			productDTO.setAvg(rs.getDouble("avg"));
			productDTO.setReply(rs.getInt("reply"));
			ar.add(productDTO);
		}
		DBConnector.disConnect(rs, st, con);
		return ar;
	}

	// Regist
	public int regist(ProductDTO productDTO) throws Exception {
		Connection con = DBConnector.getConnect();
		String sql = "insert into product values(?,?,?,?,?,0,0,0,0,0,'re','co',?,?,?,?,0,0)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, productDTO.getBrand());
		st.setString(2, productDTO.getPro_name());
		st.setInt(3, productDTO.getPro_price());
		st.setInt(4, productDTO.getCapacity());
		st.setString(5, productDTO.getInfo());
		st.setInt(6, productDTO.getEvt());
		st.setInt(7, productDTO.getPro_num());
		st.setString(8, productDTO.getCategory());
		st.setString(9, productDTO.getType());
		int result = st.executeUpdate();
		DBConnector.disConnect(st, con);
		return result;
	}

	// view
	public ProductDTO view(int pro_num) throws Exception {
		ProductDTO productDTO = null;
		Connection con = DBConnector.getConnect();
		String sql = "select * from product where pro_num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, pro_num);
		ResultSet rs = st.executeQuery();
		if (rs.next()) {
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
			productDTO.setType(rs.getString("type"));
			productDTO.setAvg(rs.getDouble("avg"));
		}
		DBConnector.disConnect(rs, st, con);
		return productDTO;
	}

}
