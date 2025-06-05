<%@page import="day0604.SelectService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
SelectService ss = new SelectService();

String ename = "";
try {
ename = ss.scsrService(Integer.parseInt(request.getParameter("empno")));
ename = ename == null || ename.isEmpty() ? "사원번호에 해당하는 사원이 존재하지 않습니다." : ename;
} catch (NumberFormatException nfe) {
	ename = "사원번호는 숫자를 입력해주세요.";
}// end try-catch

pageContext.setAttribute("ename", ename);
%>
<c:out value="${ename }"/>
</c:when>
		<c:otherwise>
사원번호를 입력해주세요.
</c:otherwise>
	</c:choose>
</div>