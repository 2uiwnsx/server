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

@WebServlet("/board/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if (Auth.check(req, resp)) {
			
			return;
			
		}
		
		String seq = req.getParameter("seq");
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = dao.getPost(seq);
		
		String subject = dto.getSubject();
		
		subject = subject.replace("\"", "&quot;");
		
		dto.setSubject(subject);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/edit.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		
		BoardDTO dto = new BoardDTO();
		
		dto.setSeq(seq);
		dto.setId(id);
		dto.setSubject(subject);
		dto.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		
		int result = dao.editPost(dto);

		if (result == 1) {
				
			resp.sendRedirect("/toy/board/view.do?seq=" + seq);
			
		} else {
			
			resp.setContentType("text/html");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.println("<script>");
			writer.println("alert('수정에 실패했습니다.');");
			writer.println("history.back();");
			writer.println("</script>");
			
			writer.close();
			
		}
		
	}

}
