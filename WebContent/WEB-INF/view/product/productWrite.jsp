<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="./productWrite.product" method="post">
	<p>contents<input type="text" name="contents"></p>
	<p>report<input type="text" name="report"></p>
	<p>grade<input type="text" name="grade"></p>
	<input type="hidden" name="pro_num" value="${pro_num}">
	
	<button>write</button>
	</form>

</body>
</html>