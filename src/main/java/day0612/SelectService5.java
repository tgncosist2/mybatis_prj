package day0612;

import java.util.List;

import kr.co.sist.domain.Car;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.CpEmp2;

public class SelectService5 {

	public List<String> searchAllMaker() {
		List<String> list = null;

		list = SelectDAO5.getInstance().selectAllMaker();

		return list;
	}// searchAllMaker
	
	public List<Car> subqueryService(String maker) {
		List<Car> list = null;

		list = SelectDAO5.getInstance().joinSubquery(maker);

		return list;
	}// subqueryService
	
	public List<CpEmp> dollarSign(String tableName) {
		List<CpEmp> list = null;
		
		list = SelectDAO5.getInstance().dollarSign(tableName);
		
		return list;
	}// subqueryService
	
	public List<CpEmp2> dynamicIf(WhereDTO wDTO) {
		List<CpEmp2> list = null;
		
		list = SelectDAO5.getInstance().dynamicIf(wDTO);
		
		return list;
	}// subqueryService

}// class
