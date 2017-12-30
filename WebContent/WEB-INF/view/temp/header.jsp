<%@page import="com.ede.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Header 시작 -->
<body>
	<header>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="glowpick">
					<ul>
						<li id="gp"><a id="glowpick"
							href="<%=request.getContextPath()%>/index.jsp">GLOWPICK</a></li>
					</ul>
				</div>
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="navbar-brand"></div>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<div class="bar-right">
						<ul class="nav navbar-nav navbar-right">
							<c:if test="${empty member}">
								<li><a data-toggle="modal" data-target="#myModal">Login/Join</a></li>
								<li><a href="<%=request.getContextPath()%>/notice/noticeList.notice">고객센터</a></li>
							</c:if>
							<c:if test="${not empty member}">
								<li><a href="<%=request.getContextPath()%>/member/memberLogout.member">Logout</a></li>
								<li><a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a></li>
								<li><a href="<%=request.getContextPath()%>/notice/noticeList.notice">고객센터</a></li>
							</c:if>
						</ul>
					</div>
					<ul class="nav navbar-nav navbar-center">
						<li><a href="<%=request.getContextPath()%>/index.jsp">Home</a></li>

						<li class="dropdown">
      						<a class="dropbtn" href="<%=request.getContextPath()%>/product/mainList.product?del=category">Product
      						<span class="caret"></span></a>
      						<ul class="dropdown-content" id="dropdown-menu">
        						<li><a href="<%=request.getContextPath()%>/product/mainList.product?del=category">Category</a></li>
								<li><a href="<%=request.getContextPath()%>/product/mainList.product?del=brand">Brand</a></li>
      						</ul>
     					</li>
						<li><a href="#">전문가</a></li>
						<li><a href="#">Event</a></li>
						<li><a href="<%=request.getContextPath()%>/meet/meetList.meet">모임</a></li>
					</ul>
            </div>
         </div>
      </nav>
      <div class="modal fade" id="myModal" role="dialog">
         <div class="modal-dialog">


            <!-- Modal content-->
            <div class="modal-content" id="modal" style="background-color: #333; margin-top: 45%">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                  <h4 class="modal-title" style="color: white; text-align: center; float: center;">로그인</h4>
               </div>
               <div class="modal-body">
                  <form action="<%=request.getContextPath()%>/member/memberLogin.member" method="post">
                     <input type="text" name="id" placeholder="User ID" class="form-control" style="width: 50%; display: block; margin-left: auto; margin-right: auto;"><br>
                     <input type="password" name="pw" placeholder="User PassWord" class="form-control" style="width: 50%; display: block; margin-left: auto; margin-right: auto;"><br><br>
                     <button class="btn" style="background-color: #74c200; width: 30%; display: block; margin-left: auto; margin-right: auto; color: white;">로그인</button>
                  </form>
                  <div class="modal-footer">
                  <h4 class="modal-title" style="color: white; text-align: center; float: center;">아직 회원이 아니신가요?</h4>
               </div>
                  <form action="./MemberAgree.jsp">
                     <button class="btn" id="join" style="background-color: #b3b3b3; width: 45%; display: block; margin-left: auto; margin-right: auto; color: white;">회원가입</button>
                  </form>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
               </div>
            </div>

         </div>
      </div>
   </header>