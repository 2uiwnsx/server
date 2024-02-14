package com.test.java;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;

public class Ex04 {
	
	public static void main(String[] args) {
		
		// m1();
		// m2();
		
	}

	private static void m2() {
		
		System.setProperty("webdriver.edge.driver", "C:\\class\\dev\\msedgedriver.exe");

		WebDriver driver = new EdgeDriver();
		
		driver.get("http://lms1.sist.co.kr/worknet/SLogin.asp");
		
		WebElement id = driver.findElement(By.id("strLoginID"));
		
		id.sendKeys("차수민");
		
		WebElement pswd = driver.findElement(By.id("strLoginPwd"));
		
		pswd.sendKeys("4871");
		
		WebElement btn = driver.findElement(By.cssSelector("#content > div > form > table > tbody > tr > td > div > div.login-form > div.login-btn > input"));
		
		btn.click();
		
		try {
			
			Thread.sleep(1000);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}

	private static void m1() {
		
		System.setProperty("webdriver.edge.driver", "C:\\class\\dev\\msedgedriver.exe");
		
		WebDriver driver = new EdgeDriver();
		
		driver.get("http://naver.com");

		WebElement query = driver.findElement(By.id("query"));

		query.sendKeys("셀레니움");
		
		WebElement btn = driver.findElement(By.className("btn_search"));
		
		btn.click();
		
	}

}
