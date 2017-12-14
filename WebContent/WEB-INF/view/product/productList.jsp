<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<h1>Product List</h1>
	<h3>filter</h3>
	<form action="./productFilter.product">
	<input type="hidden" name="del" value="${del}">
	피부타입<select name="type">
		<option value="dry">건성</option>
		<option value="neutral">중성</option>
		<option value="oily">지성</option>
		<option value="complex">복합성</option>
		<option value="sensitive">민감성</option>
	</select>
	최신순<input type="radio" name="category" value="recent" checked="checked">
	댓글순<input type="radio" name="category" value="reviewCount"> 
	평점순<input type="radio" name="category" value="avg">
	<button>검색</button>
	</form>
	
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
			</tr>
		</c:forEach>
	</table>

</body>
</html>