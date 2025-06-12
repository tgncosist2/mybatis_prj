<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>야호</title>
<c:import
	url="http://localhost/mybatis_prj/common/jsp/external_file.jsp" />
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
			<form action="captchaProcess.jsp" method="POST">
				<div class="g-recaptcha" data-sitekey="6Lc7UlsrAAAAAKgZrmD6y25f2pNLkLH_t_iWQ7dA"></div>
				<button type="submit">제출</button>
			</form>
			<script src="https://www.google.com/recaptcha/api.js" async defer></script>
		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="http://localhost/mybatis_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>