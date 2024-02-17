package com.test.ajax.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.ajax.model.AddressDTO;
import com.test.ajax.model.CatDTO;
import com.test.ajax.model.MemoDTO;

public class AjaxDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public AjaxDAO() {
		
		this.conn = DBUtil.open();
		
	}

	public int getMemoCount() {
		
		try {
			
			stat = conn.createStatement();
			
			String sql = "SELECT COUNT(*) AS cnt FROM tblMemo";
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				
				return rs.getInt("cnt");
				
			}
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.getMemoCount()");
			
			e.printStackTrace();
			
		}

		return 0;
		
	}

	public int getMemoCount(String name) {
		
		try {
			
			stat = conn.createStatement();
			
			String sql = String.format("SELECT COUNT(*) AS cnt FROM tblMemo WHERE name = '%s'", name);
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				
				return rs.getInt("cnt");
				
			}
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.getMemoCount()");
			
			e.printStackTrace();
			
		}
		
		return 0;
		
	}
	
	public ArrayList<MemoDTO> getMemoList() {
		
		try {
			
			stat = conn.createStatement();
			
			String sql = "SELECT * FROM tblMemo";
			
			rs = stat.executeQuery(sql);
			
			ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
			
			while (rs.next()) {
				
				MemoDTO dto = new MemoDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPswd(rs.getString("pswd"));
				dto.setMemo(rs.getString("memo"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.getMemoList()");
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	public MemoDTO getMemo(int seq) {
		
		try {
			
			String sql = "SELECT * FROM tblMemo WHERE seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setInt(1, seq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {

				MemoDTO dto = new MemoDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPswd(rs.getString("pswd"));
				dto.setMemo(rs.getString("memo"));
				dto.setRegdate(rs.getString("regdate"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.getMemo()");
			
			e.printStackTrace();
			
		}

		return null;
		
	}

	public int checkId(String id) {
		
		try {
			
			String sql = "SELECT COUNT(*) AS cnt FROM tblUser WHERE id = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				return rs.getInt("cnt");
				
			}
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.checkId()");
			
			e.printStackTrace();
			
		}

		return 0;
		
	}
	
	public ArrayList<CatDTO> getCatList() {

		try {
			
			stat = conn.createStatement();
			
			String sql = "SELECT * FROM tblCat";
			
			rs = stat.executeQuery(sql);
			
			ArrayList<CatDTO> list = new ArrayList<CatDTO>();
			
			while (rs.next()) {
				
				CatDTO dto = new CatDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCatId(rs.getString("catId"));
				dto.setX(rs.getString("x"));
				dto.setY(rs.getString("y"));
				
				list.add(dto);
				
			}
			
			rs.close();
			
			stat.close();
			
			conn.close();
			
			return list;
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.getCatList()");
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	public void updateCatPosition(CatDTO dto) {

		try {
			
			String sql = "UPDATE tblCat SET x = ?, y = ? WHERE catId = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getX());
			pstat.setString(2, dto.getY());
			pstat.setString(3, dto.getCatId());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.updateCatPosition()");
			
			e.printStackTrace();
			
		}
		
	}

	public ArrayList<AddressDTO> getAddressList() {
		
		try {
			
			stat = conn.createStatement();
			
			String sql = "SELECT seq, name, age, gender, address, TO_CHAR(regdate, 'YYYY-MM-DD') AS regdate FROM tblAddress ORDER BY seq DESC";
			
			rs = stat.executeQuery(sql);
			
			ArrayList<AddressDTO> list = new ArrayList<AddressDTO>();
			
			while (rs.next()) {
				
				AddressDTO dto = new AddressDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setAddress(rs.getString("address"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.getAddressList()");
			
			e.printStackTrace();
			
		}

		return null;
		
	}

	public int addAddress(AddressDTO dto) {

		try {
			
			String sql = "INSERT INTO tblAddress (seq, name, age, gender, address, regdate) VALUES (addressSeq.NEXTVAL, ?, ?, ?, ?, DEFAULT)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getAge());
			pstat.setString(3, dto.getGender());
			pstat.setString(4, dto.getAddress());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.addAddress()");
			
			e.printStackTrace();
			
		}
		
		return 0;
		
	}

	public int editAddress(HashMap<String, String> map) {

		try {
			
			String sql = String.format("UPDATE tblAddress SET %s = ? WHERE seq = ?", map.get("column"));
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("value"));
			pstat.setString(2, map.get("seq"));
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.editAddress()");
			
			e.printStackTrace();
			
		}
		
		return 0;
		
	}

	public int deleteAddress(String seq) {

		try {
			
			String sql = "DELETE FROM tblAddress WHERE seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("AjaxDAO.deleteAddress()");
			
			e.printStackTrace();
			
		}
		
		return 0;
		
	}
	
}
