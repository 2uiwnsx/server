package com.test.ajax.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.test.ajax.model.AddressDTO;
import com.test.ajax.repository.AjaxDAO;

@WebServlet("/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AjaxDAO dao = new AjaxDAO();
		
		ArrayList<AddressDTO> list = dao.getAddressList();
		
		JSONArray arr = new JSONArray();
		
		for (AddressDTO dto : list) {
			
			JSONObject item = new JSONObject();
			
			item.put("seq", dto.getSeq());
			item.put("name", dto.getName());
			item.put("age", dto.getAge());
			item.put("gender", dto.getGender());
			item.put("address", dto.getAddress());
			item.put("regdate", dto.getRegdate());
			
			arr.add(item);
			
		}
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(arr.toString());
		
		writer.close();
		
	}

}
