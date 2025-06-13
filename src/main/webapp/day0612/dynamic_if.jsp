<%@page import="kr.co.sist.domain.CpEmp2"%>
<%@page import="day0612.SelectService5"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.domain.CpEmp"%>
<%@page import="day0605.SelectService2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="weDTO" class="day0612.WhereDTO" scope="page"/>
<jsp:setProperty name="weDTO" property="*"/>    
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
<h2>부서사원 검색</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>사원을 검색</h3>
		<input type="hidden" name="url" value="${param.url }" /> <label>부서번호</label>
		<input type="text" name="deptno" /> <input type="button" value="검색"
			class="btn btn-success btn-sm" id="btn" />
	</form>
</div> 
<div>
	<c:choose>
		<c:when test="${ not empty param.deptno }">
			<%
			SelectService5 ss5 = new SelectService5();

			List<CpEmp2> list = null;
			String msg = "";
			try {
				list = ss5.dynamicIf(weDTO);
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
				<th style="width: 150px;">부서번호</th>
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
							<td><input type="text" value="${list.empno }" readonly="readonly" style="width: 100%;"/></td>
							<td><input type="text" value="${list.ename }" style="width: 100%;"/></td>
							<td><input type="text" value="${list.job }" style="width: 100%;"/></td>
							<td><input type="text" value="${list.sal }" style="width: 100%;"/></td>
							<td><input type="text" value="${list.comm }" style="width: 100%;"/></td>
							<td><input type="text" value="${list.hiredate }" readonly="readonly" style="width: 100%;"/></td>
							<td><input type="text" value="${list.deptno }" readonly="readonly" style="width: 100%;"/></td>
						</tr>
					</c:forEach>
				
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>