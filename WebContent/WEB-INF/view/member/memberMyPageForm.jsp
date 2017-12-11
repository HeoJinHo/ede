<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>아이디 : ${sessionScope.member.id}</h3>
	<h3>이 름 : ${sessionScope.member.name}</h3>
	<h3>닉네임 : ${sessionScope.member.nickname}</h3>
	<h3>이메일 : ${sessionScope.member.email}</h3>
	<h3>핸드폰 번호 : ${sessionScope.member.phone}</h3>
	<h3>성 별 : ${sessionScope.member.gender}</h3>
	<h3>생년월일 : ${sessionScope.member.birth}</h3>
	<h3>주 소 : ${sessionScope.member.addr}</h3>
	<a href="./member/memberUpdate.member">정보수정</a>
	<a href="../index.jsp">취소</a>
</body>
</html>






