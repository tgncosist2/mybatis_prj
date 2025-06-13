package kr.co.sist.board;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;

import day0612.RangeDTO;

public class BoardServicea {

	public List<BoardDTO> searchBoard(RangeDTO rDTO) {
		List<BoardDTO> list = null;

		try {
			list = BoardDAO.getInstance().selectBoard(rDTO);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}

		return list;
	}// searchBoard

	
	public static void main(String[] args) {
		RangeDTO rDTO = new RangeDTO();
		rDTO.setStartNum(1);
		rDTO.setEndNum(5);
		rDTO.setField("ID");
		rDTO.setKeyword("taeged");
		
		for (BoardDTO item : new BoardServicea().searchBoard(rDTO)) {
			System.out.println(item.toString());
		}
	}
	
}// class
