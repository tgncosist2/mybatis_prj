package day0613;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;

public class selectDAO6 {

	public List<CpEmp> choose(int deptno) throws PersistenceException {
		List<CpEmp> list = null;

		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();

		list = ss.selectList("kr.co.sist.day0613.choose", deptno);

		return list;
	}
	
	public List<CpEmp> foreach(Map<String, Object> map) throws PersistenceException {
		List<CpEmp> list = null;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("foreach", map);
		
		return list;
	}
	
	public List<Integer> selectAllEmpno() throws PersistenceException {
		List<Integer> list = null;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("kr.co.sist.day0613.selectAllEmpno");
		
		return list;
	}
	
	public CpEmp selectOneEmp(int empno) throws PersistenceException {
		CpEmp empDomain = null;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		empDomain = ss.selectOne("selectOneEmp", empno);
		
		return empDomain;
	}
	
	public int set(CpEmp ceDTO) throws PersistenceException {
		int rowCnt = 0;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler(true);
		
		rowCnt = ss.update("kr.co.sist.day0613.set", ceDTO);
		
		return rowCnt;
	}
	
	public int transaction(TransactionDTO tDTO) throws PersistenceException {
		int rowCnt = 0;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		rowCnt += ss.update("kr.co.sist.day0613.transaction", tDTO);
		
		rowCnt += ss.update("kr.co.sist.day0613.transaction2", tDTO);
		
		if (rowCnt == 2) {
			ss.commit();
		}// end if
		
		return rowCnt;
	}// transaction
	
}// class
