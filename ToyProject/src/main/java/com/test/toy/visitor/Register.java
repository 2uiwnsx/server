package com.test.toy.visitor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.toy.visitor.model.VisitorDTO;
import com.test.toy.visitor.repository.VisitorDAO;

@WebServlet("/visitor/register.do")
public class Register extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/visitor/register.jsp");

		dispatcher.forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			MultipartRequest multi = new MultipartRequest(req, req.getRealPath("/asset/pic"), (1024 * 1024 * 10), "UTF-8", new DefaultFileRenamePolicy());
			
			String id = multi.getParameter("id");
			String pswd = multi.getParameter("pswd");
			String name = multi.getParameter("name");
			String email = multi.getParameter("email");
			String pic = multi.getFilesystemName("pic");
			String intro = multi.getParameter("intro");
			
			VisitorDTO dto = new VisitorDTO();
			
			dto.setId(id);
			dto.setPswd(pswd);
			dto.setName(name);
			dto.setEmail(email);
			
			if (pic != null) {
				
				dto.setPic(pic);
				
			} else {
				
				dto.setPic("pic.png");
				
			}
			
			dto.setIntro(intro);
			
			VisitorDAO dao = new VisitorDAO();
			
			int result = dao.register(dto);
			
			if (result == 1) {
				
				resp.sendRedirect("/toy/index.do");
				
			} else {
				
				resp.setContentType("text/html");
				resp.setCharacterEncoding("UTF-8");
				
				PrintWriter writer = resp.getWriter();
				
				writer.println("<script>");
				writer.println("alert('가입에 실패했습니다.');");
				writer.println("history.back();");
				writer.println("</script>");
				
				writer.close();
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}

}
