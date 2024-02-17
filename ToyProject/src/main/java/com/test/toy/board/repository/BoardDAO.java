package com.test.toy.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.toy.DBUtil;
import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.model.CommentDTO;

public class BoardDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BoardDAO() {
		
		this.conn = DBUtil.open();
		
	}

	public ArrayList<BoardDTO> getPostList(HashMap<String, String> map) {

		try {
			
			stat = conn.createStatement();
			
			String where = "";
			
			if (map.get("search").equals("y")) {
				
				where = String.format("WHERE %s LIKE '%%%s%%'", map.get("column"), map.get("word"));
				
			}
			
			String sql = String.format("SELECT * FROM (SELECT b.*, ROWNUM AS rnum FROM vwBoard b %s) WHERE rnum BETWEEN %s AND %s", where, map.get("startIndex"), map.get("endIndex"));
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setIsNew(rs.getInt("isNew"));
				dto.setReadCount(rs.getInt("readCount"));
				dto.setCmtCount(rs.getInt("cmtCount"));
				
				list.add(dto);
				
			}	
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}
	
	public int getPostCount() {

		try {
			
			stat = conn.createStatement();

			String sql = "SELECT COUNT(*) AS cnt FROM tblBoard";

			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	public int addPost(BoardDTO dto) {

		try {

			String sql = "INSERT INTO tblBoard (seq, id, subject, content, regdate, readCount) VALUES (boardSeq.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT)";

			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getSubject());
			pstat.setString(3, dto.getContent());

			return pstat.executeUpdate();

		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return 0;
		
	}

	public BoardDTO getPost(String seq) {

		try {
			
			String sql = "SELECT b.*, (SELECT name FROM tblVisitor WHERE id = b.id) AS name FROM tblBoard b WHERE seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadCount(rs.getInt("readCount"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	public void updateReadCount(String seq) {

		try {

			String sql = "UPDATE tblBoard SET readCount = (readCount + 1) WHERE seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);
			
			pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
	}

	public int editPost(BoardDTO dto) {

		try {

			String sql = "UPDATE tblBoard SET subject = ?, content = ? WHERE seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	public void deleteAllCmt(String seq) {

		try {

			String sql = "DELETE FROM tblComment WHERE boardSeq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
	}

	public int deletePost(String seq) {

		try {

			String sql = "DELETE FROM tblBoard WHERE seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	public ArrayList<CommentDTO> getCmtList(String seq) {

		try {
			
			String sql = "SELECT c.*, (SELECT name FROM tblVisitor WHERE id = c.id) AS name FROM tblComment c WHERE boardSeq = ? ORDER BY seq DESC";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
			
			while (rs.next()) {
				
				CommentDTO dto = new CommentDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setBoardSeq(rs.getString("boardSeq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return null;
		
	}

	public int addCmt(CommentDTO dto) {

		try {

			String sql = "INSERT INTO tblComment (seq, boardSeq, id, content, regdate) VALUES (commentSeq.NEXTVAL, ?, ?, ?, DEFAULT)";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getBoardSeq());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getContent());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
	public int editCmt(CommentDTO dto) {

		try {

			String sql = "UPDATE tblComment SET content = ? WHERE seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getContent());
			pstat.setString(2, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}

	public int deleteCmt(String seq) {

		try {

			String sql = "DELETE FROM tblComment WHERE seq = ?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}
		
		return 0;
		
	}
	
}
