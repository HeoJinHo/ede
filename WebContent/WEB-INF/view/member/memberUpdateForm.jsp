<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Update ${member}</h1>
	<form action="./${member}Update.${member}" method="post">
		아이디 : <input type="hidden" name="id" value="${view.id}">
		비밀번호 : <input type="password" name="pw" readonly="readonly" value="${view.pw}">
		생년월일 : <input type="date" name="birth" value="${view.birth}">
		성별 : <input type="radio" name="gender" value="${view.gender}"><input type="radio" name="gender" value="${view.gender}">
		주소 : <input type="text" name="addr" value="${view.addr}">
		핸드폰번호 : <input type="text" name="phone" value="${view.phone}">
		이메일 : <input type="email" name="email" value="${view.email}">
		<button>Update</button>
	</form>	
</body>
</html>