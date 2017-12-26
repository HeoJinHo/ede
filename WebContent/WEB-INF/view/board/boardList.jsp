<%@page import="com.ede.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% MemberDTO memberDTO=(MemberDTO)request.getSession().getAttribute("member");
   String id = memberDTO.getId();
   
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/boardList.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		
		var kind='${make.kind}';
		$(".kind").each(function(){
			if($(this).val()==kind){
				$(this).attr("selected", true);
			}
		});
		
		
		
		$(".list").click(function(){
			var cur = $(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.submit();
		});
	});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>


	<nav class="navbar navbar-inverse top">
		<div class="container-fluid top">

			<ul class="nav navbar-nav">
				<li class="active" >
					<a href="<%=request.getContextPath()%>/notice/noticeList.notice">NOTICE</a>
				</li>
				<li class="active"><a href="<%=request.getContextPath()%>/qna/qnaList.qna">QNA</a></li>
				<li class="active"><a href="<%=request.getContextPath()%>/help/helpList.help">1:1
						문의</a></li>
			</ul>
			<form name="frm" class="navbar-form navbar-left" action="./${board}List.${board}">
				<input type="hidden" name="curPage">
					<select name="kind">
						<option class="kind" value="title">TITLE</option>
						<option class="kind" value="writer">WRITER</option>
						<option class="kind" value="contents">CONTENTS</option>
					</select> 
				<div class="input-group">
					<input type="text" name="search" class="form-control" placeholder="Search" value="${make.search}">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</nav>

<div class="container">
  <h2>${title}</h2><br>
	<table class="table table-hover">
		<thead>
			<tr style="border-bottom: 2px solid black;">
				<td>NUM</td>
				<td>TITLE</td>
				<td>WRITER</td>
				<td>DATE</td>
				<td>HIT</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="i">
				<tr>
					<td>${i.num}</td>
					<td><c:catch>
							<c:if test="${i.depth eq 1}">
						--[${i.ref}번의 답변]
					</c:if>
							<c:if test="${i.depth gt 1}">
								<c:forEach begin="1" end="${i.depth}">--</c:forEach>
						[${i.ref}번의 추가답변]
					</c:if>
						</c:catch> <a href="./${board}View.${board}?num=${i.num}">${i.title}</a></td>
					<td>${i.writer}</td>
					<td>${i.reg_date}</td>
					<td>${i.hit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<c:if test="${page.curBlock gt 1}">
		<input type="button" class="btn btn-default" title="${page.startNum-1}"
			value="&#8249;">
	</c:if>

	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
		<input type="button" class="btn btn-primary" title="${i}" value="${i}">
	</c:forEach>

	<c:if test="${page.curBlock lt page.totalBlock}">
		<input type="button" class="btn btn-default" title="${page.lastNum+1}"
			value="&#8250;">
	</c:if>
	<a href="./${board}Write.${board}">Write</a>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>






