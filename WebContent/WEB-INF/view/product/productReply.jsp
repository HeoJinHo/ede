<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<c:forEach items="${replyList}" var="i">
	<br>
	${i.id}
	${i.contents}
	${i.report}
	${i.grade}
	${i.pro_num}
	<br>
</c:forEach>