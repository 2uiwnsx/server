package com.test.jdbc;

import java.sql.Connection;

public class Ex02 {
	
	public static void main(String[] args) {
		
		Connection conn = null;
		
		try {
			
			conn = DBUtil.open();
			
			System.out.println("연결 종료: " + conn.isClosed());
			
			conn.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}

}
