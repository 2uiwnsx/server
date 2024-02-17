package com.test.toy.map.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.toy.DBUtil;
import com.test.toy.map.model.MapDTO;
import com.test.toy.map.model.PlaceDTO;

public class MapDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MapDAO() {
		
		this.conn = DBUtil.open();
		
	}
	
	public ArrayList<MapDTO> getMarkerList() {

		try {
			
			stat = conn.createStatement();
			
			String sql = "SELECT * FROM tblMarker";
			
			rs = stat.executeQuery(sql);
			
			ArrayList<MapDTO> list = new ArrayList<MapDTO>();
			
			while (rs.next()) {
				
				MapDTO dto = new MapDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	public int addMarker(MapDTO dto) {

		try {

			String sql = "INSERT INTO tblMarker (seq, lat, lng) VALUES (markerSeq.NEXTVAL, ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	public ArrayList<PlaceDTO> getPlaceList() {

		try {
			
			stat = conn.createStatement();
			
			String sql = "SELECT * FROM tblPlace";
			
			rs = stat.executeQuery(sql);
			
			ArrayList<PlaceDTO> list = new ArrayList<PlaceDTO>();
			
			while (rs.next()) {
				
				PlaceDTO dto = new PlaceDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setCategory(rs.getString("category"));
				dto.setName(rs.getString("name"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	public int addPlace(PlaceDTO dto) {

		try {

			String sql = "INSERT INTO tblPlace (seq, category, name, lat, lng) VALUES (placeSeq.NEXTVAL, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getCategory());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getLat());
			pstat.setString(4, dto.getLng());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	public int deletePlace(String seq) {
		
		try {

			String sql = "DELETE FROM tblPlace WHERE seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

}
