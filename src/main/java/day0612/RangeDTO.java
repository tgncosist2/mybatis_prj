package day0612;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RangeDTO {

	private String field, keyword;// 검색에 대한 부분.
	private int currentPage = 1, startNum, endNum;// 현재페이지, 시작번호, 끝번호.
	private int startPage, endPage;

	private String[] boardFieldText = { "제목", "내용", "작성자" };
	private String[] restFieldText = { "식당명", "메인 메뉴", "작성자" };

	public String getFieldName() {
		String fieldName = "";
			fieldName = "subject";
			
			switch (field) {
			case "1":
				fieldName = "id";
				break;
			case "2":
				fieldName = "content";
				break;
			}

		return fieldName;
	}
}
