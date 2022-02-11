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
	<h1>HOCAR 구매페이지</h1>
	<header>
	<h2>판매중인 차량</h2>
	</header>
	<nav>
	<h2>
		<form method="get" action="CheckboxServlet">
			<h4>차종</h4>
			<input type="checkbox" name="item" value="경차">경차<br> <input
				type="checkbox" name="item" value="소형">소형<br> <input
				type="checkbox" name="item" value="준중형">준중형<br> <input
				type="checkbox" name="item" value="중형">중형<br> <input
				type="checkbox" name="item" value="대형">대형<br> <input
				type="checkbox" name="item" value="SUV">SUV <br>
				
				
				<h4>제조사</h4>
				<input type="checkbox" name="item" value="현대">현대<br> <input
				type="checkbox" name="item" value="기아">기아<br> <input
				type="checkbox" name="item" value="삼성">삼성<br> <input
				type="checkbox" name="item" value="쉐보레">쉐보레<br> <input
				type="checkbox" name="item" value="쌍용">쌍용<br> <input
				type="checkbox" name="item" value="SUV">SUV <br>
				<input type="checkbox" name="item" value="제네시스">제네시스<br> 
				<input type="checkbox" name="item" value="BMW">BMW<br> 
				<input type="checkbox" name="item" value="벤츠">벤츠<br> 
				
				<h4>연료타입</h4>
				<input type="checkbox" name="item" value="가솔린">가솔린<br> <input
				type="checkbox" name="item" value="디젤">디젤<br> <input
				type="checkbox" name="item" value="LPG">LPG<br>  
				
				<h4>색상</h4>
				<input type="checkbox" name="item" value="흰색">흰색<br> <input
				type="checkbox" name="item" value="검정색">검정색<br> <input
				type="checkbox" name="item" value="쥐색">쥐색<br>  
				<input type="checkbox" name="item" value="빨간색">빨간색<br>
				<input type="checkbox" name="item" value="파란색">파란색<br>
				
			<br> <input type="submit" value="검색">
		</form>
	</h2>
	</nav>
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

	<article>
	<tr>
	<th>가나다라</th>
	<th></th>
	<th></th>
	<th></th>
	<th></th>
	<th></th>
	</tr>
	
	</article>
	
	</section>
	<footer>
	<h2>페이지 넘김 제작</h2>
	</footer>
</body>
</html>