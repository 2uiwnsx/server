package com.test.toy.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/add.do")
public class Add extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/add.jsp");
		
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");

		BoardDTO dto = new BoardDTO();
		
		dto.setId(id);
		dto.setSubject(subject);
		dto.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.addPost(dto);

		if (result == 1) {
				
			resp.sendRedirect("/toy/board/list.do");
			
		} else {
			
			resp.setContentType("text/html");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.println("<script>");
			writer.println("alert('등록에 실패했습니다.');");
			writer.println("history.back();");
			writer.println("</script>");
			
			writer.close();
			
		}

	}

}
