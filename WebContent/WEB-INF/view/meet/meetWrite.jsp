<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>meetWrite</h1>
	<form action="./meetWrite.meet" method="post">
		<p>title <input type="text" name="m_title"> </p>
		<p>id <input type="text" name="id"> </p>
		<p>m name <input type="text" name="m_name"> </p>
		<p>m contents <input type="text" name="m_contents"> </p>
		<p>start date <input type="text" name="start_date"> </p>
		<p>last date <input type="text" name="last_date"> </p>
		<p>start apply<input type="text" name="start_apply"> </p>
		<p>last apply<input type="text" name="last_apply"> </p>
		<p>m_addr<input type="text" name="m_addr"> </p>
		<p>m_detail_addr<input type="text" name="m_detail_addr"> </p>
		<p>m_price<input type="number" name="m_price"> </p>
		<p>m_ref<input type="number" name="m_ref"> </p>
		<p>m_step<input type="number" name="m_step"> </p>
		<p>m_depth<input type="number" name="m_depth"> </p>
		<p>m_phone<input type="text" name="m_phone"> </p>
		<p>m_email<input type="text" name="m_email"> </p>
		<p>m_hit<input type="number" name="m_hit"> </p>
		<p>total_seats<input type="number" name="total_seats"> </p>
		<button>write</button>
	</form>
</body>
</html>