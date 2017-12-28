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
<link href="../css/header.css" rel="stylesheet">

<style type="text/css">

/* div{
	border: solid 1px red;
} */

.blog-inner{
	border-color: blue;
	width : 70%;
}
</style>
<script type="text/javascript">
$(function(){
	$(".tab_content .reply").show();
	$(".tab_content .blog").hide();
	$(".tab_content .buy").hide();
	$("#reply").on("click", function(){
		$(".tab_content .reply").show();
		$(".tab_content .blog").hide();
		$(".tab_content .buy").hide();
	});
	$("#blog-btn").on("click", function(){
		$(".tab_content .reply").hide();
		$(".tab_content .blog").show();
		$(".tab_content .buy").hide();
	});
	$("#buy").on("click", function(){
		$(".tab_content .reply").hide();
		$(".tab_content .blog").hide();
		$(".tab_content .buy").show();
	});
	
	$("#replyWrite").click(function(){
		var contents = $("#contents").val();
		var report = $("#report").val();
		var grade = $("input[type=radio][name=grade]:checked").val();
		
		if(grade=="grade1") {
			grade=1;
		} else if (grade=="grade2") {
			grade=2;
		} else if (grade=="grade3") {
			grade=3;
		} else if (grade=="grade4") {
			grade=4;
		} else {
			grade=5;
		}
		var pro_num = ${list.pro_num};
		
		alert('content :'+contents);
		alert('report : '+report);
		alert('grade : '+grade);
		alert('pro_num : '+pro_num);
		$.get("./productWrite.product?contents="+contents+"&report="+report+"&grade="+grade+"&pro_num="+pro_num, function(data){
			$("#result").html(data);
		});
	});

	// blog 글 1~10
	$("#blog-btn").click(function(){
		var query = $("#name").text();
		$.get("./productViewBlog.product?query="+query+"&start=1&display=10", function(data){
			var result = JSON.parse(data);
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
			//alert(data);
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
<%@ include file="../temp/header.jsp"%>
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
		
	<div class="tab_content">
	<button id="reply">reply</button><button id="blog-btn">blog</button><button id="buy">buy</button>
		
		<div class="reply">
		
			<div>
      			<label for="contents">contents:</label>
      			<textarea class="form-control" rows="2" id="contents" style="width:100%"></textarea>
      			<label for="report">Report:</label>
      			<textarea class="form-control" rows="5" id="report" style="width:100%"></textarea>
			</div>
			
			  	<label><input type="radio" name="grade" value="grade1">최악</label>
			  	<label><input type="radio" name="grade" value="grade2">별로</label>
			  	<label><input type="radio" name="grade" value="grade3">쏘쏘</label>
			  	<label><input type="radio" name="grade" value="grade4">굿굿</label>
			  	<label><input type="radio" name="grade" value="grade5">짱짱</label>
				
		<button id="replyWrite">write</button>
		
			
			<div id="result">
				<c:forEach items="${replyList}" var="i">
					${i.id}
					${i.contents}
					${i.report}
					${i.grade}
					${i.pro_num}
					<br>
				</c:forEach>
			</div>
		</div>
		
		
		<div class="blog">
			<div id="blog-open">
				<div id="blog-info">BLOG</div>
				<button id="blog-more" style="display: none">더보기</button><br>
			</div>
		</div>
		<div class="buy">
			<button id="buy-btn" onclick="location.href='http://shopping.naver.com/search/all_search.nhn?query=${list.pro_name}&amp;sort=price_asc'">BUY_INFO</button>
		</div>
	</div>
</div>

</body>
</html>
