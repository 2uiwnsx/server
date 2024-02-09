/*
	▶ 드라이버 오류
	
		▷ java.lang.ClassNotFoundException: oracle.jdbc.driver.oracleDriver
		
	▶ 서버 주소 오류
	
		▷ java.sql.SQLRecoverableException: IO 오류: The Network Adapter could not establish the connection
		▷ Caused by: oracle.net.ns.NetException: The Network Adapter could not establish the connection
		▷ Caused by: java.net.UnknownHostException: 알려진 호스트가 없습니다
	
	▶ 포트 번호 오류
	
		▷ java.sql.SQLRecoverableException: IO 오류: The Network Adapter could not establish the connection
		▷ Caused by: oracle.net.ns.NetException: The Network Adapter could not establish the connection
		▷ Caused by: java.net.ConnectException: Connection refused: no further information
		
	▶ SID 오류
	
		▷ java.sql.SQLException: Listener refused the connection with the following error:ORA-12505, TNS:listener does not currently know of SID given in connect descriptor
		▷ Caused by: oracle.net.ns.NetException: Listener refused the connection with the following error:ORA-12505, TNS:listener does not currently know of SID given in connect descriptor
	
	▶ 연결 문자열 오류
	
		▷ java.sql.SQLException: 부적합한 Oracle URL이 지정되었습니다
	
	▶ 아이디 및 비밀번호 오류
	
		▷ java.sql.SQLException: ORA-01017: invalid username/password; logon denied
		
	▶ ojdbc.jar 관련 오류
	
		▷ java.lang.ClassNotFoundException: oracle.jdbc.driver.OracleDriver
	
	▶ Oracle Service XE 관련 오류
	
		▷ java.sql.SQLException: Listener refused the connection with the following error:ORA-12505, TNS:listener does not currently know of SID given in connect descriptor
		▷ Caused by: oracle.net.ns.NetException: Listener refused the connection with the following error:ORA-12505, TNS:listener does not currently know of SID given in connect descriptor
*/

package com.test.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class Ex01 {
	
	public static void main(String[] args) {

		Connection conn = null;

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "server";
		String password = "java1234";
		
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");

			conn = DriverManager.getConnection(url, user, password);

			System.out.println("연결 종료: " + conn.isClosed());
			
			conn.close();
			
			System.out.println("연결 종료: " + conn.isClosed());

		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}

}
