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
<h2>작다의 조회</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>입력된 연봉보다 적은 연봉을 수령하는 사원정보를 검색</h3>
		<input type="hidden" name="url" value="${param.url }" /> <label>연봉</label>
		<input type="text" name="sal" /> <input type="button" value="검색"
			class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.sal }">
			<%
			SelectService2 ss2 = new SelectService2();

			List<CpEmp> list = null;
			String msg = "";
			try {
				list = ss2.lessThanService(Integer.parseInt(request.getParameter("sal")));
				msg = list == null ? "조회 실패" : "조회 완료";
			} catch (NumberFormatException nfe) {
				msg = "사원번호는 숫자를 입력해주세요.";
			} // end try-catch

			pageContext.setAttribute("msg", msg);
			pageContext.setAttribute("list", list);
			%>
			<c:out value="${msg }" />
		</c:when>
		<c:otherwise>
연봉을 입력해주세요.
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