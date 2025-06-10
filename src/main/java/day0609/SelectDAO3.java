package day0609;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.Zipcode;

public class SelectDAO3 {
	private static SelectDAO3 sDAO;
	
	private SelectDAO3() {
	}

	public static SelectDAO3 getInstance() {
		if(sDAO==null) {
			sDAO=new SelectDAO3();
		}//end if
		return sDAO;
	}//getInstance
	
	public List<Zipcode> like(String dong) {
		List<Zipcode> list = null;
		//1. MyBatis Handler  얻기
		SqlSession ss= MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit 안됨
		
		//2. 쿼리를 실행 <select id="scmr" resultType="int"> parameterType 속성이
		//사용되지 않으므로, 매개변수가 하나인 selectList()를 호출한다.
		list=ss.selectList("kr.co.sist.day0609.like", dong);
				
		//4. MyBatis Handler 닫기
		ss.close();
		
		return list;
	}// like

	public List<CpEmp> subquery() {
		List<CpEmp> list = null;
		//1. MyBatis Handler  얻기
		SqlSession ss= MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(); //auto commit 안됨
		
		//2. 쿼리를 실행 <select id="scmr" resultType="int"> parameterType 속성이
		//사용되지 않으므로, 매개변수가 하나인 selectList()를 호출한다.
		list=ss.selectList("kr.co.sist.day0609.subquery");
		
		//4. MyBatis Handler 닫기
		ss.close();
		
		return list;
	}// like
}//class
