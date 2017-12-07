<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>team ede</h1>
	<!-- category by kj -->
	<a href ="./category/categoryList.category">category</a>
	<a href ="./meet/meetList.meet">모임</a>
	
	<!-- notice, qna by suin -->
	<a href="./notice/noticeList.notice">Notice List</a>
	<a href="./qna/qnaList.qna">Qna List</a>
	<a href="./notice/noticeList.notice">Notice List</a>
	<a href="./qna/qnaList.qna">Qna List</a>
	<c:if test="${empty member}">
	<a href="./member/memberJoin.member">Join</a>
	<a href="./member/memberLogin.member">Login</a>
	</c:if>
	<c:if test="${not empty member}">
	<a href="./member/memberLogout.member">Logout</a>
	<a href="./member/memberMypage.member">MyPage</a>
	</c:if>
	<a href="./json/json_1.json">JSON Test</a>
	 <img src="./upload/iu_11.jpg">

</body>
</html>