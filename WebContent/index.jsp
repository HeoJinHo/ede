<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h3>아이디 : ${sessionScope.member.id}</h3>
	<h1>team ede</h1>
	
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