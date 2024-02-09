package com.test.jdbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import oracle.jdbc.OracleTypes;

public class Ex05_CallableStatement {
	
	public static void main(String[] args) {
		
		// m1();
		// m2();
		// m3();
		// m4();
		// m5();
		
	}
	
	private static void m5() {

		Connection conn = null;
		
		CallableStatement cstat = null;
		
		ResultSet rs = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{call procM5(?)}";
			
			cstat = conn.prepareCall(sql);
			
			cstat.registerOutParameter(1, OracleTypes.CURSOR);
			
			cstat.executeQuery();

			rs = (ResultSet)cstat.getObject(1);
			
			while (rs.next()) {
				
				System.out.println("이름: " + rs.getString("name"));
				System.out.println("나이: " + rs.getInt("age"));
				System.out.println("주소: " + rs.getString("address"));
				
				System.out.println();
				
			}
			
			rs.close();
			
			cstat.close();
			
			conn.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}
	
	private static void m4() {

		Connection conn = null;
		
		CallableStatement cstat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{call procM4(?, ?, ?)}";
			
			cstat = conn.prepareCall(sql);
			
			cstat.registerOutParameter(1, OracleTypes.VARCHAR);
			cstat.registerOutParameter(2, OracleTypes.NUMBER);
			cstat.registerOutParameter(3, OracleTypes.VARCHAR);
			
			cstat.executeQuery();
			
			System.out.println("이름: " + cstat.getString(1));
			System.out.println("나이: " + cstat.getInt(2));
			System.out.println("주소: " + cstat.getString(3));
			
			cstat.close();
			
			conn.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}
	
	private static void m3() {

		Connection conn = null;
		
		CallableStatement cstat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{call procM3(?)}";
			
			cstat = conn.prepareCall(sql);

			cstat.registerOutParameter(1, OracleTypes.NUMBER);

			cstat.executeQuery();
			
			int count = cstat.getInt(1);
			
			System.out.println(count);
			
			cstat.close();
			
			conn.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}
	
	private static void m2() {

		Connection conn = null;
		
		CallableStatement cstat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{call procM2(?, ?, ?, ?)}";
			
			cstat = conn.prepareCall(sql);
			
			cstat.setString(1, "호호호");
			cstat.setString(2, "24");
			cstat.setString(3, "f");
			cstat.setString(4, "서울시 강남구 압구정동");
			
			int result = cstat.executeUpdate();

			System.out.println(result + " 행이 삽입되었습니다.");
			
			cstat.close();
			
			conn.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}

	private static void m1() {

		Connection conn = null;
		
		CallableStatement cstat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "{call procM1}";
			
			cstat = conn.prepareCall(sql);
			
			int result = cstat.executeUpdate();
			
			System.out.println(result + " 행이 삽입되었습니다.");
			
			cstat.close();
			
			conn.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}

}
