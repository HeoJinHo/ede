<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#nn").click(function(){
			 window.open("./addrsearch.jsp", "", "top=300, left=750, width=400, height=400");
		});
	});
</script>
</head>
<body>

	<h1>Member Join</h1>
	<form action="./memberJoin.member" method="post">
	<p>ID : <input type="text" name="id"></p>
	<p>PW : <input type="password" name="pw"></p>
	<p>PW : <input type="password"></p>
	<p>Addr : <input type="text" name="addr"><input type="button" value="addr" id="nn"></p>
	<p>Phone : <input type="text" name="phone"></p>
	<p>NickName : <input type="text" name="nickname"></p>
	<p>Name : <input type="text" name="name"></p>
	<p>Birth : <input type="date" name="birth"></p>
	<p>Gender : F <input type="radio" checked="checked" name="gender" value="F">
	   M <input type="radio" name="gender" value="M"></p>
	   
	<input type="button" value="Join">
	</form>
</body>
</html>