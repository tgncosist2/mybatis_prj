package day0605;

import java.util.List;

import kr.co.sist.domain.CpEmp;

public class SelectService2 {

	public CpEmp mcsrService(int empno) {
		CpEmp ce = new CpEmp();
		
		ce = SelectDAO2.getInstance().mcsr(empno);
		
		return ce;
	}// scsrService
	

	
}// class
