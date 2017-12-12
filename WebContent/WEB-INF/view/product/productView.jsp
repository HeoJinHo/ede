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
		<div>
		${list.pic_realName}
		${list.pic_compName}
		${list.brand}
		${list.pro_name}
		${list.pro_price}
		${list.capacity}
		</div>
		
		<div>
		${list.grade1}
		${list.grade2}
		${list.grade3}
		${list.grade4}
		${list.grade5}
		</div>

		
		
		<div>
		${list.info}
		
		</div>
		
		${list.evt}
		${list.pro_num}
		${list.category }
		
		<a href="./productWrite.product?pro_num=${list.pro_num}">글쓰기</a>

</body>
</html>