package day0612;

import java.util.List;

import kr.co.sist.domain.Car;
import kr.co.sist.domain.CpEmp;

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

}// class
