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
	<h1>HOCAR ��������</h1>
	<header>
		<h1>��ϵ� ���� ��Ȳ</h1>
	</header>
	<section>
		<table border="1">
			<tr>
				<th>������ȣ</th>
				<th>����</th>
				<th>������</th>
				<th>������</th>
				<th>����</th>
				<th>����</th>
				<th>����Ÿ�</th>
				<th>��������</th>
				<th>����</th>
			</tr>
		</table>
		<p>����</p>
	</section>
	<aside>
		<p>��������</p>
		<p>
		������ȣ: <input type="text" name="car_num"><br>
		��������: <input type="text" name="car_type"><br>
		�����̸�: <input type="text" name="car_name"><br>
		������: <input type="text" name="company"><br>
		<input type="submit" value="���">
		</p>
	</aside>
	<footer>
		<p>������ �ѹ� �� ��Ÿ ����</p>
	</footer>
</body>
</html>