package day0616;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;

import day0602.CpEmpDTO;
import day0613.TransactionDTO;
import kr.co.sist.dao.MyBatisDAO;
import kr.co.sist.domain.CpEmp;

public class selectDAO7 {

	public void insertProcedure(CpEmp6DTO ceDTO) throws PersistenceException {
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		ss.selectOne("kr.co.sist.day0616.procedureInsert", ceDTO);
		
		List<String> list = new ArrayList<String>();
		
		list.add(String.valueOf(ceDTO.getCnt()));
		list.add(ceDTO.getMsg());
		
		System.out.println(list.toString());
	}
	
	public void procedureSelect(Map<String, Object> hashmap) throws PersistenceException {
		hashmap.put("maker", "현대");
		hashmap.put("cur", null);
		hashmap.put("errm", null);
		
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		
		ss.selectList("kr.co.sist.day0616.procedureSelect", hashmap);
		
		List<Map<String, Object>> yaho =(List<Map<String, Object>>) hashmap.get("cur");
		
		List<CarDomain> carList = new ArrayList<CarDomain>();
		
		CarDomain cd = null;
		for (Map<String,Object> item : yaho) {
			cd = new CarDomain();
			cd.setCar_option((String) item.get("CAR_OPTION"));
			cd.setPrice(item.get("PRICE") != null ? ((BigDecimal)item.get("PRICE")).intValue() : 0);
			cd.setCar_year((String) item.get("CAR_YEAR"));
			cd.setHiredate(item.get("HIREDATE") != null ? new Date(((Timestamp) item.get("HIREDATE")).getTime()) : new Date(System.currentTimeMillis()));
			cd.setModel((String) item.get("MODEL"));
			carList.add(cd);
		}
		
		System.out.println(carList);
		
		
	}
	
	public static void main(String[] args) {
		new selectDAO7().procedureSelect(new HashMap<String, Object>());
	}
	
}// class
