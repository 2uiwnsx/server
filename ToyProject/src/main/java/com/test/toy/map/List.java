package com.test.toy.map;

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

import com.test.toy.map.model.PlaceDTO;
import com.test.toy.map.repository.MapDAO;

@WebServlet("/map/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MapDAO dao = new MapDAO();
		
		ArrayList<PlaceDTO> list = dao.getPlaceList();
		
		JSONArray arr = new JSONArray();
		
		for (PlaceDTO dto : list) {
			
			JSONObject obj = new JSONObject();
			
			obj.put("seq", dto.getSeq());
			obj.put("category", dto.getCategory());
			obj.put("name", dto.getName());
			obj.put("lat", dto.getLat());
			obj.put("lng", dto.getLng());
			
			arr.add(obj);
			
		}
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.write(arr.toString());
		
		writer.close();

	}

}
