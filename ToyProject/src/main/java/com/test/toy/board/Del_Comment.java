package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/del_comment.do")
public class Del_Comment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.deleteCmt(seq);
		
		JSONObject obj = new JSONObject();
		
		obj.put("result", result);
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.write(obj.toString());
		
		writer.close();
		
	}

}
