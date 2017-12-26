<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/productMain.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#category").click(function(){
			$.get("./categoryList.product?del=category", function(data){
				$(".container").html(data);
			});
		});
		$("#brand").click(function(){
			$.get("./categoryList.product?del=brand", function(data){
				$(".container").html(data);
			});
		});
	});
</script>
<style type="text/css">
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	
	<nav class="navbar navbar-inverse nav-kj">
		<ul class="nav navbar-nav">
			<li><a href="#" id="category">Category</a></li>
			<li><a href="#" id="brand">Brand</a></li>
		</ul>
	</nav>

	<div class="container">
	<table class="table">
	<c:forEach items="${list}" var="i" varStatus="s">
		<tr>
			<td><a href="./productListMain.product?del=category">${i.category }</a></td>
			<td><a href="./productListMain.product?del=category">${i.category }</a></td>
		</tr>
	</c:forEach>
	</table>
	</div>
	

	<a href="./productRegist.product">Register</a>
	
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>