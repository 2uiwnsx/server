package com.test.toy.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest httpReq = (HttpServletRequest)req;
		
		HttpServletResponse httpResp = (HttpServletResponse)resp;
		
		HttpSession session = httpReq.getSession();
		
		if (session.getAttribute("id") == null) {
			
			if (httpReq.getRequestURI().endsWith("info.do") || httpReq.getRequestURI().endsWith("add.do") ||
				httpReq.getRequestURI().endsWith("edit.do") || httpReq.getRequestURI().endsWith("del.do")) {
				
				httpResp.setContentType("text/html");
				httpResp.setCharacterEncoding("UTF-8");
				
				PrintWriter writer = httpResp.getWriter();
				
				writer.write("<script>");
				writer.write("alert('권한이 없습니다.');");
				writer.write("location.href='/toy/index.do';");
				writer.write("</script>");
				
				writer.close();
				
				return;
				
			}
			
		}
		
		chain.doFilter(req, resp);
		
	}
	
}
