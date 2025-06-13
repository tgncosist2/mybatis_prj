package kr.co.sist.board;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import day0612.RangeDTO;

public class BoardService {

	/**
	 * 1. 총 레코드의 수를 구합니다.
	 * 
	 * @param rDTO
	 * @return 레코드의 수
	 */
	public int totalCount(RangeDTO rDTO) {
		int cnt = 0;

		BoardDAO bDAO = BoardDAO.getInstance();

		try {
			cnt = bDAO.selectTotalCount(rDTO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		} // end try-catch

		return cnt;
	}// totalCount

	/**
	 * 한 화면에 보여줄 게시물의 수
	 * 
	 * @return 보여줄 게시물의 수
	 */
	public int pageScale() {
		int pageScale = 10;

		return pageScale;
	}

	/**
	 * 총 페이지 수
	 * 
	 * @param totalCount 총 게시물의 수
	 * @param pageScale  한 화면에 보여질 게시물의 수
	 * @return 총 페이지 수
	 */
	public int totalPage(int totalCount, int pageScale) {
		int totalPage = 0;

		totalPage = (int) Math.ceil((double) totalCount / pageScale);

		return totalPage;
	}// totalPage

	/**
	 * pagination을 클릭했을 때의 번호를 사용하여 해당 페이지의 시작번호를 구하자 예 : 1 - 1, 2 - 11, 3 - 21, 4 -
	 * 31, 5 - 41
	 * 
	 * @param pageScale
	 * @param rDTO
	 * @return
	 */
	public int startNum(int pageScale, RangeDTO rDTO) {
		int startNum = 0;

		startNum = (rDTO.getCurrentPage() * pageScale) - pageScale + 1;
		rDTO.setStartNum(startNum);

		return startNum;
	}// startNum

	public int endNum(int pageScale, RangeDTO rDTO) {
		int endNum = 0;

		endNum = rDTO.getStartNum() + pageScale - 1;
		rDTO.setEndNum(endNum);

		return endNum;
	}

	public List<BoardDTO> searchBoard(RangeDTO rDTO) {
		List<BoardDTO> list = null;

		try {
			list = BoardDAO.getInstance().selectBoard(rDTO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return list;
	}// searchBoard

}// class
