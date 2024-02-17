package com.test.ajax.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.ajax.model.CatDTO;
import com.test.ajax.repository.AjaxDAO;

@WebServlet("/ex07_data.do")
public class Ex07_Data extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String catId = req.getParameter("catId");
		String x = req.getParameter("x");
		String y = req.getParameter("y");

		CatDTO dto = new CatDTO();
		
		dto.setCatId(catId);
		dto.setX(x);
		dto.setY(y);
		
		AjaxDAO dao = new AjaxDAO();
		
		dao.updateCatPosition(dto);

	}

}
