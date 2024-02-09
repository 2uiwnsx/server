package com.test.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Ex03_Statement {
	
	public static void main(String[] args) {
		
		// m1();
		// m2();
		// m3();
		// m4();
		// m5();
		// m6();
		// m7();
		// m8();
		// m9();
		
	}
	
	private static void m9() {

		Connection conn = null;
		
		Statement stat = null;
		
		ResultSet rs = null;
		 
		try {
		
			conn = DBUtil.open();
			
			stat = conn.createStatement();
			
			String sql = "SELECT * FROM tblAddress";
			
			rs = stat.executeQuery(sql);
			
			System.out.println("[번호]\t[이름]\t[나이]\t[주소]");
			
			while (rs.next()) {
				
				System.out.printf("%s\t%s\t%s\t%s\n", rs.getString("seq"), rs.getString("name"), rs.getString("age"), rs.getString("address"));
				
			}
			
			rs.close();
			
			stat.close();
			
			conn.close();
			
		} catch (Exception e) {
		
			e.printStackTrace();
		 
		}
		
	}

	private static void m8() {
		
		Connection conn = null;
		
		Statement stat = null;
		
		ResultSet rs = null;
		 
		try {
		
			conn = DBUtil.open();
			
			stat = conn.createStatement();

			String sql = "SELECT name FROM tblAddress";
			
			rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				
				System.out.println(rs.getString("name"));
				
			}
			
			rs.close();
			
			stat.close();
			
		 	conn.close();
			
		} catch (Exception e) {
		
			e.printStackTrace();
		 
		}
		
	}

	private static void m7() {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("번호: ");
		String seq = scan.nextLine();
		
		Connection conn = null;
		
		Statement stat = null;
		
		ResultSet rs = null;
		 
		try {
			
			conn = DBUtil.open();
			
			stat = conn.createStatement();

		 	String sql = "SELECT * FROM tblAddress WHERE seq = " + seq;
		 	
		 	rs = stat.executeQuery(sql);
		 	
		 	if (rs.next()) {
		 		
		 		System.out.println("번호: " + rs.getString("seq"));
		 		System.out.println("이름: " + rs.getString("name"));
		 		System.out.println("나이: " + rs.getString("age"));
		 		System.out.println("성별: " + rs.getString("gender"));
		 		System.out.println("주소: " + rs.getString("address"));
		 		System.out.println("날짜: " + rs.getString("regdate"));
		 		
		 	} else {
		 		
		 		System.out.println("데이터가 존재하지 않습니다.");
		 		
		 	}
		 	
		 	rs.close();
		 	
		 	stat.close();
		 	
		 	conn.close();

		 } catch (Exception e) {
		 
		 	e.printStackTrace();
		 
		 }
		
	}

	private static void m6() {

		 Connection conn = null;
		 
		 Statement stat = null;
		 
		 ResultSet rs = null;

		 try {
			 
			 conn = DBUtil.open();
			 
			 stat = conn.createStatement();

			 String sql = "SELECT COUNT(*) AS cnt FROM tblAddress";
			 
			 rs = stat.executeQuery(sql);
			 
			 rs.next();

			 int count = rs.getInt("cnt");
			 
			 System.out.println(count);
			 
			 rs.close();
			 
			 stat.close();
			 
			 conn.close();

		 } catch (Exception e) {

			 e.printStackTrace();

		 }
		
	}

	private static void m5() {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("이름: ");
		String name = scan.nextLine();
		
		System.out.print("나이: ");
		String age = scan.nextLine();
		
		System.out.print("성별(m/f): ");
		String gender = scan.nextLine();
		
		System.out.print("주소: ");
		String address = scan.nextLine();
		
		Connection conn = null;
		
		Statement stat = null;
		
		try {

			conn = DBUtil.open();
			
			if (!conn.isClosed()) {
				
				System.out.println("DB 연결에 성공했습니다.");
				
				stat = conn.createStatement();
				
				String sql = String.format("INSERT INTO tblAddress (seq, name, age, gender, address, regdate) VALUES (addressSeq.NEXTVAL, '%s', %s, '%s', '%s', DEFAULT)", name, age, gender, address);

				int result = stat.executeUpdate(sql);
				
				if (result == 1) {
					
					System.out.println(result + " 행이 삽입되었습니다.");
					
				} else {
					
					System.out.println("에러가 발생했습니다.");
					
				}

				stat.close();
				
				conn.close();
				
			} else {
				
				System.out.println("DB 연결에 실패했습니다.");
				
			}
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}

	private static void m4() {

		Connection conn = null;
		
		Statement stat = null;

		try {
			
			conn = DBUtil.open();
			
			stat = conn.createStatement();

			String sql = "CREATE TABLE tblAddress ("
						+ "    seq NUMBER PRIMARY KEY,"
						+ "    name VARCHAR2(30) NOT NULL,"
						+ "    age NUMBER NOT NULL,"
						+ "    gender CHAR(1) NOT NULL,"
						+ "    address VARCHAR2(300) NOT NULL,"
						+ "    regdate DATE DEFAULT SYSDATE NOT NULL"
						+ ")";
			
			stat.executeUpdate(sql);
			
			stat.close();
			
			conn.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}

	private static void m3() {
		
		Connection conn = null;
		
		Statement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			stat = conn.createStatement();

			String sql = "DELETE FROM tblAddress WHERE seq = 1";
			
			int result = stat.executeUpdate(sql);
			
			if (result > 0) {
				
				System.out.println(result + " 행이 삭제되었습니다.");
				
			} else {
				
				System.out.println("에러가 발생했습니다.");
				
			}
			
			stat.close();
			
			conn.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}
	

	private static void m2() {

		Connection conn = null;
		
		Statement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			stat = conn.createStatement();

			String sql = "UPDATE tblAddress SET age = (age + 1)";
			
			int result = stat.executeUpdate(sql);
			
			if (result > 0) {
				
				System.out.println(result + " 행이 업데이트되었습니다.");
				
			} else {
				
				System.out.println("에러가 발생했습니다.");
				
			}
			
			stat.close();
			
			conn.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}
	

	private static void m1() {

		Connection conn = null;
		
		Statement stat = null;
		
		try {
			
			conn = DBUtil.open();
			
			if (!conn.isClosed()) {
				
				System.out.println("DB 연결에 성공했습니다.");
				
				stat = conn.createStatement();

				String sql = "INSERT INTO tblAddress (seq, name, age, gender, address, regdate) VALUES (addressSeq.NEXTVAL, '홍길동', 22, 'm', '서울시 강남구 대치동', DEFAULT)";

				int result = stat.executeUpdate(sql);
				
				if (result == 1) {
					
					System.out.println(result + " 행이 삽입되었습니다.");
					
				} else {
					
					System.out.println("에러가 발생했습니다.");
					
				}
				
				stat.close();
				
				conn.close();
				
			} else {
				
				System.out.println("DB 연결에 실패했습니다.");
				
			}
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}

}
