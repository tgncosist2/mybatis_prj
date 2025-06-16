<%@page import="day0613.SelectService6"%>
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
	
	$('#btn2').click(()=>{
		$('#frm2').submit();
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
<h2>테이블명이 동적일때</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>테이블을 선택해서 조회하기($ Sign)</h3>
		<input type="hidden" name="url" value="${param.url }" /> <label>달러</label>
		<input type="hidden" name="company" value="EMP" /> <input
			type="button" value="검색" class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.company }">
			<%
			SelectService5 ss5 = new SelectService5();

			List<CpEmp> list = null;
			String msg = "";
			try {
				list = ss5.dollarSign(request.getParameter("company"));
				msg = list == null ? "조회 실패" : "조회 완료";
			} catch (NumberFormatException nfe) {
				msg = "선택해주세요.";
				nfe.printStackTrace();
			} // end try-catch

			pageContext.setAttribute("msg", msg);
			pageContext.setAttribute("list", list);
			%>
			<c:out value="${msg }" />
		</c:when>
		<c:otherwise>
선택해주세요.
</c:otherwise>
	</c:choose>
	<form action="index.jsp" method="GET" id="frm2">
			<input type="hidden" name="url" value="${param.url }" />
			<input type="hidden" name="company" value="${param.company }" />
			<input type="button" value="검색" class="btn btn-success btn-sm"
				id="btn2" />
		<table class="table table-bordered"
			style="width: 750px; margin-right: 10px;">
			<thead>
				<tr style="text-align: center;">
					<th>선택</th>
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
					<c:when test="${empty list }">
						<tr>
							<td colspan="7">데이터가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="list" items="${list }" varStatus="i">
							<tr style="">
								<td><input type="checkbox" value="${list.empno }"
									name="empno" /></td>
								<td><input type="text" value="${list.empno }"
									readonly="readonly" style="width: 100%;" /></td>
								<td><input type="text" value="${list.ename }"
									style="width: 100%;" /></td>
								<td><input type="text" value="${list.job }"
									style="width: 100%;" /></td>
								<td><input type="text" value="${list.sal }"
									style="width: 100%;" /></td>
								<td><input type="text" value="${list.comm }"
									style="width: 100%;" /></td>
								<td><input type="text" value="${list.hiredate }"
									readonly="readonly" style="width: 100%;" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</form>
	<c:if test="${not empty paramValues.empno }">
		<h2>선택한 사원 정보</h2>
		<%
		String[] empnoArr = request.getParameterValues("empno");
		
		SelectService6 ss6 = new SelectService6();
		List<CpEmp> empnolist = ss6.foreach(empnoArr);
		
		pageContext.setAttribute("selectEmpnoList", empnolist);
		%>
	</c:if>
	<table class="table table-bordered"
			style="width: 750px; margin-right: 10px;">
			<thead>
				<tr style="text-align: center;">
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
					<c:when test="${empty selectEmpnoList }">
						<tr>
							<td colspan="6">선택한 사원이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="list" items="${selectEmpnoList }" varStatus="i">
							<tr style="">
								<td><input type="text" value="${list.empno }"
									readonly="readonly" style="width: 100%;" /></td>
								<td><input type="text" value="${list.ename }"
									style="width: 100%;" /></td>
								<td><input type="text" value="${list.job }"
									style="width: 100%;" /></td>
								<td><input type="text" value="${list.sal }"
									style="width: 100%;" /></td>
								<td><input type="text" value="${list.comm }"
									style="width: 100%;" /></td>
								<td><input type="text" value="${list.hiredate }"
									readonly="readonly" style="width: 100%;" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
</div>