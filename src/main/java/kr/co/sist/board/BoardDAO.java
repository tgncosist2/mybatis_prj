package kr.co.sist.board;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import day0612.RangeDTO;
import kr.co.sist.dao.MyBatisDAO;

public class BoardDAO {

	private static BoardDAO bDAO;

	private BoardDAO() {
	}// BoardDAO

	public static BoardDAO getInstance() {
		if (bDAO == null) {
			bDAO = new BoardDAO();
		} // end if
		return bDAO;
	}// getInstance

	public int selectTotalCount(RangeDTO rDTO) throws PersistenceException {
		int cnt = 0;
		// 1.MyBatis Handler 얻기
		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();
		// 2.쿼리를 실행
		cnt = ss.selectOne("kr.co.sist.user.board.selectTotalCount", rDTO);
		// 검색결과 kr.co.sist.user.board

		// 4.MyBatis Handler 닫기
		ss.close();

		return cnt;

	}// selectId

	/**
	 * 시작번호와 끝번호 사이에 있는 래코드를 얻는 일
	 * 
	 * @param rDTO
	 * @return
	 * @throws SQLException
	 */
	public List<BoardDTO> selectBoard(RangeDTO rDTO) throws PersistenceException {
		List<BoardDTO> list = null;

		SqlSession ss = MyBatisDAO.getInstance("kr/co/sist/dao/mybatis-config.xml").getMyBatisHandler();

		list = ss.selectList("kr.co.sist.user.board.selectBoard", rDTO);

		return list;
	}// selectAllMember

}// class
