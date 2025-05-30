package day0530;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class HelloMyBatis {
	
	public void useMyBatis() {
		File file = new File("C:/dev/workspace/mybatis_prj/src/main/java/day0530/mybatis-config.xml");
		if (file.exists()) {
			try {
				// 1. 설정용 XML과 연결해야됭
				Reader reader = Resources.getResourceAsReader("day0530/mybatis-config.xml");
				
				// 2. MyBatis Framework 생성
				SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
				
				// 3. MyBatis Handler를 얻어주세요
				SqlSession ss = ssf.openSession();
				
				// 4. Handler를 사용한 조작
				int cnt = ss.selectOne("kr.co.sist.hello.webMemberCnt");
				System.out.println(cnt + "건");
				
				List<Dept> dept = ss.selectList("kr.co.sist.hello.selectAllDept");
				for (Dept item : dept) {
					System.out.println(item.getDeptno() + "/" + item.getDname() + "/" + item.getLoc());
				}// end for
			} catch (IOException e) {
				e.printStackTrace();
			}// end try-catch
		}// end if
		
	}// useMyBatis
	
	public static void main(String[] args) {
		new HelloMyBatis().useMyBatis();
	}// main
	
}// class
