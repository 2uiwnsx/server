package com.test.ajax.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.test.ajax.repository.AjaxDAO;

@WebServlet("/edit.do")
public class Edit extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String column = req.getParameter("column");
		String value = req.getParameter("value");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("seq", seq);
		map.put("column", column);
		map.put("value", value);
		
		AjaxDAO dao = new AjaxDAO();
		
		int result = dao.editAddress(map);
		
		JSONObject obj = new JSONObject();
		
		obj.put("result", result);
		
		resp.setContentType("application/json");
				
		PrintWriter writer = resp.getWriter();
		
		writer.print(obj.toString());
		
		writer.close();

	}

}
