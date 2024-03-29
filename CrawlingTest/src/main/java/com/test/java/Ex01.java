package com.test.java;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex01 {
	
	public static void main(String[] args) {
		
		try {

			Document doc = Jsoup.connect("http://localhost:8090/memo/list.do").get();
			
			System.out.println(doc.html());
			
			Element h1 = doc.selectFirst("body > h1");
			
			System.out.println(h1.text());
			
			Elements item = doc.select(".item > div:nth-child(2)");
			
			for (Element el : item) {
				
				System.out.println(el.text());
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}

}
