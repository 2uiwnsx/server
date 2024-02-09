package com.test.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex04_PreparedStatement {
	
	public static void main(String[] args) {

		String name = "하하하";
		String age = "20";
		String gender = "m";
		String address = "서울시 강남구 역삼동's 아파트";
		
		Connection conn = null;
		
		PreparedStatement pstat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "INSERT INTO tblAddress (seq, name, age, gender, address, regdate) VALUES (addressSeq.NEXTVAL, ?, ?, ?, ?, DEFAULT)";
			
			pstat= conn.prepareStatement(sql);

			pstat.setString(1, name);
			pstat.setString(2, age);
			pstat.setString(3, gender);
			pstat.setString(4, address);
			
			int result = pstat.executeUpdate();
			
			System.out.println(result);
			
			pstat.close();
			
			conn.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}

}
