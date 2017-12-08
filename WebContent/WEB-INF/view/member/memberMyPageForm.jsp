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
	<h3>닉네임 : ${member.nickname}</h3>
	<h3>이메일 : ${member.email}</h3>
	<h3>핸드폰 번호 : ${member.phone}</h3>
	<h3>성 별 : ${member.gender}</h3>
	<h3>생년월일 : ${member.birth}</h3>
	<h3>주 소 : ${member.addr}</h3>
</body>
</html>