package com.test.toy.visitor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.visitor.model.VisitorDTO;
import com.test.toy.visitor.repository.VisitorDAO;

@WebServlet("/visitor/info.do")
public class Info extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		String id = session.getAttribute("id").toString();
		
		VisitorDAO dao = new VisitorDAO();

		VisitorDTO dto = dao.getInfo(id);
		
		String intro = dto.getIntro();
		
		intro = intro.replace("\n", "<br>");
				
		dto.setIntro(intro);

		req.setAttribute("dto", dto);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/visitor/info.jsp");
		
		dispatcher.forward(req, resp);

	}

}
