<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<div id="result">
<table>
<c:forEach items="${list}" var="i" varStatus="s">
	<tr>
		<td><a href="./productListMain.product?del=category">${i.category }</a></td>
	</tr>
</c:forEach>
</table>
</div>
