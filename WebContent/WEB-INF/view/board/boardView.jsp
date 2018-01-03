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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/boardView.css" rel="stylesheet">

</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<h2 id="tt">${title}</h2>
	<div class="container">
		<table class="table view">
			<thead>
				<tr class="head" >
					<td class="td_title">TITLE</td>
					<td>WRITER</td>
					<td>DATE</td>
					<td>HIT</td>
				</tr>
			</thead>
			<tbody>
				<tr class="head">
					<td class="td_title">${view.title}</td>
					<td>${view.writer}</td>
					<td>${view.reg_date}</td>
					<td>${view.hit}</td>
				</tr>
				<tr class="contents">
					<td colspan="4" class="ct"><br>${view.contents}
					<% for(int i=0;i<ar.size();i++){ %>
						<%if (ar.get(i).getfName()!=null && ar.get(i).getoName()!=null){ %>
						<div>
							<p>
								<a href="../upload/<%= ar.get(i).getfName()%>"><%= ar.get(i).getoName() %></a>
							</p>
						</div>
						<%} %>
					<%} %>
					</td>
				</tr>
			</tbody>
		</table>		
		<a class="btn btn-default list" href="${board}List.${board}?num=${view.num}">List</a>
		<a class="btn btn-default delete" href="${board}Delete.${board}?num=${view.num}">Delete</a>
		<a class="btn btn-default update" href="${board}Update.${board}?num=${view.num}">Update</a>
		<% if(request.getAttribute("board").equals("qna")||request.getAttribute("board").equals("help")){%>
			<a class="btn btn-default reply" href="${board}Reply.${board}?num=${view.num}">Reply</a>
		<%} %>

	</div>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>