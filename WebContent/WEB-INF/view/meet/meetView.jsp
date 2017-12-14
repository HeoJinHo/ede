<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1>meetView</h1>
	<form action="./meetApply.meet">
		<input type="hidden" value="${view.m_num}" name="m_num"> 
		<p>글번호 : ${view.m_num}</p>
		<p>조회수 : ${view.m_hit}</p>
		<p>제목 : ${view.m_title}</p>
		<p>개설자 : ${view.m_name}</p>
		<p>내용 : ${view.m_contents}</p>
		<p>시작일 : ${view.start_date}</p>
		<p>종료일 : ${view.last_date}</p>
		<p>신청시작일 : ${view.start_apply}</p>
		<p>신청마감일 : ${view.last_apply}</p>
		<p>주소 : ${view.m_addr}</p>
		<p>상세주소 : ${view.m_detail_addr}</p>
		<p>총 좌석 : ${view.total_seats}</p>
		<p>남은 좌석 : ${view.total_seats - view.applied_seats}</p>
		<p>참가비 : ${view.m_price}</p>
		<p>전화번호 : ${view.m_phone}</p>
		<p>이메일 : ${view.m_email}</p>
		<button>apply</button>
	</form>
	<form action="">
		<textarea rows="" cols="" name="reply">댓글</textarea>
		<button>댓글 입력</button>
	</form>
	<!-- 
	기존 댓글들이 뿌려지는 부분
	 -->
</body>
</html>