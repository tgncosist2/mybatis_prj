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
</style>
<h2>컬럼 여러개에 여러 행 조회</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>부서번호를 입력받아 사원정보들 검색</h3>
		<input type="hidden" name="url" value="${param.url }" /> <label>부서번호</label>
		<input type="text" name="deptno" /> <input type="button" value="검색"
			class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.deptno }">
			<%
			SelectService2 ss2 = new SelectService2();

			List<CpEmp> list = null;
			String msg = "";
			try {
				list = ss2.mcmrService(Integer.parseInt(request.getParameter("deptno")));
				msg = list == null ? "조회 실패" : "조회 완료";
			} catch (NumberFormatException nfe) {
				msg = "부서번호는 숫자를 입력해주세요.";
			} // end try-catch

			pageContext.setAttribute("msg", msg);
			pageContext.setAttribute("list", list);
			%>
			<c:out value="${msg }" />
		</c:when>
		<c:otherwise>
부서번호를 입력해주세요.
</c:otherwise>
	</c:choose>
	<table class="table table-bordered"
		style="width: 750px; margin-right: 10px;">
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
				<c:when test="${empty list }">
					<tr>
						<td colspan="5">${param.deptno }번 부서 데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
				<tr><td colspan="5"><h2><c:out value="${param.deptno }"/>번 부서</h2></td></tr>
					<c:forEach var="list" items="${list }" varStatus="i">
						<tr>
							<td><c:out value="${list.empno}"/></td>
							<td><c:out value="${list.ename }"/></td>
							<td><c:out value="${list.job }"/></td>
							<td><c:out value="${list.sal }"/></td>
							<td><c:out value="${list.comm }"/></td>
							<td><fmt:formatDate pattern="" value=""/></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>