package day0605;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;

public class SelectDAO2 {
	
	private static SelectDAO2 sDAO;
	
	private SelectDAO2() {
	}
	
	public static SelectDAO2 getInstance() {
		if (sDAO == null) {
			sDAO = new SelectDAO2();
		}
		return sDAO;
	}

	/**
	 * 컬럼 하나에 행 하나 조회 : 사원번호를 입력받아 사원명을 검색
	 * @param empno 사원번호
	 */
	public CpEmp mcsr(int empno) {
		CpEmp ce = new CpEmp();
		
		// 1. MyBatis Handler 얻기
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		// 2. 조회 
		ce = ss.selectOne("kr.co.sist.day0605.mcsr", empno);
		
		// 3. 조회 다 했으면 끊어버리기
		ss.close();
		
		return ce;
	}// scsr
	
	/**
	 * 컬럼 하나에 행 하나 조회 : 사원번호를 입력받아 사원명을 검색
	 * @param empno 사원번호
	 */
	public List<CpEmp> mcmr(int deptno) {
		List<CpEmp> list = null;
		
		// 1. MyBatis Handler 얻기
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		// 2. 조회 
		list = ss.selectList("kr.co.sist.day0605.mcmr", deptno);
		
		// 3. 조회 다 했으면 끊어버리기
		ss.close();
		
		return list;
	}// scsr
	
	public List<CpEmp> lessThan(int sal) {
		List<CpEmp> list = null;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("lessThan", sal);
		
		return list;
	}
	
	public List<CpEmp> greaterThan(int sal) {
		List<CpEmp> list = null;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("greaterThan", sal);
		
		return list;
	}
	
}// class
