package com.test.toy.visitor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.visitor.repository.VisitorDAO;

@WebServlet("/visitor/unregister.do")
public class Unregister extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/visitor/unregister.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		
		VisitorDAO dao = new VisitorDAO();
		
		int result = dao.unregister(id);
		
		if (result == 1) {

			session.removeAttribute("id");
			session.removeAttribute("name");
			session.removeAttribute("lv");
			
			resp.sendRedirect("/toy/index.do");
			
		} else {
			
			resp.setContentType("text/html");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.println("<script>");
			writer.println("alert('탈퇴에 실패했습니다.');");
			writer.println("history.back();");
			writer.println("</script>");
			
			writer.close();
			
		}
		
	}

}
