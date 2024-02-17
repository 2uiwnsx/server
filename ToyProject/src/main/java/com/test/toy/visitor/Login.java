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

import com.test.toy.visitor.model.VisitorDTO;
import com.test.toy.visitor.repository.VisitorDAO;

@WebServlet("/visitor/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/visitor/login.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pswd = req.getParameter("pswd");

		VisitorDTO dto = new VisitorDTO();
		
		dto.setId(id);
		dto.setPswd(pswd);
		
		VisitorDAO dao = new VisitorDAO();
		
		dto = dao.login(dto);
		
		HttpSession session = req.getSession();
		
		if (dto != null) {
			
			session.setAttribute("id", id);
			session.setAttribute("name", dto.getName());
			session.setAttribute("lv", dto.getLv());
			
			resp.sendRedirect("/toy/index.do");
			
		} else {
			
			resp.setContentType("text/html");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter writer = resp.getWriter();
			
			writer.println("<script>");
			writer.println("alert('로그인에 실패했습니다.');");
			writer.println("history.back();");
			writer.println("</script>");
			
			writer.close();
			
		}

	}

}
