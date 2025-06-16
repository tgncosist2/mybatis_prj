<%@page import="day0602.CpEmpDTO"%>
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
	
	$('#btnModify').click(()=>{
		$.ajax({
			url:'day0613/ajax_dynamic_set.jsp',
			type:'POST',
			data: {
				empno : ${param.empno},
				ename : $('#ename').val(),
				job : $('#job').val(),
				sal : $('#sal').val(),
				comm : $('#comm').val()
			},
			dataType:'JSON',
			error:function(xhr) {
				console.log(xhr.status + ' / ' + xhr.statusText);
			},
			success:function(jsonObj) {
				if (jsonObj.modifyResult) {
					alert('변경완료');
					reload();
					return;
				}
				
				alert('변경실패!!!');
			}
		});
	});
});// ready

function reload() {
$.ajax({
	url: 'day0613/ajax_dynamic_set_reload.jsp',
	data: { empno : ${param.empno} },
	type: 'get',
	dataType: 'json',
	error:function(xhr) {
		console.log(xhr.status);
	},
	success:function(jsonObj) {
		$('#ename').val('변경완');
		$('#job').val('변경완');
		$('#sal').val('변경완');
		$('#comm').val('변경완');
	}
});
}
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
		<h3>사원번호를 선택해주세요.</h3>
		<%
		SelectService6 ss6 = new SelectService6();
		pageContext.setAttribute("empnoList", ss6.selectAllEmpno());
		%>
		<c:forEach var="empno" items="${empnoList }">
			<a href="index.jsp?url=${param.url }&empno=${empno}"><c:out
					value="${empno }" /></a>
		</c:forEach>
	</form>
</div>
<div>
	<c:choose>
		<c:when test="${ not empty param.empno }">
			<%
			CpEmp ceDTO = null;
			String msg = "";
			try {
				ceDTO = ss6.selectOneEmp(Integer.parseInt(request.getParameter("empno")));
				msg = ceDTO == null ? "조회 실패" : "조회 완료";
			} catch (NumberFormatException nfe) {
				msg = "선택해주세요.";
				nfe.printStackTrace();
			} // end try-catch

			pageContext.setAttribute("msg", msg);
			pageContext.setAttribute("ceDTO", ceDTO);
			%>
			<c:out value="${msg }" />
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
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
				<c:when test="${empty ceDTO }">
					<tr>
						<td colspan="6">데이터가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr style="">
						<td><input type="text" value="${param.empno }"
							readonly="readonly" style="width: 100%;" /></td>
						<td><input type="text" value="${ceDTO.ename }"
							style="width: 100%;" id="ename" /></td>
						<td><input type="text" value="${ceDTO.job }"
							style="width: 100%;" id="job" /></td>
						<td><input type="text" value="${ceDTO.sal }"
							style="width: 100%;" id="sal" /></td>
						<td><input type="text" value="${ceDTO.comm }"
							style="width: 100%;" id="comm" /></td>
						<td><input type="text" value="${ceDTO.hiredate }"
							readonly="readonly" style="width: 100%;" /></td>
					</tr>
					<tr>
						<td colspan="6"><input type="button" id="btnModify" class="btn btn-success" value="변경"/></td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>