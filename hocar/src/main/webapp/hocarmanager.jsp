<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
	text-align: center;
}

header {
	border: 1px solid #999;
}

section {
	width: 1500px;
	height: 1000px;
	border: 1px solid #999;
	float: left;
	padding: 10px;
	border: 1px solid #999;
	border: 1px solid #999
}

aside {
	width: 300px;
	height: 1000px;
	border: 1px solid #999;
	float: left;
	padding: 10px;
	border: 1px solid #999;
}

footer {
	border: 1px solid #999;
	clear: both;
}

table {
	width: 1000px;
	margin: auto;
}
;
</style>
</head>
<body>
	<h1>HOCAR 차량관리</h1>
	<header>
		<h1>등록된 차량 현황</h1>
	</header>
	<section>
		<table border="1">
			<tr>
				<th>차량번호</th>
				<th>차종</th>
				<th>차량명</th>
				<th>제조사</th>
				<th>가격</th>
				<th>연식</th>
				<th>주행거리</th>
				<th>연료종류</th>
				<th>색상</th>
			</tr>
		</table>
		<p>내용</p>
	</section>
	<aside>
		<p>차량관리</p>
		<p>
		차량번호: <input type="text" name="car_num"><br>
		차량종류: <input type="text" name="car_type"><br>
		차량이름: <input type="text" name="car_name"><br>
		제조사: <input type="text" name="company"><br>
		<input type="submit" value="등록">
		</p>
	</aside>
	<footer>
		<p>페이지 넘버 및 기타 구성</p>
	</footer>
</body>
</html>