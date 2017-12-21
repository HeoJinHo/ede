<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#category").click(function(){
			$.get("./categoryList.product?del=category", function(data){
				$("#result").html(data);
			});
		});
		$("#brand").click(function(){
			$.get("./categoryList.product?del=brand", function(data){
				$("#result").html(data);
			});
		});
	});
</script>
</head>
<body>
	<button id="category">Category</button><button id="brand">Brand</button>
	<div id="result">
	<table>
	<c:forEach items="${list}" var="i" varStatus="s">
		<tr>
			<td><a href="./productListMain.product?del=category">${i.category }</a></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	
	<a href="./productRegist.product">Register</a>
</body>
</html>