package day0612;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.Car;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.CpEmp2;
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
	
	public List<CpEmp> dollarSign(String table) throws PersistenceException {
		List<CpEmp> list = null;

		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		list = ss.selectList("kr.co.sist.day0612.dollarSign", table);
		
		return list;
	}// dollarSign
	
	public List<CpEmp2> dynamicIf(WhereDTO wDTO) throws PersistenceException{
		List<CpEmp2> list = null;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		list=ss.selectList("kr.co.sist.day0612.dynamicIf",wDTO);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		
		return list;
	}
	
	public int rDTOTest(RangeDTO rDTO) throws PersistenceException{
		int result = 0;
		
		SqlSession ss=MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit x
		//2.쿼리를 실행
		result = ss.selectOne("rDTOTest", rDTO);
		//검색결과
		//3. Transaction처리
		//4. MyBatis Handler 닫기
		ss.close();
		
		return result;
	}
	
	
	
	public static void main(String[] args) {
		
//		SelectDAO5.getInstance().dynamicIf(new WhereDTO(20, "MANAGER"));
	}
}//class
