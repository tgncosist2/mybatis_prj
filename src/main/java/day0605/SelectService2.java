package day0605;

import java.util.List;

import kr.co.sist.domain.CpEmp;

public class SelectService2 {

	public CpEmp mcsrService(int empno) {
		CpEmp ce = new CpEmp();
		
		ce = SelectDAO2.getInstance().mcsr(empno);
		
		return ce;
	}// scsrService
	
	public List<CpEmp> mcmrService(int deptno) {
		List<CpEmp> list = null;
		
		list = SelectDAO2.getInstance().mcmr(deptno);
		
		return list;
	}// scsrService
	
	public List<CpEmp> lessThanService(int sal) {
		List<CpEmp> list = null;
		
		list = SelectDAO2.getInstance().lessThan(sal);
		
		return list;
	}// scsrService
	
	public List<CpEmp> greaterThanService(int sal) {
		List<CpEmp> list = null;
		
		list = SelectDAO2.getInstance().greaterThan(sal);
		
		return list;
	}// scsrService
	
	
}// class
