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
<h2>컬럼 하나에 한 행 조회</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>사원번호를 입력받아 사원명을 검색</h3>
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
			<c:out value="${ename }" />
		</c:when>
		<c:otherwise>
사원번호를 입력해주세요.
</c:otherwise>
	</c:choose>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>사원번호</th>
				<th>사원명</th>
				<th>직무</th>
				<th>연봉</th>
				<th>보너스</th>
				<th>입사일</th>
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
					<tr>
						<td><c:out value="${ce.empno }" /></td>
						<td><c:out value="${ce.ename }" /></td>
						<td><c:out value="${ce.job }" /></td>
						<td><c:out value="${ce.sal }" /></td>
						<td><c:out value="${ce.comm }" /></td>
						<td><c:out value="${ce.hiredate }" /></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>