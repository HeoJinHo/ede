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
<!-- <link href="../css/header.css" rel="stylesheet"> -->
<link href="../css/header.css" rel="stylesheet">
<link href="../css/productView.css" rel="stylesheet">

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
	
	$(".like").click(function(){
		alert("click")
		$.get("./productLike.product?num=${num}", function(data){
			$(".btn_like").html(data);
		});
	});
	
	
	$(".tab_btn #reply").addClass("on");
	$(".tab_content .reply").addClass("on");

	$(".tab_btn button").on("click", function(){
		var index = $(this).index()

		$(this).addClass("on").siblings().removeClass("on");
		$(".tab_content > div").eq(index).addClass("on").siblings().removeClass("on");
	})
	
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
		
	 	//alert('content :'+contents);
	 	//alert('report : '+report);
	 	//alert('grade : '+grade);
	 	//alert('pro_num : '+pro_num);
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
	
	// // blog 글 11번 ~ : 더보기 버튼 function
	 $("#blog-more").click(function(){
	 	var query = $("#name").text();
	 	var start = $(".blog-inner").length + 1; // .blog-inner의 갯수를 읽어옴
	// 	//alert(start);  -> 10 출력
	 	$.get("./productViewBlog.product?query="+query+"&start="+start+"1&display=10", function(data){
	 		var result = JSON.parse(data);
	// 		//alert(data);
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
				<p>평균 ${list.avg}</p>
			<div class="graph">
				<div class="worst"></div>
				<div class="bad"></div>
				<div class="soso"></div>
				<div class="good"></div>
				<div class="best"></div>
				<p>최악 ${list.grade1}</p>
				<p>별로 ${list.grade2}</p>
				<p>쏘쏘 ${list.grade3}</p>
				<p>굿굿 ${list.grade4}</p>
				<p>짱짱 ${list.grade5}</p>
				<div id="worst"></div>
				<div id="bad"></div>
				<div id="soso"></div>
				<div id="good"></div>
				<div id="best"></div>
			</div>
				<p>${list.evt}</p>
	</div>
		
	<div class="tab_btn" >
		<button id="reply">reply</button><button id="blog-btn">blog</button><button id="buy">buy</button>
	</div>
	<div class="tab_content">
		<div class="reply">
			<div class="write_wrap">			
	      		<p class="text">댓글남기기</p>
				<div class="reply_innerwrap">
					<div class="grade_wrap">
				  		<input type="radio" name="grade" value="grade5" id="grade5">
				  		<label class="grade5" for="grade5">짱짱</label>
				  		<input type="radio" name="grade" value="grade4" id="grade4">
				  		<label class="grade4" for="grade4">굿굿</label>
				  		<input type="radio" name="grade" value="grade3" id="grade3">
				  		<label class="grade3" for="grade3">쏘쏘</label>
				  		<input type="radio" name="grade" value="grade2" id="grade2">
				  		<label class="grade2" for="grade2">별로</label>
				  		<input type="radio" name="grade" value="grade1" id="grade1">
				  		<label class="grade1" for="grade1">최악</label>
					</div>
					<div class="text_wrap clearfix">
		      			<!-- <label for="contents">contents:</label> -->
		      			<textarea rows="2" id="contents" style="width:100%" placeholder="고객님의 소중한 리뷰를 남겨주세요!"></textarea>
						<button id="replyWrite">등록</button>
					</div>
				</div>
			</div>
			
			<div id="result">
				<c:forEach items="${replyList}" var="i">
					<div class="result_wrap">
						<div class="grade${i.grade}"></div>
						<div class="user_info">
							<span class="user_id">${i.id}</span>
							<span class="age">age</span>/
							<span class="type">type</span>/
							<span class="gender">gender</span>
						</div>
						<div class="contents">${i.contents}</div>
						<div class="btn_like">
							<button class="like">${i.thumsup }</button>
						</div>
					</div>
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
