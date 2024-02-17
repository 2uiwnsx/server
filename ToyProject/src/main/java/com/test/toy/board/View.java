package com.test.toy.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		BoardDAO dao = new BoardDAO();
		
		if (session.getAttribute("read").toString().equals("n")) {
			
			session.setAttribute("read", "y");

			dao.updateReadCount(seq);
			
		}
		
		BoardDTO dto = dao.getPost(seq);
		
		String subject = dto.getSubject();
		
		subject = subject.replace("<", "&lt;").replace(">", "&gt;");
		
		dto.setSubject(subject);
		
		String content = dto.getContent();

		content = content.replace("<", "&lt;").replace(">", "&gt;").replace("\n", "<br>");
		
		dto.setContent(content);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/view.jsp");

		dispatcher.forward(req, resp);

	}

}
