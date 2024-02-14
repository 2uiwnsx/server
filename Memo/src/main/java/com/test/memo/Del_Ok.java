package com.test.memo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.memo.model.MemoDTO;
import com.test.memo.repository.MemoDAO;

@WebServlet("/del_ok.do")
public class Del_Ok extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String pswd = req.getParameter("pswd");
		
		MemoDTO dto = new MemoDTO();
		
		dto.setSeq(seq);
		dto.setPswd(pswd);
		
		MemoDAO dao = new MemoDAO();
		
		int result = 0;
		
		if (dao.check(dto)) {
			
			result = dao.del(seq);
			
		} else {
			
			result = 2;
			
		}
		
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/del_ok.jsp");

		dispatcher.forward(req, resp);

	}

}
