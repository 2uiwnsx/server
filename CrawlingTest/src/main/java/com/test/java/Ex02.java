package com.test.java;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex02 {
	
	public static void main(String[] args) {
		
		try {

			Document doc = Jsoup.connect("https://movie.daum.net/ranking/boxoffice/weekly").get();
			
			Elements list = doc.select(".item_poster");
			
			System.out.println(list.size());
			
			for (Element movie : list) {
				
				Element title = movie.selectFirst(".link_txt");
				
				System.out.println(title.text());
				
				Element date = movie.selectFirst(".txt_num");
				
				System.out.println(date.text());
				
				Element count = movie.selectFirst(".screen_out");
				
				System.out.println(count.nextSibling());
				
				Element poster = movie.selectFirst(".img_thumb");
				
				if (poster != null) {
					
					System.out.println(poster.attr("src"));
					
					saveImage(poster.attr("src"), title.text());
					
				}
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}
	
	private static void saveImage(String imgUrl, String fileName) {
		
		URL url = null;
		
		InputStream in = null;
		
		OutputStream out = null;
		
		try {
			
			url = new URL(imgUrl);
			
			in = url.openStream();
				
			fileName = fileName.replace(":", "_");
			
			out = new FileOutputStream("C:\\class\\code\\server\\CrawlingTest\\poster\\" + fileName + ".png");
			
			while (true) {
				
				int data = in.read();
				
				if (data == -1) {
					
					break;
					
				}
				
				out.write(data);
				
			}
			
			in.close();
			
			out.close();
			
		} catch (Exception e) {

			e.printStackTrace();
			
		}
		
	}

}
