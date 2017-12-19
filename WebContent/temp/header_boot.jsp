<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div id="glowpick">
				<ul>
					<li>GLOWPICK</li>
				</ul>
			</div>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>
					<li><a href="<%=request.getContextPath()%>/product/categoryList.product?del=category">Product</a></li>
					<li><a href="#">전문가</a></li>
					<li><a href="#">Event</a></li>
					<li><a href="<%=request.getContextPath()%>/meet/meetList.meet">모임</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${empty member}">
						<li><a href="<%=request.getContextPath()%>/member/memberLogin.member">Login</a></li>
						<li><a href="<%=request.getContextPath()%>/notice/noticeList.notice">고객센터</a></li>
					</c:if>
					<c:if test="${not empty member}">
						<li><a href="<%=request.getContextPath()%>/member/memberLogout.member">Logout</a></li>
						<li><a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a></li>
						<li><a href="<%=request.getContextPath()%>/notice/noticeList.notice">고객센터</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>

</body>
</html>
