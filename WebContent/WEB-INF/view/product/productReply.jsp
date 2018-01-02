<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<c:forEach items="${replyList}" var="i">
	<div class="result_wrap">
		<div class="grade${i.grade}"></div>
		<div class="user_info">
			<span class="user_id">${i.id}</span> <span class="age">age</span>/ <span
				class="type">type</span>/ <span class="gender">gender</span>
		</div>
		<div class="contents">${i.contents}</div>
		<div class="btn_like">
			<button class="like">${i.thumsup}</button>
		</div>
	</div>
</c:forEach>