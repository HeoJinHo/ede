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
			var addr = document.frm.addr.value;
			 window.open("../MemberAddrsearch.jsp", "", "top=300, left=750, width=400, height=400");
		});
		$("#check").click(function(){
			var id = document.frm.id.value;
			window.open("../MemberIdCheck.jsp?id="+id, "", "top=300, left=750, width=400, height=400");
		});
		$("#btn").click(function(){
			if($("#id").val() && $("#pw").val() && $("#pw2").val() && $("#name").val() && $("#nickname").val() && $("#email").val() && $("#phone").val() && $("#gender").val() && $("#birth").val() && $("#skin").val() && $("#addr").val().length>0){
			frm.submit();
			alert("회원가입 완료")
			}else{
			alert("필수입력사항을 입력해주세요")	
			}
		});
		$("#pw").keyup(function(){
			if($("#pw").val().length>7){
				$("#pwcheck").text("사용가능한 비밀번호 입니다");
			}else{
				$("#pwcheck").text("비밀번호는 8자리 이상이여야 합니다");
			}
			
		});
		$("#pw2").keyup(function(){
			if ($("#pw").val()==$("#pw2").val()){
				$("#pwcheck2").text("비밀번호가 일치합니다");
			}else{
				$("#pwcheck2").text("비밀번호가 일치 하지 않습니다");
			}
		});
	});
</script>
</head>
<body>

	<h1>Member Join</h1>
	<form action="./memberJoin.member" method="post" name="frm">
	<input type="hidden" name="idCheck" value="0">
	<p>아이디: <input type="text" name="id" id="id" placeholder="Enter ID"><input type="button" id="check" value="중복확인">	</p>
	<p>비밀번호: <input type="password" name="pw" placeholder="Enter PW" id="pw"></p>
	<p id="pwcheck"></p>
	<p>비밀번호 확인 : <input type="password" placeholder="Enter PW" id="pw2"></p>
	<p id="pwcheck2"></p>
	<p>이름: <input type="text" name="name" placeholder="Enter Name" id="name"></p>
	<p>닉네임:<input type="text" name="nickname" placeholder="Enter Nick Name" id="nickname"></p>
	<p>이메일: <input type="email" name="email" placeholder="Enter Email" id="email"></p>
	<p>핸 드 폰번호  <input type="text" name="phone" placeholder="Enter Phone Number" id="phone"></p>
	<p>성별: F <input type="radio" checked="checked" name="gender" value="F" id="gender">
	   M <input type="radio" name="gender" value="M" id="gender"></p>
	<p>생년월일:<input type="date" name="birth" id="birth"></p>
	<p>피부타입: 건성 <input type="radio" name="skin" value="dry" id="skin"> 중성 <input type="radio" name="skin" value="neutral" id="skin"><br>
			     지성 <input type="radio" name="skin" value="oily" id="skin"> 민감성 <input type="radio" name="skin" value="complex" id="skin"> 복합성 <input type="radio" name="skin" value="sensitive" id="skin">
	</p>
	<p>주소:<input type="text" name="addr4" placeholder="우변번호" id="addr4"> - <input type="button" value="우편번호 찾기" id="nn"></p>
		  <p><input type="text" placeholder="도로명주소" name="addr" id="addr"></p>
		   <p><input type="text" placeholder="나머지주소" name="addr2" id="addr2"></p>
	</form>	
	<button id="btn">Join</button><a href="../index.jsp">회원가입 취소</a>
</body>
</html>