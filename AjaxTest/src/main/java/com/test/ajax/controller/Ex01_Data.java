package com.test.ajax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.ajax.repository.AjaxDAO;

@WebServlet("/ex01_data.do")
public class Ex01_Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AjaxDAO dao = new AjaxDAO();
		
		int count = dao.getMemoCount();
		
		req.setAttribute("count", count);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/ex01_data.jsp");
		
		dispatcher.forward(req, resp);

	}
	
}