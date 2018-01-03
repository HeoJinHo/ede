<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPage</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
</head>
<body>
<%@ include file="../temp/header.jsp" %>

	<section id="join_div">
	<table class="table table-condensed join_table">
				<tr class="join_tr">
					<td class="join_td">
					아이디
					</td>
					<td class="join_th">
					${sessionScope.member.id}
					</td>
				</tr>
					
				<tr class="join_tr">
					<td class="join_td">
					이 름
					</td>
					<td class="join_th">
					${sessionScope.member.name}
					</td>
				</tr>
				
				<tr class="join_tr">
					<td class="join_td">
					닉네임
					</td>
					<td class="join_th">
					${sessionScope.member.nickname}
					</td>
				</tr>
				
				<tr class="join_tr">
					<td class="join_td">
					이메일
					</td>
					<td class="join_th">
					${sessionScope.member.email}
					</td>
				</tr>	
				
				<tr class="join_tr">
					<td class="join_td">
					핸드폰 번호
					</td>
					<td class="join_th">
					${sessionScope.member.phone}
					</td>
				</tr>
				
				<tr class="join_tr">
					<td class="join_td">
					성별
					</td>
					<td class="join_th">
					${sessionScope.member.gender}
					</td>
				</tr>
				
				<tr class="join_tr">
					<td class="join_td">
					피부타입
					</td>
					<td class="join_th">
					${sessionScope.member.skin}
					</td>
				</tr>
				
				<tr class="join_tr">
					<td class="join_td">
					생년월일
					</td>
					<td class="join_th">
					${sessionScope.member.birth}
					</td>
				</tr>
				
				<tr class="join_tr">
					<td class="join_td"  id="table_end">
					주 소
					</td>
					<td class="join_th" id="table_end">
					${sessionScope.member.addr} ${sessionScope.member.addr2}
					</td>
				</tr>
		</table>
	<form action="./memberUpdate.member" method="get">
		<button style="float: right;" class="btn btn-default">회원정보 변경</button>
	</form>
	<form action="./memberDelete.member">
		<button class="btn btn-default">회원 탈퇴</button>
	</form>
	</section>
	
	

</body>
</html>





