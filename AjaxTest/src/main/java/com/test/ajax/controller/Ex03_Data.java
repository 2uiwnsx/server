package com.test.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.ajax.repository.AjaxDAO;

@WebServlet("/ex03_data.do")
public class Ex03_Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		
		AjaxDAO dao = new AjaxDAO();
		
		int count = dao.getMemoCount(name);
		
		try {
			
			Thread.sleep(10000);
			
		} catch (Exception e) {
			
			System.out.println("Ex03_Data.doGet()");
			
			e.printStackTrace();
			
		}
		
		PrintWriter writer = resp.getWriter();
		
		writer.println(count);
		
		writer.close();

	}
	
}