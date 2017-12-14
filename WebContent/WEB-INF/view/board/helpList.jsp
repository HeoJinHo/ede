<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>1:1 문의하기</h1>
	<div>
		<form name="frm" action="./${board}List.${board}">
			<input type="hidden" name="curPage">
			<select name="kind">
				<option class="kind" value="title">TITLE</option>
				<option class="kind" value="writer">WRITER</option>
				<option class="kind" value="contents">CONTENTS</option>
			</select>
			<input type="text" name="search" value="${make.search}">
			<button>Search</button>
		</form>
	</div>
	<table>
		<tr>
			<td>NUM</td>
			<td>TITLE</td>
			<td>WRITER</td>
			<td>DATE</td>
			<td>HIT</td>
		</tr>
		
		
	</table>

	<a href="Help.help">1:1 문의하기</a>
</body>
</html>