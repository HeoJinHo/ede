<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css"> 
<title>메인 홈페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
	<h1>team ede</h1>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
	</nav>
	<!-- category by kj -->
	<a href ="./product/categoryList.product?del=category">product</a>
	
	<!-- notice, qna by suin -->
	<a href="./notice/noticeList.notice">Notice List</a>
	<a href="./qna/qnaList.qna">Qna List</a>
	<a href="./help/helpList.help">1:1 문의</a>
	
	


	<c:if test="${empty member}">
	<a href="./member/memberJoin.member">Join</a>
	<a href="./member/memberLogin.member">Login</a>
	</c:if>
	<c:if test="${not empty member}">
	<a href="./member/memberLogout.member">Logout</a>
	<a href="./member/memberMyPage.member">MyPage</a>
	</c:if>
	<a href="./json/json_1.json">JSON Test</a>
	<img src="./upload/iu_11.jpg">
	<img src="./upload/iu_11.jpg">

	<a href ="./meet/meetList.meet">모임</a>

</body>
</html>