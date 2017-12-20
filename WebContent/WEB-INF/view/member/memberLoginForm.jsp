<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="../css/header.css" rel="stylesheet">
</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<h1>Member Login</h1>
	<form action="./memberLogin.member" method="post">
		ID <input type="text" name="id">
		PW <input type="password" name="pw">
		<button>Login</button>
	</form>
	<form action="../MemberAgree.jsp">
		<button>Join</button>
	</form>
</body>
</html>