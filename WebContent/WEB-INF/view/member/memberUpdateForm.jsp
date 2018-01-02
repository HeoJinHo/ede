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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="js/bootstrap.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	<section id="join_div">
	<h4>회원정보 수정</h4>
	<form action="./memberUpdate.member" method="post" name="frm2">
	<table class="join_table table table-condensed">
	<tr class="join_tr">
		<td class="join_td">
			아이디
		</td>
		<td class="join_th">
			<input type="text" name="id" readonly="readonly" value="${member.id}" id="id" class="join_in" style="width: 40%;">
		</td>
	</tr>
	
	<tr class="join_tr">
		<td class="join_td">
			비밀번호
		</td>
		<td class="join_th">
			<input type="password" name="pw" value="${member.pw}" class="join_in" style="width: 40%;">
		</td>
	</tr>
	
	<tr class="join_tr">
		<td class="join_td">	
			이름
		</td>
		<td class="join_th">
			<input type="text" name="name" value="${member.name}" class="join_in" style="width: 40%;">
		</td>
	</tr>
	
	<tr class="join_tr">
		<td class="join_td">	
			닉네임
		</td>
		<td class="join_th">
			<input type="text" name="nickname" value="${member.nickname}" class="join_in" style="width: 40%;">
		</td>
	</tr>
	
	<tr class="join_tr">
		<td class="join_td">	
			생년월일
		</td>
		<td class="join_th">
			<input type="date" name="birth" value="${member.birth}" class="form-control join_in" style="width: 40%;">
		</td>
	</tr>
	
	
		<c:if test = "${sessionScope.member.gender eq 'M'}">
	<tr class="join_tr">
		<td class="join_td">		
		성별 
		</td>
		<td class="join_th">		
		여자 <input type="radio" name="gender" value="F"> 남자 <input type="radio" name="gender" checked="checked" value="M">
		</td>
	</tr>
		</c:if>
		
		<c:if test = "${sessionScope.member.gender eq 'F'}">
	<tr class="join_tr">
		<td class="join_td">		
		성별 
		</td>
		<td class="join_th">
		여자 <input type="radio" name="gender" value="F" checked="checked"> 남자 <input type="radio" name="gender" value="M">
		</td>
	</tr>
		</c:if>		
		
		<c:if test = "${sessionScope.member.skin eq 'dry'}">
	<tr class="join_tr">
		<td class="join_td">		
		피부타입 
		</td>
		<td class="join_th">
		건성<input type="radio" name="skin" checked="checked" value="dry">중성<input type="radio" name="skin" value="neutral">
		지성<input type="radio" name="skin" value="oily">민감성<input type="radio" name="skin" value="complex"> 복합성<input type="radio" name="skin" value="sensitive">
		</td>
	</tr>
		</c:if>	
		
		<c:if test = "${sessionScope.member.skin eq 'neutral'}">
	<tr class="join_tr">
		<td class="join_td">			
		피부타입
		</td>
		<td class="join_th">
		건성<input type="radio" name="skin" value="dry">중성<input type="radio" name="skin" checked="checked" value="neutral">
		지성<input type="radio" name="skin" value="oily">민감성<input type="radio" name="skin" value="complex"> 복합성<input type="radio" name="skin" value="sensitive">
		</td>
	</tr>
		</c:if>
		
		<c:if test = "${sessionScope.member.skin eq 'oily'}">
	<tr class="join_tr">
		<td class="join_td">		
		피부타입
		</td>
		<td class="join_th">
		건성<input type="radio" name="skin" value="dry">중성<input type="radio" name="skin" value="neutral">
		 지성<input type="radio" name="skin" checked="checked" value="oily">민감성<input type="radio" name="skin" value="complex"> 복합성<input type="radio" name="skin" value="sensitive">
		</td>
	</tr>
		</c:if>	
		
		<c:if test = "${sessionScope.member.skin eq 'complex'}">
	<tr class="join_tr">
		<td class="join_td">			
		피부타입
		</td>
		<td class="join_th">
		건성<input type="radio" name="skin" value="dry">중성<input type="radio" name="skin" value="neutral">
		 지성<input type="radio" name="skin" value="oily">민감성<input type="radio" name="skin" checked="checked" value="complex"> 복합성<input type="radio" name="skin" value="sensitive">ㄴㅁㅇ
		</td>
	</tr>
		</c:if>	
		
		<c:if test = "${sessionScope.member.skin eq 'sensitive'}">
	<tr class="join_tr">
		<td class="join_td">			
		피부타입
		</td>
		<td class="join_th">
		건성<input type="radio" name="skin" value="dry">중성<input type="radio" name="skin" value="neutral">
		지성<input type="radio" name="skin" value="oily">민감성<input type="radio" name="skin" value="complex"> 복합성<input type="radio" name="skin" checked="checked" value="sensitive">
		</td>
	</tr>
		</c:if>
		
	<tr class="join_tr">
		<td class="join_td">		
		주소
		</td>
		<td class="join_th">		
		<input type="text" name="addr" value="${member.addr}" class="join_in" style="width: 40%;"> - <input type="button" value="우편번호 찾기" id="nn" class="btn btn-default">
		</td>
	</tr>
	
	<tr class="join_tr">
		<td class="join_td">
		</td>
		<td class="join_th">	
			 <input type="text" name="addr2" value="${member.addr2}" class="join_in" style="width: 56%;">
		</td>
	</tr>
		
	<tr class="join_tr">
		<td class="join_td">
		핸드폰번호
		</td>
		<td class="join_th">
		<input type="text" name="phone" value="${member.phone}" class="join_in" style="width: 40%;">
		</td>
	</tr>
	
	<tr class="join_tr">
		<td class="join_td">		
		이메일
		</td>
		<td class="join_th">		
		<input type="email" name="email" value="${member.email}" class="join_in" style="width: 40%;">
		</td>
	</tr>
	</table>
		<input type="submit" value="회원정보 수정" id="btn" class="btn btn-default">
	</form>
	</section>
	
</body>
</html>
