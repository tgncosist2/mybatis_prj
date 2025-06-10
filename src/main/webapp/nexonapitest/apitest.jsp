<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

		$('#btnSearch').click(()=>{
			if ($('#charName').val() == "") {
				alert('케릭터명을 입력해주세요.')
				$('#charName').focus();
				return;
			};// end if
			
			var charName = $('#charName').val();
			
			$.ajax({
				url: 'ajax_apitest.jsp',
				type:'POST',
				data:{ charName : charName },
				dataType:'json',
				error:function(xhr) {
					console.log(xhr.status + '' + xhr.statusText);
				},
				success:function(jsonObj) {
 					const output = "<div style=\"width: 100px; height: 100px; border: 1px solid #333;\" id=\"charImg\">" +
 			        "<img src=\"" + jsonObj.character_image + "\" style=\"width: 100%; height: 100%\"/>" +					
 			       "</div>" +
 			       "케릭터명 : <strong>" + jsonObj.character_name + "</strong><br>" +
 			       "서버명 : <strong>" + jsonObj.world_name + "</strong><br>" +
 			       "레벨 : <strong>" + jsonObj.character_level + "</strong><br>";
					
					$('#output').html(output);
				}
			});//ajax
			
			
		});//click
		
	});//ready
</script>
</head>
<body>
	<header data-bs-theme="dark">
		<c:import url="http://localhost/mybatis_prj/common/jsp/header.jsp" />
	</header>
	<main>
		<div id="container">
			<div
				style="width: 400px; height: 400px; border: 1px solid #333; margin-bottom: 20px;"
				id="output"></div>

			<div style="width: 400px; height: 200px; text-align: center;">
				<label for="charName">케릭터명</label><input type="text"
					class="form-control" id="charName" name="charName"
					style="margin-bottom: 10px;" /> <input type="button"
					class="btn btn-info btn-sm" value="검색" id="btnSearch" />

			</div>

		</div>
	</main>
	<footer class="text-body-secondary py-5">
		<c:import url="http://localhost/mybatis_prj/common/jsp/footer.jsp" />
	</footer>
</body>
</html>