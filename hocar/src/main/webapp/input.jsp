<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="./test.jsp">
		<input type="checkbox" name="car_type" value="경차">경차<br> <input
			type="checkbox" name="car_type" value="소형">소형<br> <input
			type="checkbox" name="car_type" value="준중형">준중형<br> <input
			type="checkbox" name="car_type" value="중형">중형<br> <input
			type="checkbox" name="car_type" value="대형">대형<br> <input
			type="checkbox" name="car_type" value="SUV">SUV <br>
			<input
			type="submit" value="검색">
	</form>
	
	<form action="./test.jsp" method="post">
		<input type="text" name="car_number"> <input type="text"
			name="car_type"> <input type="text" name="car_name">
		<input type="text" name="made_company"> <input type="text"
			name="price"> <input type="text" name="made_year"> <input
			type="text" name="dis_dirven"> <input type="text"
			name="fuel_type"> <input type="text" name="color"> <input
			type="submit" value="로그인">
	</form>
</body>
</html>