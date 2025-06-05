package day0604;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;

public class SelectDAO {
	
	private static SelectDAO sDAO;
	
	private SelectDAO() {
	}
	
	public static SelectDAO getInstance() {
		if (sDAO == null) {
			sDAO = new SelectDAO();
		}
		return sDAO;
	}

	/**
	 * 컬럼 하나에 행 하나 조회 : 사원번호를 입력받아 사원명을 검색
	 * @param empno 사원번호
	 */
	public String scsr(int empno) {
		String ename = "";
		
		// 1. MyBatis Handler 얻기
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		// 2. 조회 
		ename = ss.selectOne("kr.co.sist.day0604.scsr", empno);
		
		// 3. 조회 다 했으면 끊어버리기
		ss.close();
		
		return ename;
	}// scsr
	
	/**
	 * 컬럼 하나에 여러행 조회 : 그냥 갔다가 조회.
	 * @return
	 */
	public List<Integer> scmr() {
		List<Integer> list = null;
		
		// 1. MyBatis Handler 얻기
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		// 2. 조회 
		list = ss.selectList("kr.co.sist.day0604.scmr");
		
		// 3. 조회 다 했으면 끊어버리기
		ss.close();
		
		return list;
	}// scsr
	
}// class
