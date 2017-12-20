<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<%-- <h3>아이디 : ${sessionScope.member.id}</h3>
	<h3>이 름 : ${sessionScope.member.name}</h3>
	<h3>닉네임 : ${sessionScope.member.nickname}</h3>
	<h3>이메일 : ${sessionScope.member.email}</h3>
	<h3>핸드폰 번호 : ${sessionScope.member.phone}</h3>
	<h3>성 별 : ${sessionScope.member.gender}</h3>
	<h3>피부타입 : ${sessionScope.member.skin}</h3>
	<h3>생년월일 : ${sessionScope.member.birth}</h3>
	<h3>주 소 : ${sessionScope.member.addr}</h3> --%>
	<form action="./memberUpdate.member" method="get">
		<input type="submit" value="회원정보 변경">
	</form>
<!-- 	<a href="./memberUpdate.member">정보수정</a> -->
	<form action="./memberDelete.member">
		<input type="submit" value="회원탈퇴">
	</form>
</body>
</html>





