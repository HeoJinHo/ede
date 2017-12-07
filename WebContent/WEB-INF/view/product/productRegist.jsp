<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#savebutton").click(function() {
			$("#frm").submit();
		});
	})
</script>
</head>
<body>
<form action="./productRegist.product" method="post">
	<p><input type="text" name="brand"><p>
	<p><input type="text" name="pro_name"><p>
	<p><input type="text" name="pro_price"><p>
	<p><input type="text" name="capacity"><p>
	<p><input type="text" name="info"><p>
	<input type="button" value="write" id="savebutton">
</form>
</body>
</html>