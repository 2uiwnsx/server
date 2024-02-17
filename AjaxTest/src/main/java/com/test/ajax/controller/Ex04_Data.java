package com.test.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.ajax.model.MemoDTO;
import com.test.ajax.repository.AjaxDAO;

@WebServlet("/ex04_data.do")
public class Ex04_Data extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String type = req.getParameter("type");
		
		if (type.equals("1")) {
			
			m1(req, resp);
			
		} else if (type.equals("2")) {
			
			m2(req, resp);
			
		} else if (type.equals("3")) {
			
			m3(req, resp);
			
		} else if (type.equals("4")) {
			
			m4(req, resp);
			
		} else if (type.equals("5")) {
			
			m5(req, resp);
			
		} else if (type.equals("6")) {
			
			m6(req, resp);
			
		}

	}

	private void m6(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AjaxDAO dao = new AjaxDAO();
		
		ArrayList<MemoDTO> list = dao.getMemoList();
		
		String temp = "[";
		
		for (MemoDTO dto : list) {
			
			temp += "{";
			temp += String.format("\"seq\": \"%s\",", dto.getSeq());
			temp += String.format("\"name\": \"%s\",", dto.getName());
			temp += String.format("\"pswd\": \"%s\",", dto.getPswd());
			temp += String.format("\"memo\": \"%s\",", dto.getMemo().replace("\r\n", "<br>"));
			temp += String.format("\"regdate\": \"%s\"", dto.getRegdate());
			temp += "},";
			
		}
		
		temp = temp.substring(0, (temp.length() - 1));
		
		temp += "]";
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(temp);
		
		writer.close();
		
	}

	private void m5(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		AjaxDAO dao = new AjaxDAO();
		
		MemoDTO dto = dao.getMemo(3);
		
		resp.setContentType("application/json");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("{");
		writer.printf("\"seq\": \"%s\",", dto.getSeq());
		writer.printf("\"name\": \"%s\",", dto.getName());
		writer.printf("\"pswd\": \"%s\",", dto.getPswd());
		writer.printf("\"memo\": \"%s\",", dto.getMemo().replace("\r\n", "<br>"));
		writer.printf("\"regdate\": \"%s\"", dto.getRegdate());
		writer.println("}");
		
		writer.close();
		
	}

	private void m4(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AjaxDAO dao = new AjaxDAO();
		
		ArrayList<MemoDTO> list = dao.getMemoList();
		
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<?xml version='1.0' encoding='UTF-8'?>");
		writer.println("<list>");
		
		for (MemoDTO dto : list) {
			
			writer.println("<memo>");
			writer.printf("<seq>%s</seq>", dto.getSeq());
			writer.printf("<name>%s</name>", dto.getName());
			writer.printf("<pswd>%s</pswd>", dto.getPswd());
			writer.printf("<memo>%s</memo>", dto.getMemo());
			writer.printf("<regdate>%s</regdate>", dto.getRegdate());
			writer.println("</memo>");
			
		}
		
		writer.print("</list>");
		
		writer.close();
		
	}

	private void m3(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AjaxDAO dao = new AjaxDAO();
		
		MemoDTO dto = dao.getMemo(3);
		
		resp.setContentType("text/xml");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println("<?xml version='1.0' encoding='UTF-8'?>");
		writer.println("<memo>");
		writer.printf("<seq>%s</seq>", dto.getSeq());
		writer.printf("<name>%s</name>", dto.getName());
		writer.printf("<pswd>%s</pswd>", dto.getPswd());
		writer.printf("<memo>%s</memo>", dto.getMemo());
		writer.printf("<regdate>%s</regdate>", dto.getRegdate());
		writer.println("</memo>");
		
		writer.close();
		
	}

	private void m2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AjaxDAO dao = new AjaxDAO();
		
		ArrayList<MemoDTO> list = dao.getMemoList();

		String temp = "";
		
		for (MemoDTO dto : list) {
			
			temp += String.format("%s,%s,%s,%s,%s\n", dto.getSeq(), dto.getName(), dto.getPswd(), dto.getMemo().replace("\n", "<br>"), dto.getRegdate());
		
		}
		
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print(temp.trim());
		
		writer.close();
		
	}

	private void m1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AjaxDAO dao = new AjaxDAO();
		
		int count = dao.getMemoCount();

		resp.setContentType("text/plain");
		
		PrintWriter writer = resp.getWriter();
		
		writer.println(count);
		
		writer.close();
		
	}

}
