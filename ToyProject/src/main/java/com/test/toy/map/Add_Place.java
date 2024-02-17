package com.test.toy.map;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.test.toy.map.model.PlaceDTO;
import com.test.toy.map.repository.MapDAO;

@WebServlet("/map/add_place.do")
public class Add_Place extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String category = req.getParameter("category");
		String name = req.getParameter("name");
		String lat = req.getParameter("lat");
		String lng = req.getParameter("lng");
		
		PlaceDTO dto = new PlaceDTO();
		
		dto.setCategory(category);
		dto.setName(name);
		dto.setLat(lat);
		dto.setLng(lng);
		
		MapDAO dao = new MapDAO();
		
		int result = dao.addPlace(dto);
		
		JSONObject obj = new JSONObject();
		
		obj.put("result", result);
		
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.write(obj.toString());
		
		writer.close();

	}

}
