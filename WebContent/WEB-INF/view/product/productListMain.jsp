<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category, function(data){
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
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category, function(data){
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
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category, function(data){
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
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category, function(data){
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
			$.get("./productFilter.product?del=${del}&brand=${brand}&type="+type+"&category="+category, function(data){
				$("#result").html(data);
			});
		});
		
		$("#check").click(function(){
			alert(type);
		})
		
		<c:forEach items="${type}" var="i">
		$("#${i}").prop("checked",true);
		</c:forEach>
	});
</script>
</head>
<body>
	<h1>Product List</h1>
	<h3>filter</h3>
	<form action="./productFilter.product" name="frm">
	<input type="hidden" name="del" value="${del}">
	<input type="hidden" name="brand" value="${brand}">
	
	건성<input type="checkbox" name="type" value="dry" id="dry" class="type" checked="checked">
	중성<input type="checkbox" name="type" value="neutral" id="neutral" class="type" checked="checked">
	지성<input type="checkbox" name="type" value="oily" id="oily" class="type" checked="checked">
	복합성<input type="checkbox" name="type" value="complex" id="complex" class="type" checked="checked">
	민감성<input type="checkbox" name="type" value="sensitive" id="sensitive" class="type" checked="checked">
	<br>
	댓글순<input type="radio" name="category" value="reviewCount" checked="checked" class="category">
	평점순<input type="radio" name="category" value="avg" class="category">
	</form>
	<button id="check">hi</button>
	
	<div id="result">
	<table>
	<tr>
		<th>brand</th>
		<th>pro_Name</th>
		<th>pro_Price</th>
		<th>capacity</th>
		<th>info</th>
		<th>grade1</th>
		<th>grade2</th>
		<th>grade3</th>
		<th>grade4</th>
		<th>grade5</th>
		<th>pic_realName</th>
		<th>pic_compName</th>
		<th>evt</th>
		<th>pro_num</th>
		<th>category</th>
		<th>type</th>
		<th>avg</th>
	</tr>
		<c:forEach items="${list}" var="i">
			<tr>
				<td>${i.brand}</td>
				<td><a href="./productView.product?pro_num=${i.pro_num}">${i.pro_name}</a></td>
				<td>${i.pro_price}</td>
				<td>${i.capacity}</td>
				<td>${i.info}</td>
				<td>${i.grade1}</td>
				<td>${i.grade2}</td>
				<td>${i.grade3}</td>
				<td>${i.grade4}</td>
				<td>${i.grade5}</td>
				<td>${i.pic_realName}</td>
				<td>${i.pic_compName}</td>
				<td>${i.evt}</td>
				<td>${i.pro_num}</td>
				<td>${i.category }
				<td>${i.type }</td>
				<td>${i.avg }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>