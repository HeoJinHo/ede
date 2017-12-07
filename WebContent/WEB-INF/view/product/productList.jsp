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
	<h1>product List</h1>
	<a href="#">category</a>
	<a href="#">brand</a>
	<c:forEach items="${list}" var="i">
		<tr>
			<td>${i.brand}</td>
			<td>${i.pro_name}</td>
			<td>${i.pro_price}</td>
			<td>${i.capacity}</td>
			<td>${i.info}</td>
			<td>${i.grade1}</td>
			<td>${i.grade2}</td>
			<td>${i.grade3}</td>
			<td>${i.grade4}</td>
			<td>${i.grade5}</td>
			<td>${i.pic_realName}</td>
			<td>${i.pic_compName}</td>
			<td>${i.evt}</td>
			<td>${i.pro_num}</td>
		</tr>
	</c:forEach>
	<a href="./productRegist.product">Register</a>
</body>
</html>