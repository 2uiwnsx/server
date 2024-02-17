package com.test.toy.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Random;

import com.test.toy.DBUtil;

public class Dummy {
	
	public static void main(String[] args) {
		
		Connection conn = null;
		
		PreparedStatement pstat = null;
		
		try {
			
			conn = DBUtil.open();
			
			String sql = "INSERT INTO tblBoard (seq, id, subject, content, regdate, readCount) VALUES (boardSeq.NEXTVAL, 'hong', ?, '내용', DEFAULT, DEFAULT)";
			
			pstat = conn.prepareStatement(sql);
			
			String temp = "볶음밥, 파스타 등 조리된 곡물을 먹다가 죽음에 이를 수도 있을까. 해외에서는 일명 '볶음밥 증후군(Fried rice syndrome)'이라고 불리는 질환이다. 조리된 음식을 상온에 방치하면 최악의 경우 사망에 이를 수 있는 식중독균에 감염될 수 있다는 것이다. 최근 비디오 스트리밍 플랫폼 '틱톡'에는 볶음밥 증후군과 관련된 영상이 올라와 누리꾼의 이목을 집중시켰다. 영상을 게재한 틱토커 'jpall20'는 2008년 벨기에 브뤼셀에 거주하던 20대 대학생이 파스타를 먹은 뒤 갑작스럽게 사망한 사건을 재조명했다. 설명에 따르면 이 대학생은 파스타를 삶은 뒤 실온에 5일간 보관했다가 다시 꺼내 조리해 먹은 것으로 전해졌다. 하지만 파스타를 섭취한 후 대학생은 메스꺼움, 복통, 두통, 설사, 구토를 겪다가 끝내 10시간 만에 사망했다. 현지 수사당국이 대학생의 시신을 부검한 결과 그의 사인은 간세포 괴사에 의한 급성 간부전이었다. 이 사건은 국제 과학 저널 '임상 미생물학' 저널에 보고될 만큼 유명한 '볶음밥 증후군' 사례이기도 하다. 사망한 대학생은 볶음밥 증후군을 일으킨 바실러스 세레우스 세균에 감염된 것이다. 바실러스 세레우스는 어디에서든 쉽게 발견되는 식중독균인데, 특히 쌀, 파스타 등 탄수화물이 많이 함유된 곡물에 잘 퍼진다. 이 균의 특징은 고온에 가열해도 살아남는다는 것이다. 즉, 실온에 오래 놔둔 곡물 요리를 다시 조리해 먹는다고 해도 감염을 피하기 힘들다. 바실러스 세레우스는 가열하면 열에 강한 포자를 생성하며, 그 결과 135도 이상에서 4시간 가열해도 사멸하지 않는 강한 내열성을 지니게 됐다. 또 건조된 식품에서도 오래 살아남을 수 있다. 이 때문에 라면 등 탄수화물이 함유된 인스턴트 식품도 지나치게 장기간 방치하면 위험할 수 있다. 해당 질환에 걸렸을 경우, 세균에 만들어내는 독소에 따라 설사형과 구토형 증상을 유발하는 것으로 전해졌다. 구토형 독소는 음식 자체에 퍼져 구토를 유발하며, 설사형 독소는 음식을 섭취한 후 경련, 설사 등을 유발한다. 기저질환이 있거나 면역력이 취약한 어린이의 경우 최악에는 사망에 이를 수 있기 때문에 주의해야 한다. 바실러스 세레우스 감염을 예방하려면 조리된 음식을 반드시 냉장고에 보관하는 것이다. 바실러스 세레우스는 섭씨 7~60도 사이에서 발육한다.";
			
			String[] tempList = temp.split(" ");
			
			Random rnd = new Random();
			
			for (int i = 0; i < 250; i++) {
				
				String subject = "";
				
				for (int j = 0; j < 5; j++) {
					
					subject += tempList[rnd.nextInt(tempList.length)] + " ";
					
				}
				
				pstat.setString(1, subject);
				
				pstat.executeUpdate();
				
			}
			
			System.out.println("등록에 성공했습니다.");
			
			pstat.close();
			
			conn.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
	}

}
