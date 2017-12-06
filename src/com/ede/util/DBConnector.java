package com.ede.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnector {
	
	public static Connection getConnect() throws Exception {
		/*String user="user04";
		String password="user04";
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";*/
		Context init = new InitialContext();
		DataSource dataSource = (DataSource)init.lookup("java:comp/env/jdbc/user04");
		
		
		Connection con = dataSource.getConnection();
				
		return con;
	}
	
	public static void disConnect(PreparedStatement st, Connection con)throws Exception{
		st.close();
		con.close();
	}
	
	public static void disConnect(ResultSet rs, PreparedStatement st, Connection con) throws Exception {
		rs.close();
		DBConnector.disConnect(st, con);
	}

}
