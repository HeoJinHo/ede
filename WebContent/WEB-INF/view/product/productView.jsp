<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
div{
	border : 1px solid red;
}
.blog-inner{
	border-color: blue;
	width : 70%;
}
</style>
<script type="text/javascript">

$(function(){
	// blog 글 1~10
	$("#blog-btn").click(function(){
		var query = $("#name").text();
		$.get("./productViewBlog.product?query="+query+"&start=1&display=10", function(data){
			var result = JSON.parse(data);
			alert(data);
			$("#blog-info").text("BLOG 검색결과 총 "+result.total+" 개");
			for(var i = 0;i<10;i++){
				$("#blog-info").append("<div class='blog-inner'></div>");
				var title = $("<p></p>").html("<b style='color:blue'>title</b> "+result.items[i].title);
				var description = $("<p></p>").html(result.items[i].description);
				var link = $("<p></p>").html("<b style='color:blue'>link</b> "+result.items[i].link);
				var bloggername = $("<p></p>").html("<b style='color:blue'>blog by</b> "+result.items[i].bloggername);
				var postdate = $("<p></p>").html("<b style='color:blue'>date</b> "+result.items[i].postdate);
				$(".blog-inner:last-child").append(title, description, link, bloggername, postdate);
				$("#blog-more").show(); // blog-btn을 누르면 더보기 버튼 나타남
			}
		});
	});
	
	// blog 글 11번 ~ : 더보기 버튼 function
	$("#blog-more").click(function(){
		var query = $("#name").text();
		var start = $(".blog-inner").length + 1; // .blog-inner의 갯수를 읽어옴
		//alert(start);  -> 10 출력
		$.get("./productViewBlog.product?query="+query+"&start="+start+"1&display=10", function(data){
			var result = JSON.parse(data);
			alert(data);
			for(var i = 0;i<10;i++){
				$("#blog-info").append("<div class='blog-inner'></div>");
				var title = $("<p></p>").html("<b style='color:blue'>title</b> "+result.items[i].title);
				var description = $("<p></p>").html(result.items[i].description);
				var link = $("<p></p>").html("<b style='color:blue'>link</b> "+result.items[i].link);
				var bloggername = $("<p></p>").html("<b style='color:blue'>blog by</b> "+result.items[i].bloggername);
				var postdate = $("<p></p>").html(result.items[i].postdate);
				$(".blog-inner:last-child").append(title, description, link, bloggername, postdate);
			}
		});
	});
	
});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>

<div class="container" style="width : 70%">
	<div class="text-center">
		<img src="${list.pic_realName}">
		<h3>${list.brand}</h3>
		<h2 id="name"><b>${list.pro_name}</b></h2>
		<p>${list.pro_price}원</p>
		<p>${list.capacity}ml</p>
		<p>${list.info}</p>
		<div>
			<p>평균 ${list.avg}</p>
			<p>최악 ${list.grade1}</p>
			<p>별로 ${list.grade2}</p>
			<p>쏘쏘 ${list.grade3}</p>
			<p>굿굿 ${list.grade4}</p>
			<p>짱짱 ${list.grade5}</p>
			<p>${list.evt}</p>
		</div>
	</div>
	<!-- ajax로 바꿔야함 -->
	<div>
		<form class="form-horizontal" action="./productWrite.product" method="post">
			<div>
				<input type="hidden" name="pro_num" value="${list.pro_num}">
	      			<label for="content">content:</label>
	      			<textarea class="form-control" rows="2" id="content" style="width:100%"></textarea>
	      			<label for="report">Report:</label>
	      			<textarea class="form-control" rows="5" id="report" style="width:100%"></textarea>
			</div>
			<div class="text-center" style="width:50%">
				<div class="radio radio-inline"></div>
				<label>grade:</label>
				<div class="radio radio-inline">
				  	<label><input type="radio" name="grade">최악</label>
				</div>
				<div class="radio radio-inline">
				  	<label><input type="radio" name="grade">별로</label>
				</div>
				<div class="radio radio-inline">
				  	<label><input type="radio" name="grade">쏘쏘</label>
				</div>
				<div class="radio radio-inline">
				  	<label><input type="radio" name="grade">굿굿</label>
				</div>
				<div class="radio radio-inline">
				  	<label><input type="radio" name="grade">짱짱</label>
				</div>
				<div class="radio radio-inline"></div>
			</div>
			<button>write</button>
		</form>
	</div>
	
		<%-- <a href="./productWrite.product?pro_num=${list.pro_num}">글쓰기</a> --%>
		<br>
		<c:forEach items="${replyList}" var="i">
			${i.id}
			${i.contents}
			${i.report}
			${i.grade}
			${i.pro_num}
			<br>
		</c:forEach>

		<button id="blog-btn">BLOG</button>
		<div id="blog-info">BLOG</div>
		
		<button id="blog-more" style="display: none">더보기</button><br>
		
		<hr>

		<button id="buy-btn" onclick="location.href='http://shopping.naver.com/search/all_search.nhn?query=${list.pro_name}&amp;sort=price_asc'">BUY_INFO</button>
	
</div>
</body>
</html>
