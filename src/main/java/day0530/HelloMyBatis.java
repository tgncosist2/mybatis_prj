package day0530;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class HelloMyBatis {
	
	public void useMyBatis() {
				SqlSession ss = MyBatisSingleton.getSession();

				// 4. Handler를 사용한 조작
				int cnt = ss.selectOne("kr.co.sist.hello.webMemberCnt");
				System.out.println(cnt + "건");
				
				// MyBatis Handler(ss)가 namespace와 id명을 결합하여 node를 찾고 parsing
//				List<Dept> dept = ss.selectList("kr.co.sist.hello.selectAllDept");
				List<Dept> dept = ss.selectList("selectAllDept");
				for (Dept item : dept) {
					System.out.println(item.getDeptno() + "/" + item.getDname() + "/" + item.getLoc());
				}// end for
		
	}// useMyBatis
	
	public static void main(String[] args) {
		new HelloMyBatis().useMyBatis();
	}// main
	
}// class
