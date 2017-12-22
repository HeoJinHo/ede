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
		$("#replyWrite").click(function(){
			var contents = $("#contents").val();
			var report = $("#report").val();
			var grade = $("#grade").val();
			var pro_num = ${list.pro_num};
			alert(contents);
			alert(report);
			alert(grade);
			alert(pro_num);
			$.get("./productWrite.product?contents="+contents+"&report="+report+"&grade="+grade+"&pro_num="+pro_num, function(data){
				$("#result").html(data);
			});
		})
	});
</script>
</head>
<body>
		<p>${list.pic_realName}</p>
		<p>${list.pic_compName}</p>
		<p>${list.brand}</p>
		<p>${list.pro_name}</p>
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
		
		
		<button id="reply">reply</button><button id="blog">blog</button><button id="buy">buy</button>
		
		<div id="blog or buy">
		<p>contents<input type="text" name="contents" value="" id="contents"></p>
		<p>report<input type="text" name="report" value="" id="report"></p>
		<p>grade<input type="text" name="grade" value="" id="grade"></p>
		<button id="replyWrite">replyWrite</button>
		
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

</body>
</html>