package day0602;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import day0530.Dept;
import kr.co.sist.dao.MyBatisDAO;

public class TestConfig {
	
	public TestConfig() {
		// 로그를 사용
//		org.apache.ibatis.logging.LogFactory.useLog4J2Logging();
	}
	
	public void useMyBatis() {
			MyBatisDAO mbDAO = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml");
			
			SqlSession ss = mbDAO.getMyBatisHandler(true);
			
			// MyBatis Handler(ss)가 namespace와 id명을 결합하여 node를 찾고 parsing
//			List<Dept> dept = ss.selectList("kr.co.sist.hello.selectAllDept");
			List<Dept> dept = ss.selectList("day0602.selectAllDept");
			for (Dept item : dept) {
				System.out.println(item.getDeptno() + "/" + item.getDname() + "/" + item.getLoc());
			}// end for
			
			Dept insertDept = new Dept("dept2",99, "JEJUDO", "AWEOL");
			ss.insert("insertDept", insertDept);
			
			List<Dept> dept2 = ss.selectList("day0602.selectAllDept");
			for (Dept item : dept2) {
				System.out.println(item.getDeptno() + "/" + item.getDname() + "/" + item.getLoc());
			}// end for
			
			// DAO 끝!
			ss.close();
	}// useMyBatis
	
	public static void main(String[] args) {
		new TestConfig().useMyBatis();
	}// main
	
}// class
