package com.test.toy.map;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.toy.map.model.MapDTO;
import com.test.toy.map.model.PlaceDTO;
import com.test.toy.map.repository.MapDAO;

@WebServlet("/map/ex.do")
public class Ex extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String no = req.getParameter("no");
		
		if (no.equals("03")) {
			
			MapDAO dao = new MapDAO();
			
			ArrayList<MapDTO> list = dao.getMarkerList();
			
			req.setAttribute("list", list);
			
		} else if (no.equals("05")) {
			
			MapDAO dao = new MapDAO();
			
			ArrayList<PlaceDTO> list = dao.getPlaceList();
			
			req.setAttribute("list", list);
			
		}
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/map/ex" + no + ".jsp");

		dispatcher.forward(req, resp);

	}

}
