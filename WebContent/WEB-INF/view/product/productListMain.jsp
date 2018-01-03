<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="../css/header.css" rel="stylesheet">
<link href="../css/productListMain.css" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		var type = [];
		var category;
		
		$("#dry").click(function(){
			type = [];
			var category = $("input[type=radio][name=category]:checked").val()
			$(".type").each(function(){
				if($(this).prop("checked")==true) {
					type.push($(this).val());
				};
			});
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category+"&realCategory=${category}", function(data){
				$("#result").html(data);
			});
		});
		$("#neutral").click(function(){
			type = [];
			var category = $("input[type=radio][name=category]:checked").val()
			$(".type").each(function(){
				if($(this).prop("checked")==true) {
					type.push($(this).val());
				};
			});
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category+"&realCategory=${category}", function(data){
				$("#result").html(data);
			});
		});
		$("#oily").click(function(){
			type = [];
			var category = $("input[type=radio][name=category]:checked").val()
			$(".type").each(function(){
				if($(this).prop("checked")==true) {
					type.push($(this).val());
				};
			});
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category+"&realCategory=${category}", function(data){
				$("#result").html(data);
			});
		});
		$("#complex").click(function(){
			type = [];
			var category = $("input[type=radio][name=category]:checked").val()
			$(".type").each(function(){
				if($(this).prop("checked")==true) {
					type.push($(this).val());
				};
			});
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category+"&realCategory=${category}", function(data){
				$("#result").html(data);
			});
		});
		$("#sensitive").click(function(){
			type =[];
			var category = $("input[type=radio][name=category]:checked").val()
			$(".type").each(function(){
				if($(this).prop("checked")==true) {
					type.push($(this).val());
				};
			});
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category+"&realCategory=${category}", function(data){
				$("#result").html(data);
			});
		});
		
		$(".category").click(function(){
			type =[];
			var category = $("input[type=radio][name=category]:checked").val()
			$(".type").each(function(){
				if($(this).prop("checked")==true) {
					type.push($(this).val());
				};
			});
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category+"&realCategory=${category}", function(data){
				$("#result").html(data);
			});
		});
		
		<c:forEach items="${type}" var="i">
		$("#${i}").prop("checked",true);
		</c:forEach>
	});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp"%>

<div class="container">
	<input type="hidden" name="del" value="${del}">
	<input type="hidden" name="brand" value="${brand}">
	<div id="filter">
		<label class="checkbox-inline">
			<input type="checkbox" name="type" value="dry" id="dry" class="type" checked="checked">건성
		</label>
	    <label class="checkbox-inline">
			<input type="checkbox" name="type" value="neutral" id="neutral" class="type" checked="checked">중성
		</label>
		<label class="checkbox-inline">
			<input type="checkbox" name="type" value="oily" id="oily" class="type" checked="checked">지성
		</label>
		<label class="checkbox-inline">
			<input type="checkbox" name="type" value="complex" id="complex" class="type" checked="checked">복합성
		</label>
		<label class="checkbox-inline">
			<input type="checkbox" name="type" value="sensitive" id="sensitive" class="type" checked="checked">민감성
		</label>
	</div>
	<div id="filter2">
		<label class="radio-inline">
				<input type="radio" name="category" value="avg" checked="checked" class="category">평점순
		</label>
		<label class="radio-inline">
			<input type="radio" name="category" value="reviewCount"  class="category">댓글순
		</label>
	</div>
	
	<div id="result">
		<div class="resultWrap">
			<c:forEach items="${list}" var="i">
			<div class="productList clearfix">
				<div class="rank">
					${i.rank}
				</div>
				<div class="pro_img_wrap">
					<img src="${i.pic_realName}" alt="제품이미지" class="pro_img">
				</div>
				<div class="pro_desc_wrap">
					<a href="./productView.product?pro_num=${i.pro_num}" class="clearfix">
						<div class="_01">
							<p class="brand">${i.brand}</p>
							<p class="pro_name">${i.pro_name}</p>
						</div>
						<div class="_02">	
							<p class="capacity">${i.capacity}</p>
							<p class="pro_price">${i.pro_price}원</p>
						</div>
						<div class="_03">	
							<p class="avg">${i.avg }점 /</p>
							<p class="reply">${i.reply} reviews</p>
						</div>
					</a>
				</div>
				<%-- <p class="evt">${i.evt}</p>
				<p class="category">${i.category}</p>
				<p class="type">${i.type }</p> --%>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
	<%@ include file="../temp/footer.jsp"%>
</body>

<!-- S : dowon -->
<script>

	// input check ( addClass - style ) 
	var checkbox = $("#filter .checkbox-inline input[type='checkbox'], #filter2 .radio-inline input[type='radio']");

	var checkboxCheck = function(checkbox){
			checkbox.each(function(i){
				if( $(this).is(":checked") ){
					$(this).parent().addClass("checked");
				}else{
					$(this).parent().removeClass("checked");
				}
			})
		}
	$(function(){
		checkboxCheck(checkbox);
		
		$("#filter .checkbox-inline input[type='checkbox'], #filter2 .radio-inline input[type='radio']").on("click", function(){
			var checkbox = $(this);

			if( $(this).attr("type") === "radio" ){
				if( $(this).is(":checked") ){
					$(this).parent().addClass("checked").siblings().removeClass("checked");
					return false;
				}
			}
			checkboxCheck(checkbox);
		})
	})
</script>
<!-- E : dowon -->
</html>
