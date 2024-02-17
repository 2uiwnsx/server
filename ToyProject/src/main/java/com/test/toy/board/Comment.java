package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.toy.board.model.CommentDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/comment.do")
public class Comment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<CommentDTO> list = dao.getCmtList(seq);
		
		JSONArray arr = new JSONArray();
		
		for (CommentDTO dto : list) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("seq", dto.getSeq());
			obj.put("boarSeq", dto.getBoardSeq());
			obj.put("id", dto.getId());
			obj.put("name", dto.getName());
			obj.put("content", dto.getContent());
			obj.put("regdate", dto.getRegdate());
			
			arr.add(obj);
			
		}
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.write(arr.toString());
		
		writer.close();

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		
		String content = req.getParameter("content");
		
		CommentDTO dto = new CommentDTO();
		
		dto.setBoardSeq(seq);
		dto.setId(id);
		dto.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.addCmt(dto);
		
		JSONObject obj = new JSONObject();
		
		obj.put("result", result);
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.write(obj.toString());
		
		writer.close();
		
	}

}
