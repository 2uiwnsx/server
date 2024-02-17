package com.test.toy.visitor.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.test.toy.DBUtil;
import com.test.toy.visitor.model.VisitorDTO;

public class VisitorDAO {
	
	private Connection conn;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public VisitorDAO() {
		
		this.conn = DBUtil.open();
		
	}

	public int register(VisitorDTO dto) {
		
		try {

			String sql = "INSERT INTO tblVisitor (id, pswd, name, email, pic, intro, lv, ing) VALUES (?, ?, ?, ?, ?, ?, 1, DEFAULT)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPswd());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getPic());
			pstat.setString(6, dto.getIntro());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	public VisitorDTO login(VisitorDTO dto) {
		
		try {
			
			String sql = "SELECT * FROM tblVisitor WHERE (id = ?) AND (pswd = ?) AND (ing = 'y')";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPswd());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				VisitorDTO result = new VisitorDTO();
				
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setLv(rs.getString("lv"));
				
				return result;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	public VisitorDTO getInfo(String id) {

		try {
			
			String sql = "SELECT * FROM tblVisitor WHERE id = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				VisitorDTO dto = new VisitorDTO();

				dto.setEmail(rs.getString("email"));
				dto.setPic(rs.getString("pic"));
				dto.setIntro(rs.getString("intro"));
				
				return dto;
				
			}	
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	public int unregister(String id) {
		
		try {

			String sql = "UPDATE tblVisitor SET ing = 'n' WHERE id = ?";

			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);

			return pstat.executeUpdate();

		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return 0;
		
	}

}
