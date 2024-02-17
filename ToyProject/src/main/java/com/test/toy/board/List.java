package com.test.toy.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.repository.BoardDAO;

@WebServlet("/board/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		
		String search = "n";
		
		if (word != null) {
			
			search = "y";
			
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("column", column);
		map.put("word", word);
		map.put("search", search);
		
		String page = req.getParameter("page");
		
		int currentPage = 1;
		
		if (page != null) {
			
			currentPage = Integer.parseInt(page);
			
		}
		
		req.setAttribute("currentPage", currentPage);
		
		int postsPerPage = 10;
		
		int startIndex = ((currentPage - 1) * postsPerPage) + 1;
		int endIndex = (startIndex + postsPerPage) - 1;
		
		map.put("startIndex", String.format("%d", startIndex));
		map.put("endIndex", String.format("%d", endIndex));
		
		req.setAttribute("map", map);
		
		BoardDAO dao = new BoardDAO();
		
		ArrayList<BoardDTO> list = dao.getPostList(map);
		
		for (BoardDTO dto : list) {
			
			String subject = dto.getSubject();
			
			if (subject.length() > 20) {
				
				subject = subject.substring(0, 20) + "···";
				
			}
			
			subject = subject.replace("<", "&lt;").replace(">", "&gt;");
			
			dto.setSubject(subject);
			
		}
		
		req.setAttribute("list", list);
		
		int blockSize = 5;
		
		int pageNumber = (((currentPage - 1) / blockSize) * blockSize) + 1;
		
		StringBuilder pageBar = new StringBuilder();
		
		if (pageNumber != 1) {
			
			pageBar.append(String.format("<a href='/toy/board/list.do?page=%d'>[이전]</a>", (pageNumber - 1)));
			
		}
		
		int totalPosts = dao.getPostCount();
		
		int totalPages = (int)Math.ceil((double)totalPosts / postsPerPage);
		
		req.setAttribute("totalPages", totalPages);
		
		int loop = 1;
		
		while ((loop <= blockSize) && (pageNumber <= totalPages)) {
			
			if (pageNumber == currentPage) {
				
				pageBar.append(String.format("<a href='#!' style='color: tomato; margin: 0 5px;'>%d</a>", pageNumber));
				
			} else {
				
				pageBar.append(String.format("<a href='/toy/board/list.do?page=%d' style='margin: 0 5px;'>%d</a>", pageNumber, pageNumber));
				
			}
			
			loop++;
			pageNumber++;
			
		}
		
		if (pageNumber <= totalPages) {
			
			pageBar.append(String.format("<a href='/toy/board/list.do?page=%d'>[다음]</a>", pageNumber));
			
		}
		
		req.setAttribute("pageBar", pageBar.toString());
		
		HttpSession session = req.getSession();
		
		session.setAttribute("read", "n");
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
		
		dispatcher.forward(req, resp);
		
	}

}
