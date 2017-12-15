<%@page import="com.ede.files.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ede.files.FileDAO"%>
<%@page import="com.ede.qna.QnaDTO"%>
<%@page import="com.ede.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
 	int num = Integer.parseInt(request.getParameter("num"));
	FileDAO fileDAO = new FileDAO();
	ArrayList<FileDTO> ar = fileDAO.selectList(num);	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>${board}View</h1>
	<h3>NUM : ${view.num}</h3>
	<h3>TITLE : ${view.title}</h3>
	<h3>WRITER : ${view.writer}</h3>
	<h3>CONTENTS : ${view.contents}</h3>
	<% for(int i=0;i<ar.size();i++){ %>
		<%if (ar.get(i).getfName()!=null && ar.get(i).getoName()!=null){ %>
		<div>
			<p>
				<a href="../upload/<%= ar.get(i).getfName()%>"><%= ar.get(i).getoName() %></a>
			</p>
		</div>
			<%} %>
	<%} %>

	<a href="${board}Delete.${board}?num=${view.num}">Delete</a>
	<a href="${board}Update.${board}?num=${view.num}">Update</a>
	<% if(request.getAttribute("board").equals("qna")||request.getAttribute("board").equals("help")){%>
		<a href="${board}Reply.${board}?num=${view.num}">Reply</a>
	<%} %>

</body>
</html>