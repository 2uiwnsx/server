package com.test.memo.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.memo.DBUtil;
import com.test.memo.model.MemoDTO;

public class MemoDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MemoDAO() {
		
		this.conn = DBUtil.open();
		
	}
	
	public ArrayList<MemoDTO> list() {
		
		ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
		
		try {
			
			stat = conn.createStatement();
			
			String sql = "SELECT * FROM tblMemo ORDER BY seq DESC";
			
			rs = stat.executeQuery(sql);
			
			while (rs.next()) {
				
				MemoDTO dto = new MemoDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPswd(rs.getString("pswd"));
				dto.setMemo(rs.getString("memo"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
				
			}
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
		return list;
		
	}
	
	public MemoDTO get(String seq) {
		
		try {
			
			String sql = "SELECT * FROM tblMemo WHERE seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			MemoDTO dto = new MemoDTO();
			
			if (rs.next()) {
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPswd(rs.getString("pswd"));
				dto.setMemo(rs.getString("memo"));
				dto.setRegdate(rs.getString("regdate"));
				
				return dto;
				
			}
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	public int add(MemoDTO dto) {
		
		try {
			
			String sql = "INSERT INTO tblMemo (seq, name, pswd, memo, regdate) VALUES (memoSeq.NEXTVAL, ?, ?, ?, DEFAULT)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getPswd());
			pstat.setString(3, dto.getMemo());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
		return 0;
		
	}

	public boolean check(MemoDTO dto) {

		try {
			
			String sql = "SELECT COUNT(*) AS cnt FROM tblMemo WHERE (seq = ?) AND (pswd = ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getSeq());
			pstat.setString(2, dto.getPswd());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				return ((rs.getInt("cnt") == 1) ? true : false);
				
			}
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
		return false;
		
	}
	
	public int edit(MemoDTO dto) {
		
		try {
			
			String sql = "UPDATE tblMemo SET name = ?, memo = ? WHERE seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getMemo());
			pstat.setString(3, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
		return 0;
		
	}

	public int del(String seq) {
		
		try {
			
			String sql = "DELETE FROM tblMemo WHERE seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}

		return 0;
		
	}

}
