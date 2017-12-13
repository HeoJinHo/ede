<%@page import="com.ede.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	MemberDAO memberDAO = new MemberDAO();
	boolean check = memberDAO.idCheck(id);
	String s=id +" 는 사용 가능 합니다.";
	if(!check){
		s=id +" 는 중복된 ID 입니다";
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload=function(){
		var btn = document.getElementById("btn");
		btn.addEventListener("click", function(){
		window.opener.document.frm.id.value='<%=id%>';
		window.opener.document.frm.idCheck.value="1";
		window.self.close();
		});
	}
</script>
</head>
<body>
	<h1>ID Check</h1>
	<form action="MemberIdCheck.jsp">
		<input type="text" name="id">
		<button>중복확인</button>
	</form>
	<h3><%= s %></h3>
	<%if(check){ %>
		<button id="btn">사용하기</button>
	<%} %>
</body>
</html>