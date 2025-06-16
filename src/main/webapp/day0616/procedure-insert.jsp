<%@page import="day0616.SelectService7"%>
<%@page import="day0612.SelectService5"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.domain.CpEmp"%>
<%@page import="day0605.SelectService2"%>
<%@page import="day0604.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
$(function() {	
	$('#btn').click(()=>{
		$('#frm').submit();
	});// click
});// ready
</script>
<style>
input {
	text-align: center;
}

th {
	width: 100px;
}
</style>
<h2>PROCEDURE-INSERT 사용</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>사원정보 입력</h3>
		<input type="hidden" name="url" value="${param.url }" /> <label>사원
			번호</label> <input type="text" name="empno" /><br> <label>사원 명</label> <input
			type="text" name="ename" /><br> <label>직무</label> <input
			type="text" name="job" /><br> <label>연봉</label> <input
			type="text" name="sal" /><br> <input type="button" value="추가"
			class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<jsp:useBean id="ceDTO" class="day0616.CpEmp6DTO" scope="page" />
	<jsp:setProperty property="*" name="ceDTO" />
	<c:choose>
		<c:when test="${ not empty param.empno }">
			<%
			SelectService7 ss7 = new SelectService7();

			ss7.procedureInsert(ceDTO);

			pageContext.setAttribute("ceDTO", ceDTO);
			%>
		</c:when>
		<c:otherwise>
			입력 해달란 말이에요.
		</c:otherwise>
	</c:choose>
	<table class="table table-bordered"
		style="width: 750px; margin-right: 10px;">
		<thead>
			<tr style="text-align: center;">
				<th>CNT</th>
				<th>메세지</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty ceDTO.msg }">
				<tr>
					<td colspan="2">입력해달라구요</td>
				</tr>
			</c:if>
			<tr>
				<td><c:out value="${ceDTO.cnt == 0 ? '' : ceDTO.cnt }" /></td>
				<td><c:out value="${ceDTO.msg }" /></td>
			</tr>
		</tbody>
	</table>
</div>