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
<h2>Like 처리</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>동 이름을 입력받아 검색 처리</h3>
		<input type="hidden" name="url" value="${param.url }" /> <label>동이름</label>
		<input type="text" name="dong" /> <input type="button" value="검색"
			class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.dong }">
			<%

			SelectService3 ss3 = new SelectService3();
			
			String dong = request.getParameter("dong");
			
			System.out.println(dong);
			
			List<Zipcode> list = ss3.likeService(dong);
			
			pageContext.setAttribute("list", list);
			%>
		</c:when>
		<c:otherwise>
동을 입력해주세요.
</c:otherwise>
	</c:choose>
	<table class="table table-bordered"
		style="width: 750px; margin-right: 10px;">
		<thead>
			<tr style="text-align: center;">
				<th style="width: 100px;">우편번호</th>
				<th style="width: 150px;">시도</th>
				<th style="width: 150px;">구군</th>
				<th style="width: 100px;">동</th>
				<th style="width: 100px;">번지</th>
				<th style="width: 150px;">SEQ</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="5">[${param.dong }] 검색 데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5"><h2>
								검색
								[<c:out value="${param.dong }" />]
							</h2></td>
					</tr>
					<c:forEach var="list" items="${list }" varStatus="i">
						<tr>
							<td><c:out value="${list.zipcode}" /></td>
							<td><c:out value="${list.sido }" /></td>
							<td><c:out value="${list.gugun }" /></td>
							<td><c:out value="${list.dong }" /></td>
							<td><c:out value="${list.bunji }" /></td>
							<td><c:out value="${list.seq }"/></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>