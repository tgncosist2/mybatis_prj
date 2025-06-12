package day0612;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.Car;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.Zipcode;

public class SelectDAO5 {
	private static SelectDAO5 sDAO;
	
	private SelectDAO5() {
	}

	public static SelectDAO5 getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO5();
		}//end if
		return sDAO;
	}//getInstance
	
	public List<String> selectAllMaker() throws PersistenceException {
		List<String> list = null;
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("kr.co.sist.day0612.selectAllMaker");
		
		return list;
	}// selectAllMaker
	
	public List<Car> joinSubquery(String model) throws PersistenceException {
		List<Car> list = null;

		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("kr.co.sist.day0612.join_subquery", model);
		
		return list;
	}// joinSubquery
	
	
	public static void main(String[] args) {
		System.out.println(SelectDAO5.getInstance().joinSubquery("현대"));
	}
}//class
