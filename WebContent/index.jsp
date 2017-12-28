<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 홈페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<link href="./css/main.css" rel="stylesheet">
</head>
<body>

	<%@ include file="./WEB-INF/view/temp/header.jsp"%>

	<!-- main 시작 -->
	<section id="main">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="<%=request.getContextPath()%>/images/main/main_1.png"
						alt="glowpick" width="1200" height="250">
					<div class="carousel-caption">
						<h3>화질이 구려요</h3>
						<p>사진은 좋은걸로 바꿉시다!!!! -수인-</p>
					</div>
				</div>

				<div class="item">
					<img src="<%=request.getContextPath()%>/images/main/main_2.png"
						alt="glowpick" width="1200" height="250">
				</div>

				<div class="item">
					<img src="<%=request.getContextPath()%>/images/main/main_3.png"
						alt="glowpick" width="1200" height="250">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div class="main_contents">
			<img src="<%=request.getContextPath()%>/images/main/main_contents.png">
			<img src="<%=request.getContextPath()%>/images/main/main_contents2.png">
		</div>

	</section>
	<!-- main 끝   -->
	<%@ include file="./WEB-INF/view/temp/footer.jsp"%>


</body>
</html>