package day0610;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.Car;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.Zipcode;

public class SelectDAO4 {
	private static SelectDAO4 sDAO;
	
	private SelectDAO4() {
	}

	public static SelectDAO4 getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO4();
		}//end if
		return sDAO;
	}//getInstance
	
	public List<CpEmp> union() throws PersistenceException {
		List<CpEmp> list = null;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("kr.co.sist.day0610.union");
		
		return list;
	}// end union
	
	public List<String> selectAllModel() throws PersistenceException {
		List<String> list = null;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("kr.co.sist.day0610.selectAllModel");
		
		return list;
	}// selectAllModel
	
	public List<Car> join(String model) throws PersistenceException {
		List<Car> list = null;

		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("kr.co.sist.day0610.join", model);
		
		return list;
	}// join
	
}//class
