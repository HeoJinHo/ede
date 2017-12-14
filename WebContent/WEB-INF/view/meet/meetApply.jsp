<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>meetApply</h1>
	<form action="./meetApply.meet" method="post">
		<input type="hidden" value="${m_num }" name="m_num">
		<p>이름 :<input type="text" name="a_name"> </p>	
		<p>성별 :<input type="text" name="a_gender"> </p>	
		<p>나이 :<input type="number" name="a_age"> </p>	
		<p>연락처 :<input type="text" name="a_phone"> </p>	
		<p>이메일 :<input type="text" name="a_email"> </p>
		<p>직업(소속) :<input type="text" name="a_job"> </p>
		<button>신청하기</button>	
	</form>
</body>
</html>