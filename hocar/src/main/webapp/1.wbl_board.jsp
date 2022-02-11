<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<h1>HOCAR 데이터베이스 관리</h1>
	<header>
		<h1>구매희망자 현황</h1>
	</header>
	<section>
		<%
		int currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		int totalRowCount = 0;

		Connection con = null;
		Statement st = null;
		ResultSet totalrs = null;
		ResultSet listrs = null;
		PreparedStatement totalpstmt = null;
		PreparedStatement listpstmt = null;
		String url = "jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false";
		String dbID = "root";
		String dbPW = "1234";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, dbID, dbPW);
			String totalSql = "Select count(*)from wishbuylist";
			totalpstmt = con.prepareStatement(totalSql);
			totalrs = totalpstmt.executeQuery();
			st = con.createStatement();
			if (totalrs.next()) {
				totalRowCount = totalrs.getInt(1);
			}
		%>
		<%
		int pagePerRow = 10;
		String listSql = "select * from wishbuylist order by car_number asc limit ?,?";

		listpstmt = con.prepareStatement(listSql);
		listpstmt.setInt(1, (currentPage - 1) * pagePerRow);
		listpstmt.setInt(2, pagePerRow);
		listrs = listpstmt.executeQuery();
		%>
		<table border="1">
			<thead>
				<th>구매자 이름</th>
				<th>구매자 ID</th>
				<th>전화번호</th>
				<th>차량번호</th>
				<th>E-Mail</th>
			</thead>
			<tbody>
				<%
				while (listrs.next()) {
				%>
				<tr>
					<td><%=listrs.getString("wishBuyUser_name")%></td>
					<td><%=listrs.getString("id")%></td>
					<td><%=listrs.getString("phone_num")%></td>
					<td><%=listrs.getString("car_number")%></td>
					<td><%=listrs.getString("email")%>@<%=listrs.getString("email2") %></td>				</tr>
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
		<div>
			<%
			if (currentPage > 1) {
			%>
			<a
				href="<%=request.getContextPath()%>/UserList/1.wbl_board.jsp?currentPage=<%=currentPage - 1%>">이전</a>
			<%
			}
			if (currentPage < lastPage) {
			%>
			<a
				href="<%=request.getContextPath()%>/UserList/1.wbl_board.jsp?currentPage=<%=currentPage + 1%>">다음</a>
			<%
			}
			%>
		</div>
	</section>
	<aside>
	<div class="dropdown">
			<button onclick="dp_menu2()" class="button">구매희망자 정보 삭제</button>
			<div style="display: none;" id="drop-content2">
				<form
					action="3.wbl_delete.jsp"
					
					method="post">

					<div>ID입력 :</div>
					<div>
						<input name="id" type="text">
					</div>
					<div>
						<input type="submit" value="삭제" /> <input type="reset"
							value="초기화" />
					</div>
				</form>
			</div>
		</div>
		<script>
			function dp_menu2() {
				let click = document.getElementById("drop-content2");
				if (click.style.display === "none") {
					click.style.display = "block";

				} else {
					click.style.display = "none";

				}
			}
		</script>
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