package day0604;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.type.TypeAliasRegistry;

import day0602.CpEmpDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;

public class ExamDAO {

	public void updateDTO(CpEmpDTO cpDTO) {
		
		MyBatisDAO mbDAO = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml");
		
		SqlSession ss = mbDAO.getMyBatisHandler();
		
		int cnt = ss.update("day0604.updateCpEmp", cpDTO);
		
		System.out.println(cnt + "건 변경");
		
		if (cnt == 1) {
			ss.commit();
		}// end if
		
		ss.close();
	}// updateCpEmp
	
	public void updateDTOSET(CpEmpDTO cpDTO) {
		
		MyBatisDAO mbDAO = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml");
		
		SqlSession ss = mbDAO.getMyBatisHandler();
		
		int cnt = ss.update("day0604.updateCpEmpSET", cpDTO);
		
		System.out.println(cnt + "건 변경");
		
		if (cnt == 1) {
			ss.commit();
		}// end if
		
		ss.close();
	}// updateCpEmp 
	
	public void deleteDTO(int empno) {
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
//		int cnt = ss.delete("day0604.deleteCpEmp", empno);
		int cnt = ss.delete("day0604.deleteCpEmp", empno);
		// insert, update, delete는 처리 로직이 같아 메소드명이나 맵퍼태그명을 바꿔도 sql문에 따라 진행된다.
		// 그러나 가독성을 위해서 delete문은 delete메소드로 update는 update메소드로 태그명도 마찬가지!
		
		System.out.println(cnt + "건 삭제 완료");
		
		if (cnt != 0) {
			ss.commit();
		}// end if
		
		ss.close();
		
	}// deleteDTO
	
	public void selectOne(int empno) {
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		
		CpEmp ceDomain = ss.selectOne("day0604.selectOne", empno);
		
		System.out.println(ceDomain);
		
		ss.close();
	}// selectOne
	
	public void selectList() {
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		
		List<CpEmp> list = ss.selectList("selectList");
		
		for (CpEmp item : list) {
			System.out.println(item);
		}
		
		ss.close();
	}// selectOne
	
	
	
	public static void main(String[] args) {
		CpEmpDTO cpDTO = new CpEmpDTO(94, 9999, 1234, "야호아", null, null);
		
//		new ExamDAO().updateDTOSET(cpDTO);
		
//		new ExamDAO().deleteDTO(7566);
		
//		new ExamDAO().selectOne(7521);
		
		new ExamDAO().selectList();
	}// main
	
}// class
