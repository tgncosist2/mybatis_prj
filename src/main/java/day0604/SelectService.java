package day0604;

import java.util.List;

import kr.co.sist.domain.CpEmp;

public class SelectService {

	public String scsrService(int empno) {
		String ename = "";
		
		ename = SelectDAO.getInstance().scsr(empno);
		
		return ename;
	}// scsrService
	
	public List<Integer> scmrService() {
		List<Integer> list = null;
		
		list = SelectDAO.getInstance().scmr();
		
		return list;
	}// scsrService
	
}// class
