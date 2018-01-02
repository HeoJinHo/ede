<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="js/bootstrap.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#nn").click(function() {
			var addr = document.frm.addr.value;
			window.open("../MemberAddrsearch.jsp", "", "top=300, left=750, width=400, height=400");
		});
		$("#check").click(function() {
			var id = document.frm.id.value;
			window.open("../MemberIdCheck.jsp?id=" + id, "", "top=300, left=750, width=400, height=400");
		});
		$("#btn").click(function() {
			if ($("#id").val() && $("#pw").val() && $("#pw2").val() && $("#name").val() && $("#nickname").val() && $("#email").val() && $("#phone").val() && $("#gender").val() && $("#birth").val() && $("#skin").val() && $("#addr").val().length > 0) {
				frm.submit();
				alert("회원가입 완료")
			} else {
				alert("필수입력사항을 입력해주세요")
			}
		});
		$("#pw").keyup(function() {
			if ($("#pw").val().length > 7) {
				$("#pwcheck").text("사용가능한 비밀번호 입니다");
			} else {
				$("#pwcheck").text("비밀번호는 8자리 이상이여야 합니다");
			}

		});
		$("#pw2").keyup(function() {
			if ($("#pw").val() == $("#pw2").val()) {
				$("#pwcheck2").text("비밀번호가 일치합니다");
			} else {
				$("#pwcheck2").text("비밀번호가 일치 하지 않습니다");
			}
		});
	});
	

</script>
</head>
<body>

	<%@ include file="../temp/header.jsp"%>
	
	<section id="join_div">
		<div id="member_tab">
		<h5 id="member1">약관동의</h5>
		</div>
		
		<div id="member_tab2">
		<h5 id="member2">회원가입</h5>
		</div>
		<div id="member_tab3">
		<h5 id="member3">가입인증</h5>
		</div>
		<form action="./memberJoin.member" method="post" name="frm">
			<table class="join_table table table-condensed">
				<tr class="join_tr">
					<td class="join_td">
						<input type="hidden" name="idCheck" value="0" >
						아이디
					</td>
				<td class="join_th">
					<input type="text" name="id" id="id" placeholder="Enter ID"  class="join_in">
					<input type="button" id="check" value="중복확인" class="btn btn-default">
				</td>
				</tr>
			
			<tr class="join_tr">
				<td class="join_td">
					비밀번호
				</td>
				
				<td class="join_th">
					<input type="password" name="pw" placeholder="Enter PW" id="pw" class="join_in">
					<p id="pwcheck"></p>
				</td>
			</tr>
			
			<tr class="join_tr">
				<td class="join_td">
					 비밀번호 확인 
				</td>
			
				<td class="join_th">
					 <input type="password" placeholder="Enter PW" id="pw2" class="join_in">
					 <p id="pwcheck2"></p>
				<td>
			</tr>
			
			<tr class="join_tr">
				<td class="join_td">
					이름
				</td>
				
				<td class="join_th">
					<input type="text" name="name" placeholder="Enter Name" id="name"  class="join_in">
				</td>
			</tr>
			
			<tr class="join_tr">
				<td class="join_td">
					닉네임
				</td>
				
				<td class="join_th">
					<input type="text" name="nickname" placeholder="Enter Nick Name" id="nickname" class="join_in">
				</td>
			</tr>	
			
			<tr class="join_tr">
				<td class="join_td">
					이메일
				</td>
			
				<td class="join_th">
					<input type="email" name="email" placeholder="Enter Email" id="email" class="join_in">
				</td>
			</tr>	
			
			<tr class="join_tr">
				<td class="join_td">
					핸드폰
				</td>
			
				<td class="join_th">
					<input type="text" name="phone" placeholder="Enter Phone Number" id="phone" class="join_in">
				</td>
			</tr>
			
			<tr class="join_tr">
				<td class="join_td">
					성별 
				</td>
				
				<td class="join_th">
					  여자 <input type="radio"  name="gender" value="F" id="gender">
					 남자 <input type="radio" name="gender" value="M" id="gender">
				</td>
			</tr>
				 
			<tr class="join_tr">
				<td class="join_td">
					생년월일
				</td>
			
				<td class="join_th">
					<input type="date" name="birth" id="birth" class="form-control join_in">
				</td>
			</tr>
				
		
			<tr class="join_tr">
				<td class="join_td">
					피부타입
				</td>
				
				<td class="join_th">
					 건성 <input type="radio" name="skin" value="dry" id="skin">
					중성 <input type="radio" name="skin" value="neutral" id="skin">
					지성 <input type="radio" name="skin" value="oily" id="skin">
					민감성 <input type="radio" name="skin" value="complex" id="skin">
					복합성 <input type="radio" name="skin" value="sensitive" id="skin">
				</td>
			</tr>
				
			<tr class="join_tr">
				<td class="join_td">
					주소
				</td>
				
				<td class="join_th">
					<input type="text" name="addr4" placeholder="우변번호" id="addr4" class="join_in"> - <input type="button" value="우편번호 찾기" id="nn" class="btn btn-default">
				</td>
			</tr>
			
			<tr class="join_tr">
				<td class="join_td">
				</td>
				
				<td class="join_th">
					<input type="text" placeholder="도로명주소" name="addr" id="addr" class="join_in">
				</td>
			</tr>	
				
			<tr class="join_tr">
				<td class="join_td">
				</td>	
				
				<td class="join_th">
					<input type="text" placeholder="나머지주소" name="addr2" id="addr2" class="join_in">
				</td>	
			</tr>
			</table>
		</form>
		<button id="btn" class="btn btn-default">Join</button>
		<form action="../index.jsp">
			<button class="btn btn-default">회원가입 취소</button>
		</form>
</section>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>