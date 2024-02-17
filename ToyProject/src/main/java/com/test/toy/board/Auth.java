package com.test.toy.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.repository.BoardDAO;

public class Auth {

	public static boolean check(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session = req.getSession();
		
		String id = session.getAttribute("id").toString();
		String lv = session.getAttribute("lv").toString();
		
		String seq = req.getParameter("seq");
		
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = dao.getPost(seq);
		
		if (!id.equals(dto.getId()) && !lv.equals("2")) {
			
			try {
				
				resp.setContentType("text/html");
				resp.setCharacterEncoding("UTF-8");
				
				PrintWriter writer = resp.getWriter();
				
				writer.println("<script>");
				writer.println("alert('권한이 없습니다.');");
				writer.println("history.back();");
				writer.println("</script>");
				
				writer.close();
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}
			
			return true;
			
		}
		
		return false;
		
	}

}
