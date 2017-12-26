<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">

$(function(){
	$("#blog-btn").on("click", ()=>{
		alert("ininin");
		var query = $("#name").text();
		alert(query)
		$.get("./productViewBlog.product?query="+query+"&start=1&display=10", (data)=>{
			alert(data);
			var result = JSON.parse(data);
			alert(result);
			var start =0;
			for(var i=start;i<start+10;i++){
				$("#blog-info").after(
					"<div>"
						+"<p>${result.items[i].title}<p>"+
						+"<p>${result.items[i].description}<p>"+
						+"<p>${result.items[i].bloggername}<p>"+
						+"<p>${result.items[i].link}<p>"+
						+"<p>${result.items[i].postdate}<p>"+
					"</div>"
				);
			}
			
		});
		
	});
	
})
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
		
		<button id="blog-more">더보기</button>

		<button id="buy-btn">BUY_INFO</button>
		<a href="http://shopping.naver.com/search/all_search.nhn?query=빌리프 위치헤이즐 허벌 익스트랙트 토너&amp;sort=price_asc" target="_blank" class="plus_more pull-right">더보기 </a>
</body>
</html>