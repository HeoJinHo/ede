<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Delete</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="../css/header.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			if($("#pw2").val()==$("#pw").val()){
				form.submit();
				
			}else if($("#pw2").val()==""){
				alert("비밀번호를 입력해주세요");
				
			}else if($("#pw2").val() != $("#pw").val()){
				alert("비밀번호가 틀렸습니다");
			}
				
		});
	});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<h1>Member Delete</h1>
	<form action="./memberDelete.member" method="post" name="form">
		<p><input type="radio" name="delete" value="상품품질 불만">상품품질 불만 <input type="radio" name="delete" value="교환/환불 불만">교환/환불 불만 <input type="radio" name="delete" value="A/S 불만">A/S 불만  <input type="radio" name="delete" value="이용빈도 낮음">이용빈도 낮음<br>
		<input type="radio" name="delete" value="개인정보유출 우려">개인정보유출 우려 <input type="radio" name="delete" value="배송지연">배송지연  <input type="radio" name="delete" value="기타">기타</p>
		<p>사유 : <textarea rows="10" cols="80" name="delete2"></textarea> </p>
		<p>아이디 : <input type="text" name="id" readonly="readonly" value="${member.id}" id="id"></p><br><br>
		<p><input type="hidden" value="${member.pw}" id="pw"></p>
		<p>비밀번호 : <input type="password" id="pw2"></p>
		</form>
		<button id="btn">회원탈퇴</button>
</body>
</html>