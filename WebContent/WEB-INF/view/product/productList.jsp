<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- todo type을 어케 담아줄지 필요하다 -->
	<!-- del brand 도 -->
	<div class="resultWrap">
			<c:forEach items="${list}" var="i">
			<div class="productList clearfix">
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
							<p class="pro_price">${i.pro_price}</p>
						</div>
						<div class="_03">	
							<p class="avg">${i.avg }</p>
							<p class="reply">${i.reply}</p>
						</div>
					</a>
				</div>
				<p class="evt">${i.evt}</p>
				<p class="category">${i.category}</p>
				<p class="type">${i.type }</p>
			</div>
			</c:forEach>
		</div>