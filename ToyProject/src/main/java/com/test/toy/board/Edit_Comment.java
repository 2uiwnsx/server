package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.test.toy.board.model.CommentDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/edit_comment.do")
public class Edit_Comment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String content = req.getParameter("content");
		
		CommentDTO dto = new CommentDTO();
		
		dto.setSeq(seq);
		dto.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.editCmt(dto);
		
		JSONObject obj = new JSONObject();
		
		obj.put("result", result);
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.write(obj.toString());
		
		writer.close();

	}

}
