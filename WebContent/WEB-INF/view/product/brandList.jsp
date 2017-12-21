<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

	<table>
		<c:forEach items="${list}" var="i">
			<tr>
				<td><a href="./productListMain.product?del=brand&brand=${i.brand}">${i.brand}</a></td>
				<td>${i.capacity}</td>
			</tr>
		</c:forEach>
	</table>
