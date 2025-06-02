package day0602;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import kr.co.sist.dao.MyBatisDAO;

public class InsertDAO {

	public void insertCpEmp7() {
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(true);
		
		int cnt = ss.insert("insertCpEmp7");
		
		System.out.println(cnt+"건 추가");
		
//		if (cnt == 1) {
//			ss.commit();
//		}// end if
		
		ss.close();
	}// insertCpEmp7
	
	public void insertSal(int sal) {
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(true);
		
		if ((ss.insert("insertCpEmp7Single", sal)) == 1) {
			ss.commit();
		}// end if
		
		ss.close();
	}// insertSal
	
	public void insertCpEmp7DTO(CpEmpDTO ceDTO) {
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml")
				.getMyBatisHandler(true);
		
		if ((ss.insert("insertCpEmp7DTO", ceDTO)) == 1) {
			ss.commit();
		}// end if
		
		ss.close();
	}// insertSal
	
	public static void main(String[] args) {
		new InsertDAO().insertCpEmp7();
		
		new InsertDAO().insertSal(404);
		
		int ran = (int) (Math.random()*10000);
		
		CpEmpDTO ceDTO = new CpEmpDTO();
		ceDTO.setEname("태일강");
		ceDTO.setEmpno(ran);
		ceDTO.setJob("서울시");
		ceDTO.setSal(7777);
		ceDTO.setComm(500);
		
		new InsertDAO().insertCpEmp7DTO(ceDTO);
	}// main
	
}// class
