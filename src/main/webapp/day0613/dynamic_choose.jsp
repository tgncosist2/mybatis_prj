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
	<c:if test="${not empty param.deptno}">
		$("[value='${param.deptno}']").prop("checked",true);
	</c:if>
	
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
<h2>다이나믹 choose</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>부서를 선택해서 조회하기(choose)</h3>
		<input type="hidden" name="url" value="${param.url }" /> 
		<input type="radio" name="deptno" value="1"/>A부서
		<input type="radio" name="deptno" value="2"/>B부서
		<input type="radio" name="deptno" value="3"/>C부서
		<input type="button" value="검색" class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.deptno }">
			<%
			SelectService6 ss6 = new SelectService6();

			List<CpEmp> list = null;
			String msg = "";
			try {
				list = ss6.choose(Integer.parseInt(request.getParameter("deptno")));
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
	<table class="table table-bordered" style="width: 750px; margin-right: 10px;">
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
				<c:when test="${empty list }">
					<tr>
						<td colspan="6">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="list" items="${list }" varStatus="i">
						<tr style="">
							<td><input type="text" value="${list.empno }" readonly="readonly" style="width: 100%;"/></td>
							<td><input type="text" value="${list.ename }" style="width: 100%;"/></td>
							<td><input type="text" value="${list.job }" style="width: 100%;"/></td>
							<td><input type="text" value="${list.sal }" style="width: 100%;"/></td>
							<td><input type="text" value="${list.comm }" style="width: 100%;"/></td>
							<td><input type="text" value="${list.hiredate }" readonly="readonly" style="width: 100%;"/></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>