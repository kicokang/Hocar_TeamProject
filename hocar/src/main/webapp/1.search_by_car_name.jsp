<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function showPopup() {
		window.open("inputdata.jsp", "a",
				"width=400, height=300, left=100, top=50");
	}
</script>
<style>
body {
	text-align: center;
}

header {
	border: 1px solid #999;
}

section {
	width: 1500px;
	height: 800px;
	border: 1px solid #999;
	float: left;
	padding: 10px;
	border: 1px solid #999;
	border: 1px solid #999
}

aside {
	width: 300px;
	height: 800px;
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
	width: 1500px;
	margin: auto;
}

.dropdown {
	display: inline-block;
	position: relative;
}

.button {
	padding: 10px 40px;
	font-size: 20px;
	color: black;
}

#drop-content {
	position: relative;
	z-index: 1;
}

#drop-content a {
	display: block;
	font-size: 20px;
	color: black;
	padding: 10px 36px;
}
</style>
</head>
<body>

<fmt:requestEncoding value="UTF-8" /> 
	
	<h1>HOCAR 차량관리</h1>
	<header>

		<h1>등록된 차량 현황</h1>
		<%	String car_name = request.getParameter("car_name"); %>
		<form METHOD="post" ACTION="1.search_by_car_name.jsp">
			차량 이름 : <input type="text" name="car_name" value=<%=car_name%>><br> <input
				type="submit" value="검색">
								
		</form>
		

	</header>
	<section>
		<%
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		

		System.out.println("car_name:" + car_name);
		System.out.println("currentPage:" + currentPage);
		
		int totalRowCount = 0;

		Connection con = null;
		Statement st = null;
		ResultSet totalrs = null;
		ResultSet listrs = null;
		PreparedStatement totalpstmt = null;
		PreparedStatement listpstmt = null;
		String url = "jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false&characterEncoding=UTF-8";
		String dbID = "root";
		String dbPW = "1234";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, dbID, dbPW);
			String totalSql = "Select count(*)from usedcar where car_name like ?";
			totalpstmt = con.prepareStatement(totalSql);
			totalpstmt.setString(1, "%" + car_name + "%");
			totalrs = totalpstmt.executeQuery();
			st = con.createStatement();
			if (totalrs.next()) {
				totalRowCount = totalrs.getInt(1);
			}
		%>
		<%
		int pagePerRow = 25;
		String listSql = "select * from usedcar where car_name like ? order by car_name desc limit ?,?";

		listpstmt = con.prepareStatement(listSql);
		listpstmt.setString(1, "%" + car_name + "%");
		listpstmt.setInt(2, (currentPage - 1) * pagePerRow);
		listpstmt.setInt(3, pagePerRow);
		listrs = listpstmt.executeQuery();
		%>
		<table border="1">
			<thead>
				<th>차량번호</th>
				<th>차종</th>
				<th>차량명</th>
				<th>제조사</th>
				<th>가격(원)</th>
				<th>연식</th>
				<th>주행거리(km)</th>
				<th>연료종류</th>
				<th>색상</th>
			</thead>
			<tbody>
				<%
				while (listrs.next()) {
				%>
				<tr>
					<td><%=listrs.getString("car_number")%></td>
					<td><%=listrs.getString("car_type")%></td>
					<td><%=listrs.getString("car_name")%></td>
					<td><%=listrs.getString("made_company")%></td>
					<td><%=listrs.getString("price")%></td>
					<td><%=listrs.getString("made_year")%></td>
					<td><%=listrs.getString("dis_driven")%></td>
					<td><%=listrs.getString("fuel_type")%></td>
					<td><%=listrs.getString("color")%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<div>
			<br> 현재 페이지:
			<%=currentPage%></div>
		<%
		int lastPage = totalRowCount / pagePerRow;
		if (totalRowCount % pagePerRow != 0) {
			lastPage++;
		}
		%>
		<%
		int nextPage=currentPage+1;
		int backPage=currentPage-1;
		String SnextPage = Integer.toString(nextPage);
		String SbackPage = Integer.toString(backPage);
		%>
<c:url value="http://localhost:8080/hocar/1.search_by_car_name.jsp" var="next"> 
<c:param name="currentPage" value="<%=SnextPage %>"/> 
<c:param name="car_name" value="<%=car_name %>"/>
</c:url> 
<c:url value="http://localhost:8080/hocar/1.search_by_car_name.jsp" var="back"> 
<c:param name="currentPage" value="<%=SbackPage %>"/> 
<c:param name="car_name" value="<%=car_name %>"/>
</c:url> 
		
		<div>
			<%
			if (currentPage > 1) {
			%>
			<a href="${back}">이전</a> 
			<%
			}
			if (currentPage < lastPage) {
			%>
			<a href="${next}">다음</a> 
			<%
			}
			%>
		</div>
	</section>
	<aside>
		<div class="dropdown">
			<button onclick="dp_menu1()" class="button">차량 정보 추가</button>
			<div style="display: none;" id="drop-content1">
				<form METHOD="post" ACTION="2.usedcar_data_insert.jsp">
					차량번호 : <input type="text" name="car_number"><br> 차종 :
					<input type="text" name="car_type"><br> 차량명 : <input
						type="text" name="car_name"><br> 제조사 : <input
						type="text" name="made_company"><br> 가격 : <input
						type="text" name="price"><br> 연식 : <input type="text"
						name="made_year"><br> 주행거리 : <input type="text"
						name="dis_driven"><br> 연료종류 : <input type="text"
						name="fuel_type"><br> 색상 : <input type="text"
						name="color"><br> <input type="submit" value="등록">
				</form>
			</div>
		</div>
		<div class="dropdown">
			<button onclick="dp_menu2()" class="button">차량 정보 삭제</button>
			<div style="display: none;" id="drop-content2">
				<form METHOD="post" ACTION="8.usedcar_data_delete.jsp">
					차량번호 : <input type="text" name="car_number"><br> <input
						type="submit" value="등록">
			</div>
		</div>

		<script>
			function dp_menu1() {
				let click = document.getElementById("drop-content1");
				if (click.style.display === "none") {
					click.style.display = "block";

				} else {
					click.style.display = "none";

				}
			}
			function dp_menu2() {
				let click = document.getElementById("drop-content2");
				if (click.style.display === "none") {
					click.style.display = "block";

				} else {
					click.style.display = "none";

				}
			}
		</script>
		<input type="button" value="팝업창 호출" onclick="showPopup();" />
	</aside>
	<footer>
		<p>페이지 넘버 및 기타 구성</p>

	</footer>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
		totalrs.close();
	} catch (Exception e) {
	}
	try {
		listrs.close();
	} catch (Exception e) {
	}
	try {
		totalpstmt.close();
	} catch (Exception e) {
	}
	try {
		listpstmt.close();
	} catch (Exception e) {
	}
	try {
		con.close();
	} catch (Exception e) {
	}
	}
	%>

</body>
</html>