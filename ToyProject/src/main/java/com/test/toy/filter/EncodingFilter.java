package com.test.toy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	private String encoding;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

		encoding = filterConfig.getInitParameter("encoding");
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {

		req.setCharacterEncoding(encoding);

		chain.doFilter(req, resp);
		
	}
	
}
