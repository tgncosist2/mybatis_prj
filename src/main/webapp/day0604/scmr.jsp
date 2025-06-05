<%@page import="java.util.List"%>
<%@page import="day0604.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function() {

});// ready
</script>
<h2>컬럼 하나에 여러 행 조회</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>사원테이블에 부서번호를 조회하자.</h3>
	</form>
</div>
<div>
<%
SelectService ss = new SelectService();

pageContext.setAttribute("deptnoList", ss.scmrService());
%>
<table class="table table-hover">
<thead>
<tr>
<th>번호</th>
<th>부서번호</th>
</tr>
</thead>
<tbody>
<c:forEach var="deptno" items="${deptnoList }" varStatus="i">
<tr>
	<td><c:out value="${i.count }"/></td>
	<td><c:out value="${deptno }"/></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>