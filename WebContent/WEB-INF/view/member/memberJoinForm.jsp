<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#nn").click(function(){
			 window.open("../MemberAddrsearch.jsp", "", "top=300, left=750, width=400, height=400");
		});
		$("#check").click(function(){
			var id = document.frm.id.value;
			window.open("../MemberIdCheck.jsp?id="+id, "", "top=300, left=750, width=400, height=400");
		});
	});
</script>
</head>
<body>

	<h1>Member Join</h1>
	<form action="./memberJoin.member" method="post" name="frm">
	<p>아이디: <input type="text" name="id" id="id"><input type="button" id="check" value="중복확인">	</p>
	<p>비밀번호: <input type="password" name="pw"></p>
	<p>비밀번호 확인 : <input type="password"></p>
	<p>이름: <input type="text" name="name"></p>
	<p>닉네임:<input type="text" name="nickname"></p>
	<p>이메일: <input type="email" name="email"></p>
	<p>핸 드 폰번호  <input type="text" name="phone"></p>
	<p>성별: F <input type="radio" checked="checked" name="gender" value="F">
	   M <input type="radio" name="gender" value="M"></p>
	<p>생년월일:<input type="date" name="birth"></p>
	<p>피부타입: 건성 <input type="radio" name="skin" value="dry"> 중성 <input type="radio" name="skin" value="neutral"><br>
			     지성 <input type="radio" name="skin" value="oily"> 민감성 <input type="radio" name="skin" value="complex"> 복합성 <input type="radio" name="skin" value="sensitive">
	</p>
	<p>주소:<input type="text" name="addr"><input type="button" value="addr" id="nn"></p>
	<input type="submit" value="Join" id="btn">
	</form>	
</body>
</html>