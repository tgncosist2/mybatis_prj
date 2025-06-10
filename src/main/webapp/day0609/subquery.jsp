<%@page import="kr.co.sist.domain.CpEmp"%>
<%@page import="kr.co.sist.domain.Zipcode"%>
<%@page import="java.util.List"%>
<%@page import="day0609.SelectService3"%>
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
<h2>subquery 사용</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>부서번호를 입력받아 검색 처리</h3>
		<input type="hidden" name="url" value="${param.url }" /> <label>부서번호</label>
		<input type="text" name="deptno" /> <input type="button" value="검색"
			class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.deptno }">
			<%

			SelectService3 ss3 = new SelectService3();
			
			int deptno = Integer.parseInt(request.getParameter("deptno"));
			
			List<CpEmp> list = ss3.subqueryService();
			
			pageContext.setAttribute("list", list);
			%>
		</c:when>
		<c:otherwise>
부서번호를 입력해주세요.
</c:otherwise>
	</c:choose>
	<table class="table table-bordered"
		style="width: 750px; margin-right: 10px;">
		<thead>
			<tr style="text-align: center;">
				<th style="width: 150px;" colspan="2">사원명</th>
				<th style="width: 300px;" colspan="2">사원번호</th>
				<th style="width: 300px;" colspan="2">부서번호</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="5">[${param.deptno }] 검색 데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5"><h2>
								검색
								[<c:out value="${param.deptno }" />]
							</h2></td>
					</tr>
					<c:forEach var="list" items="${list }" varStatus="i">
						<tr>
							<td colspan="2"><c:out value="${list.ename}" /></td>
							<td colspan="2"><c:out value="${list.empno }" /></td>
							<td colspan="2"><c:out value="${list.deptno }" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>