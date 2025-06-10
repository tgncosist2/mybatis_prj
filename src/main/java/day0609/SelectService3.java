package day0609;

import java.util.List;

import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.Zipcode;

public class SelectService3 {

	public List<Zipcode> likeService(String dong) {
		List<Zipcode> list = null;
		
		SelectDAO3 sDAO3 = SelectDAO3.getInstance();
		
		list = sDAO3.like(dong);
		
		return list;
	}// likeService
	
	public List<CpEmp> subqueryService() {
		List<CpEmp> list = null;
		
		SelectDAO3 sDAO3 = SelectDAO3.getInstance();
		
		list = sDAO3.subquery();
		
		return list;
	}// likeService
	
}
