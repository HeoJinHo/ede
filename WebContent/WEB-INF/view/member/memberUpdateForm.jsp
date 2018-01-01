<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#id{
	border: 0px;
	}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#nn").click(function(){
			 window.open("../MemberAddrsearch2.jsp", "", "top=300, left=750, width=400, height=400");
		});
		
	});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<h1>Update ${member2}</h1>
	<form action="./memberUpdate.member" method="post" name="frm2">
		아이디 : <input type="text" name="id" readonly="readonly" value="${member.id}" id="id"><br><br>
		비밀번호 : <input type="password" name="pw" value="${member.pw}"><br><br>
		이름 : <input type="text" name="name" value="${member.name}"><br><br>
		닉네임 : <input type="text" name="nickname" value="${member.nickname}"><br><br>
		생년월일 : <input type="date" name="birth" value="${member.birth}"><br><br>
		<c:if test = "${sessionScope.member.gender eq 'M'}">
		성별 : F <input type="radio" name="gender" value="F"> M <input type="radio" name="gender" checked="checked" value="M"><br><br>
		</c:if>
		
		<c:if test = "${sessionScope.member.gender eq 'F'}">
		성별 : F <input type="radio" name="gender" value="F" checked="checked"> M <input type="radio" name="gender" value="M"><br>
		</c:if>		
		
		<c:if test = "${sessionScope.member.skin eq 'dry'}">
		피부타입 : 건성<input type="radio" name="skin" checked="checked" value="dry">중성<input type="radio" name="skin" value="neutral"><br>
		           지성<input type="radio" name="skin" value="oily">민감성<input type="radio" name="skin" value="complex"> 복합성<input type="radio" name="skin" value="sensitive">
		</c:if>	
		<c:if test = "${sessionScope.member.skin eq 'neutral'}">
		피부타입 : 건성<input type="radio" name="skin" value="dry">중성<input type="radio" name="skin" checked="checked" value="neutral"><br>
		           지성<input type="radio" name="skin" value="oily">민감성<input type="radio" name="skin" value="complex"> 복합성<input type="radio" name="skin" value="sensitive">
		</c:if>
		<c:if test = "${sessionScope.member.skin eq 'oily'}">
		피부타입 : 건성<input type="radio" name="skin" value="dry">중성<input type="radio" name="skin" value="neutral"><br>
		           지성<input type="radio" name="skin" checked="checked" value="oily">민감성<input type="radio" name="skin" value="complex"> 복합성<input type="radio" name="skin" value="sensitive">
		</c:if>	
		<c:if test = "${sessionScope.member.skin eq 'complex'}">
		피부타입 : 건성<input type="radio" name="skin" value="dry">중성<input type="radio" name="skin" value="neutral"><br>
		           지성<input type="radio" name="skin" value="oily">민감성<input type="radio" name="skin" checked="checked" value="complex"> 복합성<input type="radio" name="skin" value="sensitive">ㄴㅁㅇ
		</c:if>	
		<c:if test = "${sessionScope.member.skin eq 'sensitive'}">
		피부타입 : 건성<input type="radio" name="skin" value="dry">중성<input type="radio" name="skin" value="neutral"><br>
		           지성<input type="radio" name="skin" value="oily">민감성<input type="radio" name="skin" value="complex"> 복합성<input type="radio" name="skin" checked="checked" value="sensitive">
		</c:if><br><br>
		
		
		주소 : <input type="text" name="addr" value="${member.addr}"> - <input type="button" value="우편번호 찾기" id="nn"><br>
			 <input type="text" name="addr2" value="${member.addr2}"><br>
		핸드폰번호 : <input type="text" name="phone" value="${member.phone}"><br><br>
		이메일 : <input type="email" name="email" value="${member.email}"><br><br>
		<input type="submit" value="회원정보 수정" id="btn">
	</form>
	
</body>
</html>
