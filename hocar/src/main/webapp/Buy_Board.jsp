<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
header {
	background-color: #FFD9EC;
	height: 100px;
}

nav {
	background-color: #339999;
	color: white;
	width: 350px;
	height: 1500px;
	float: left;
}

section {
	width: 1000px;
	text-align: left;
	float: left;
	padding: 10px;
}

footer {
	background-color: #FF6347;
	height: 100px;
	clear: both;
}

header, nav, footer {
	text-align: center;
}

header, footer {
	line-height: 100px;
}

nav {
	
}

table {
	width: 1000px
}
</style>
</head>
<body>
	<h1>HOCAR ����������</h1>
	<header>
	<h2>�Ǹ����� ����</h2>
	</header>
	<nav>
	<h2>
		<form method="get" action="CheckboxServlet">
			<h4>����</h4>
			<input type="checkbox" name="item" value="����">����<br> <input
				type="checkbox" name="item" value="����">����<br> <input
				type="checkbox" name="item" value="������">������<br> <input
				type="checkbox" name="item" value="����">����<br> <input
				type="checkbox" name="item" value="����">����<br> <input
				type="checkbox" name="item" value="SUV">SUV <br>
				
				
				<h4>������</h4>
				<input type="checkbox" name="item" value="����">����<br> <input
				type="checkbox" name="item" value="���">���<br> <input
				type="checkbox" name="item" value="�Ｚ">�Ｚ<br> <input
				type="checkbox" name="item" value="������">������<br> <input
				type="checkbox" name="item" value="�ֿ�">�ֿ�<br> <input
				type="checkbox" name="item" value="SUV">SUV <br>
				<input type="checkbox" name="item" value="���׽ý�">���׽ý�<br> 
				<input type="checkbox" name="item" value="BMW">BMW<br> 
				<input type="checkbox" name="item" value="����">����<br> 
				
				<h4>����Ÿ��</h4>
				<input type="checkbox" name="item" value="���ָ�">���ָ�<br> <input
				type="checkbox" name="item" value="����">����<br> <input
				type="checkbox" name="item" value="LPG">LPG<br>  
				
				<h4>����</h4>
				<input type="checkbox" name="item" value="���">���<br> <input
				type="checkbox" name="item" value="������">������<br> <input
				type="checkbox" name="item" value="���">���<br>  
				<input type="checkbox" name="item" value="������">������<br>
				<input type="checkbox" name="item" value="�Ķ���">�Ķ���<br>
				
			<br> <input type="submit" value="�˻�">
		</form>
	</h2>
	</nav>
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

	<article>
	<tr>
	<th>�����ٶ�</th>
	<th></th>
	<th></th>
	<th></th>
	<th></th>
	<th></th>
	</tr>
	
	</article>
	
	</section>
	<footer>
	<h2>������ �ѱ� ����</h2>
	</footer>
</body>
</html>