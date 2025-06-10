<%@page import="kr.co.sist.domain.Car"%>
<%@page import="day0610.SelectService4"%>
<%@page import="kr.co.sist.domain.CpEmp"%>
<%@page import="kr.co.sist.domain.Zipcode"%>
<%@page import="java.util.List"%>
<%@page import="day0609.SelectService3"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
SelectService4 ss4 = new SelectService4();

List<String> modelList = ss4.searchAllModel();

pageContext.setAttribute("modelList", modelList);
String selectModel = request.getParameter("model") != null ? request.getParameter("model") : "";
pageContext.setAttribute("selectModel", selectModel);
%>
<script type="text/javascript">
$(function() {
	var selectModel = '${selectModel}';
	
	$('#select').val(selectModel);
	
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
<h2>Join 사용</h2>
<div>
	<form action="index.jsp" id="frm">
		<h3>모델명을 입력받아 검색 처리</h3>
		<input type="hidden" name="url" value="${param.url }" /> 
		<label>모델명</label>
		<select name="model" id="select">
			<c:forEach var="item" items="${modelList }" varStatus="i">
				<option value="${item }">${item }</option>
			</c:forEach>
		</select> 
		<input type="button" value="검색"
			class="btn btn-success btn-sm" id="btn" />
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.model }">
			<%
			List<Car> carList = ss4.joinService(request.getParameter("model"));
			
			pageContext.setAttribute("list", carList);
			%>
		</c:when>
		<c:otherwise>
모델명을 입력해주세요.
</c:otherwise>
	</c:choose>
	<table class="table table-bordered"
		style="width: 900px; margin-right: 10px;">
		<thead>
			<tr style="text-align: center;">
				<th style="width: 100px;">제조사</th>
				<th style="width: 150px;">모델명</th>
				<th style="width: 100px;">연식</th>
				<th style="width: 100px;">가격</th>
				<th style="width: 100px;">CC</th>
				<th style="width: 200px;">이미지</th>
				<th style="width: 150px;">제조년월</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="7">[${param.model }] 검색 데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7"><h2>
								검색 모델명 : 
								[<c:out value="${param.model }" />]
							</h2></td>
					</tr>
					<c:forEach var="list" items="${list }" varStatus="i">
						<tr>
							<td><c:out value="${list.maker}" /></td>
							<td><c:out value="${list.model}" /></td>
							<td><c:out value="${list.car_year}" /></td>
							<td><c:out value="${list.price}" /></td>
							<td><c:out value="${list.cc}" /></td>
							<td><img src="http://localhost/mybatis_prj/common/images/car_img/${list.car_img }" style="width: 200px; height: 100%;"/></td>
							<td><fmt:formatDate value="${list.hiredate }" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>