<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<ul class="category_list clearfix">
	<c:forEach items="${list}" var="i" varStatus="s">
		<li class="col-sm-12 col-xs-12"><a href="./productListMain.product?del=brand&brand=${i.brand}">
				<p class="title_name 2">${i.brand}</p>
				<p class="detail_name 2">${i.capacity}</p>
		</a></li>
	</c:forEach>
</ul>
<a href="./productRegist.product" class="register">Register</a>
