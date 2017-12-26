<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			for(var i = 0;i<10;i++){
				$("#blog-info").append("<div class='blog-inner'></div>");
				var title = $("<p></p>").html("<b style='color:blue'>title</b> "+result.items[i].title);
				var description = $("<p></p>").html(result.items[i].description);
				var link = $("<p></p>").html("<b style='color:blue'>link</b> "+result.items[i].link);
				var bloggername = $("<p></p>").html("<b style='color:blue'>blog by</b> "+result.items[i].bloggername);
				var blogdate = $("<p></p>").html(result.items[i].blogdate);
				$(".blog-inner:last-child").append(title, description, link, bloggername, blogdate);
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
				var blogdate = $("<p></p>").html(result.items[i].blogdate);
				$(".blog-inner:last-child").append(title, description, link, bloggername, blogdate);
			}
		});
	});
	
});
</script>
</head>
<body>
		<p>${list.pic_realName}</p>
		<p>${list.pic_compName}</p>
		<p>${list.brand}</p>
		<p id="name">${list.pro_name}</p>
		<p>${list.pro_price}</p>
		<p>${list.capacity}</p>
		<p>${list.grade1}</p>
		<p>${list.grade2}</p>
		<p>${list.grade3}</p>
		<p>${list.grade4}</p>
		<p>${list.grade5}</p>
		<p>${list.info}</p>
		<p>${list.evt}</p>
		<p>${list.pro_num}</p>
		<p>${list.category}</p>
		<!-- ajax로 바꿔야함 -->
		<form action="./productWrite.product" method="post">
			<p>contents<input type="text" name="contents"></p>
			<p>report<input type="text" name="report"></p>
			<p>grade<input type="text" name="grade"></p>
			<input type="hidden" name="pro_num" value="${list.pro_num}">
		<button>write</button>
		</form>
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
</body>
</html>