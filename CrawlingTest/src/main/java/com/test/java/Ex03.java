package com.test.java;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class Ex03 {
	
	public static void main(String[] args) {
		
		try {
			
			Document doc = Jsoup.connect("http://lms1.sist.co.kr/worknet/SMember/index.asp?strCode=I202307110038").get();
			
			System.out.println(doc.html());
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}

}
