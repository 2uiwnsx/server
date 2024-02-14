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

@WebServlet("/add_ok.do")
public class Add_Ok extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String pswd = req.getParameter("pswd");
		String memo = req.getParameter("memo");

		MemoDTO dto = new MemoDTO();
		
		dto.setName(name);
		dto.setPswd(pswd);
		dto.setMemo(memo);

		MemoDAO dao = new MemoDAO();

		int result = dao.add(dto);
		
		req.setAttribute("result", result);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/add_ok.jsp");

		dispatcher.forward(req, resp);

	}

}
