package com.test.memo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.memo.model.MemoDTO;
import com.test.memo.repository.MemoDAO;

@WebServlet("/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MemoDAO dao = new MemoDAO();
		
		ArrayList<MemoDTO> list = dao.list();
		
		for (MemoDTO dto : list) {
			
			 String memo = dto.getMemo();

			 if (memo.length() > 12) {
				 
				 memo = memo.substring(0, 12) + "...";
				 
			 }
			 
			 memo = memo.replace("\n", "<br>");

			 dto.setMemo(memo);
			
		}
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/list.jsp");

		dispatcher.forward(req, resp);

	}

}
