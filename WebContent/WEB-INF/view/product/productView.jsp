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


</style>
<script type="text/javascript">
$(function(){
	
	var pro_num = ${list.pro_num};
	
	$(".tab_btn #reply").addClass("on");
	$(".tab_content .reply").addClass("on");

	$(".tab_btn button").on("click", function(){
		var index = $(this).index()

		$(this).addClass("on").siblings().removeClass("on");
		$(".tab_content > div").eq(index).addClass("on").siblings().removeClass("on");
	})
	
	$(document).on('click','.like', function(){
		var num = $(this).val();
		$.get("./productLike.product?num="+num+"&pro_num="+pro_num, function(data){
			$("#result").html(data);
		});
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
	 		$("#blog-info").html("<div id='blog-count'><h3><b>BLOG 검색결과 총 "+result.total+" 개</b></h3><div>");
	 		for(var i = 0;i<10;i++){
	 			$("#blog-info").append("<div class='blog-inner'></div>");
	 			var title = $("<a href="+result.items[i].link+" class='blog-title'></a>").html("<b>"+result.items[i].title+"</b> ");
	 			var description = $("<p></p>").html(result.items[i].description);
	 			var bloggername = $("<p></p>").html("<b style='color:#25cbd3'>written by</b> "+result.items[i].bloggername);
	 			var postdate = $("<p></p>").html("<b style='color:#25cbd3'>date</b> "+result.items[i].postdate);
	 			$(".blog-inner:last-child").append(title, description, bloggername, postdate);
	 		}
	 	});
	 	
	 	// blog 스크롤 페이징 이벤트
		 $(window).scroll(function() {
		    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
		 	var a=$(".blog").css("display");
		    	if(a=="block"){
		    		var query = $("#name").text();
		    	 	var start = $(".blog-inner").length + 1; // .blog-inner의 갯수를 읽어옴
		    	// 	//alert(start);  -> 10 출력
		    	 	$.get("./productViewBlog.product?query="+query+"&start="+start+"1&display=10", function(data){
		    	 		var result = JSON.parse(data);
		    	// 		//alert(data);
		    			if(result.items[0].title != null){
			    	 		for(var i = 0;i<10;i++){
			    	 			$("#blog-info").append("<div class='blog-inner'></div>");
			    	 			var title = $("<a href="+result.items[i].link+" class='blog-title'></a>").html("<b>"+result.items[i].title+"</b> ");
			    	 			var description = $("<p></p>").html(result.items[i].description);
			    	 			var bloggername = $("<p></p>").html("<b style='color:#25cbd3'>written by</b> "+result.items[i].bloggername);
			    	 			var postdate = $("<p></p>").html("<b style='color:#25cbd3'>date</b> "+result.items[i].postdate);
			    	 			$(".blog-inner:last-child").append(title, description, bloggername, postdate);
			    	 		}
		    			}else{
		    				alert("더 이상 결과가 없습니다.");
		    			}
		    	 	});
		    	}
		    }
		});
	 	
	 	
	 });
	
/* 	 
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
	 			var title = $("<a href="+result.items[i].link+" class='blog-title'></a>").html("<b>"+result.items[i].title+"</b> ");
	 			var description = $("<p></p>").html(result.items[i].description);
	 			var bloggername = $("<p></p>").html("<b style='color:#25cbd3'>blog by</b> "+result.items[i].bloggername);
	 			var postdate = $("<p></p>").html("<b style='color:#25cbd3'>date</b> "+result.items[i].postdate);
	 			$(".blog-inner:last-child").append(title, description, bloggername, postdate);
	 		}
	 	});
	 });
*/
	
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
			<p class="avg">평균 ${list.avg}점 <span> (${list.reply}명 평가) </span></p>
			<div class="graph_area">
				<div class="best clearfix">
					<p class="text">
						<span class="grade grade5">짱짱</span><span class="num num5">${list.grade5}</span>
					</p>
					<div class="graph">
						<div class="bar"></div>
					</div>
				</div>
				<div class="good clearfix">
					<p class="text">
						<span class="grade grade4">굿굿</span><span class="num num4">${list.grade4}</span>
					</p>
					<div class="graph">
						<div class="bar"></div>
					</div>
				</div>
				<div class="soso clearfix">
					<p class="text">
						<span class="grade grade3">쏘소</span><span class="num num3">${list.grade3}</span>
					</p>
					<div class="graph">
						<div class="bar"></div>
					</div>
				</div>
				<div class="bad clearfix">
					<p class="text">
						<span class="grade grade2">별로</span><span class="num num2">${list.grade2}</span>
					</p>
					<div class="graph">
						<div class="bar"></div>
					</div>
				</div>
				<div class="worst clearfix">
					<p class="text">
						<span class="grade grade1">최악</span><span class="num num1">${list.grade1}</span>
					</p>
					<div class="graph">
						<div class="bar"></div>
					</div>
				</div>
			</div>
				<%-- <p>${list.evt}</p> --%>
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
				  		<input type="radio" name="grade" value="grade1" id="grade1">
				  		<label class="grade1" for="grade1">최악</label>
				  		<input type="radio" name="grade" value="grade2" id="grade2">
				  		<label class="grade2" for="grade2">별로</label>
				  		<input type="radio" name="grade" value="grade3" id="grade3">
				  		<label class="grade3" for="grade3">쏘쏘</label>
				  		<input type="radio" name="grade" value="grade4" id="grade4">
				  		<label class="grade4" for="grade4">굿굿</label>
				  		<input type="radio" name="grade" value="grade5" id="grade5">
				  		<label class="grade5" for="grade5">짱짱</label>
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
							<span class="age">${i.birth }세</span>/
							<span class="type">${i.skin }</span>/
							<span class="gender">${i.gender }</span>
						</div>
						<div class="contents">${i.contents}</div>
						<div class="btn_like">
							<button class="like" value="${i.num }">${i.thumsup }</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<div class="blog">
			<div id="blog-open">
				<div id="blog-info">BLOG</div>
			</div>
		</div>
		<div class="buy container">
			<div style="margin : 30px 20px;">
				<label  class="information-label2"><img src="https://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/web/icon_price.png"> 인터넷 최저가</label>
				<a style="margin-top: 8px;" id="buy-btn" href="http://shopping.naver.com/search/all_search.nhn?query=${list.pro_name}&amp;sort=price_asc" target="_blank" class="plus_more pull-right">더보기 <img src="https://d9vmi5fxk1gsw.cloudfront.net/home/glowmee/upload/web/icon_arrow_more.png"></a>
				<%-- 
				<button id="buy-btn" class  onclick="location.href='http://shopping.naver.com/search/all_search.nhn?query=${list.pro_name}&amp;sort=price_asc'">BUY_INFO</button>
				 --%>
			</div>
		</div>
	</div>
</div>
<script>

	// 평점 그래프 
	var gradeGraph = function(){
		var gradeList = $(".graph_area .text .num");
		var totalData = 0;

		for( var i = 0; i < gradeList.length; i++ ){
			var data = parseInt(gradeList.eq(i).text());
			totalData = totalData + data;
		}

		gradeList.each(function() {
		    var data = $(this).text();
			var dataPercent = ( data/totalData ) *100
		    $(this).parent().siblings().find(".bar").css("width", dataPercent + "%");
		});
		
	}
	$(function(){
		gradeGraph();
	})
</script>

</body>
</html>
