package day0616;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;

import day0602.CpEmpDTO;
import day0613.TransactionDTO;
import kr.co.sist.domain.Car;
import kr.co.sist.domain.CpEmp;
import kr.co.sist.domain.CpEmp2;

public class SelectService7 {

	public void procedureInsert(CpEmp6DTO ceDTO) {
		
		try {
			selectDAO7 sDAO = new selectDAO7();
			sDAO.insertProcedure(ceDTO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		
	}

}// class
