<%@page import="day0612.SelectDAO5"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="rDTO" class="day0612.RangeDTO" scope="page"/>
<jsp:setProperty name="rDTO" property="*"/>
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

	});//ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="http://localhost/mybatis_prj/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<a href="?keyword=taeged&field=ID">눌러</a>
				<%
				int result = 0;
				if (request.getParameter("keyword") != null) {
					result = SelectDAO5.getInstance().rDTOTest(rDTO);
				}// end if
				%>
			<strong><%= result %></strong>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="http://localhost/mybatis_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>