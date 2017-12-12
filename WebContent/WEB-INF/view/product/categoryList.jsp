<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h1>Category List</h1>
	<a href="./categoryList.product?del=category">category</a>
	<a href="./categoryList.product?del=brand">brand</a>
	<table>
	<c:forEach items="${list}" var="i">
		<tr>
			<td><a href="./productList.product?del=category">${i.category }</a></td>
		</tr>
	</c:forEach>
	</table>
	<a href="./productRegist.product">Register</a>
</body>
</html>