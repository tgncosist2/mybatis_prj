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
</style>
<h2>컬럼 여러개에 한 행 조회</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>사원번호를 입력받아 사원정보 검색</h3>
		<input type="hidden" name="url" value="${param.url }" /> <label>사원번호</label>
		<input type="text" name="empno" /> <input type="button" value="검색"
			class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.empno }">
			<%
			SelectService2 ss2 = new SelectService2();

			CpEmp ce = null;
			String msg = "";
			try {
				ce = ss2.mcsrService(Integer.parseInt(request.getParameter("empno")));
				msg = ce == null ? "조회 실패" : "조회 완료";
			} catch (NumberFormatException nfe) {
				msg = "사원번호는 숫자를 입력해주세요.";
			} // end try-catch

			pageContext.setAttribute("msg", msg);
			pageContext.setAttribute("ce", ce);
			%>
			<c:out value="${msg }" />
		</c:when>
		<c:otherwise>
사원번호를 입력해주세요.
</c:otherwise>
	</c:choose>
	<table class="table table-bordered" style="width: 750px; margin-right: 10px;">
		<thead>
			<tr style="text-align: center;">
				<th style="width: 100px;">사원번호</th>
				<th style="width: 150px;">사원명</th>
				<th style="width: 150px;">직무</th>
				<th style="width: 100px;">연봉</th>
				<th style="width: 100px;">보너스</th>
				<th style="width: 150px;">입사일</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty ce }">
					<tr>
						<td colspan="6">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr style="">
						<td><input type="text" value="${ce.empno }" readonly="readonly" style="width: 100%;"/></td>
						<td><input type="text" value="${ce.ename }" style="width: 100%;"/></td>
						<td><input type="text" value="${ce.job }" style="width: 100%;"/></td>
						<td><input type="text" value="${ce.sal }" style="width: 100%;"/></td>
						<td><input type="text" value="${ce.comm }" style="width: 100%;"/></td>
						<td><input type="text" value="${ce.hiredate }" readonly="readonly" style="width: 100%;"/></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>