package day0610;

import java.util.List;

import kr.co.sist.domain.Car;
import kr.co.sist.domain.CpEmp;

public class SelectService4 {

	public List<CpEmp> unionService() {
		List<CpEmp> list = null;

		list = SelectDAO4.getInstance().union();

		return list;
	}// unionService

	public List<String> searchAllModel() {
		List<String> list = null;

		list = SelectDAO4.getInstance().selectAllModel();

		return list;
	}// searchAllModel
	
	public List<Car> joinService(String model) {
		List<Car> list = null;

		list = SelectDAO4.getInstance().join(model);

		return list;
	}// joinService

}// class
