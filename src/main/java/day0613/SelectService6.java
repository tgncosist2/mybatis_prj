package day0613;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import day0602.CpEmpDTO;
import kr.co.sist.domain.Car;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.CpEmp2;

public class SelectService6 {

	public List<CpEmp> choose(int deptno) {
		List<CpEmp> list = null;

		list = new selectDAO6().choose(deptno);

		return list;
	}// subqueryService

	public List<CpEmp> foreach(String[] empnoArr) {
		List<CpEmp> list = null;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empnoArr", empnoArr);

		list = new selectDAO6().foreach(map);

		return list;
	}// subqueryService

	public List<Integer> selectAllEmpno() {
		List<Integer> list = null;

		list = new selectDAO6().selectAllEmpno();

		return list;
	}

	public CpEmp selectOneEmp(int empno) {
		CpEmp ceDTO = null;

		ceDTO = new selectDAO6().selectOneEmp(empno);

		return ceDTO;
	}

	public int set(CpEmp cpDTO) {
		int rowCnt = 0;

		rowCnt = new selectDAO6().set(cpDTO);

		return rowCnt;
	}

	public boolean modifyEmp(CpEmp ceDTO) {
		boolean result = false;

		selectDAO6 sDAO6 = new selectDAO6();

		try {
			result = sDAO6.set(ceDTO) != 0;
		} catch (PersistenceException e) {
			e.printStackTrace();
		} // end try-catch

		return result;
	}// modifyEmp

	public boolean transaction(TransactionDTO tDTO) {
		boolean result = false;

		selectDAO6 sDAO6 = new selectDAO6();

		try {
			result = sDAO6.transaction(tDTO) == 2;
		} catch (PersistenceException e) {
			e.printStackTrace();
		} // end try-catch

		return result;
	}

}// class
