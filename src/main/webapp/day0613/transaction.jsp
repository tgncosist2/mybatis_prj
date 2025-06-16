<%@page import="day0613.TransactionDTO"%>
<%@page import="day0613.SelectService6"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야호</title>
<c:import url="http://localhost/mybatis_prj/common/jsp/external_file.jsp" />
<style type="text/css">
#container {
	min-height: 600px;
	margin-top: 30px;
	margin-left: 20px
}
</style>

<script type="text/javascript">
	$(function() {
		$('#btn').click(()=>{
			$('#frm').submit();
		});// click
	});//ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="http://localhost/mybatis_prj/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<div id="control" style="text-align: center; border: 1px solid #333; width: 400px; height: 130px;">
			<form action="transaction.jsp" method="GET" id="frm">
				<input type="text" class="form-control" placeholder="이름" id="name" name="name"/>
				<input type="text" class="form-control" placeholder="주소" id="addr" name="addr"/>
				<input type="button" class="btn btn-danger" style="width: 100%; margin-top: 10px;" id="btn" value="전송"/>
			</form>
			</div>
			<%
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			
			String msg = "에러발생!";
			
			if (name != null && name != "" && addr != null && addr != "") {
				SelectService6 ss6 = new SelectService6();
				
				TransactionDTO tDTO = new TransactionDTO();
				tDTO.setName(name);
				tDTO.setAddr(addr);
				
				try {
					ss6.transaction(tDTO);
					msg = "정상적으로 처리되었습니다.";
				} catch (Exception e) {
					System.err.println("야호");
					
				}
			} else {
				msg = "값을 제대로 입력해주세요.";
			}
			%>
			<div id="output" style="border: 1px solid #333; width: 400px; height: 400px; margin-top: 50px;">
				<%= msg %>
			</div>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="http://localhost/mybatis_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>