<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- todo type을 어케 담아줄지 필요하다 -->
	<!-- del brand 도 -->
	<h1>ajax</h1>
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
