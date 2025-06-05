<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(function() {

	$('#btn').click(()=>{
		$.getJSON('https://data.ex.co.kr/openapi/restinfo/hiwaySvarInfoList?key=test&type=json&svarCd=000485',function(data){
			$.ajax({
				url:'day0605/ajax_test.jsp',
				type:'POST',
				data: { json: JSON.stringify(data) },
				dataType:'json',
				error:function(xhr) {
					console.log(xhr.status);
				},
				success:function(jsonObj) {
					alert(jsonObj.count);
				}
			});// ajax
		});// getJson
	});// click
	
});// ready
</script>
<div>
<input type="button" id="btn" value="눌러" class="btn btn-success"/>

</div>