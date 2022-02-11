<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차는 호카!</title>
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
<link href="../css/section.css" rel="stylesheet" type="text/css">
<link href="../css/content.css" rel="stylesheet" type="text/css">
<style>
body {
	text-align: center;
	margin: 0 auto;
}

#header {
	clear: both;
	height: 100px;
	background-color: #FFDEAD;
}

#content>#aside {
	width: 250px;
	height: 500px;
	float: left;
}

table {
	width: 1300px;
	margin-left: 50px;
	margin-right: 0px;
}
#container {
	width: 2000;
	margin: 0 auto;
	position: relative;
	clear: both;
}
.dropdown {
	display: inline-block;
	position: relative;
}

.button {
	width: 250px;
	height: 50px;
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
input {
	width: 140px;
}
</style>
</head>
<body>
	<h1>HOCAR 데이터베이스 관리</h1>
	<div id="header">
		<a href="0.Board_Manager_Main.jsp"> <img src="hocar.PNG"
			width=200px height=100px align="left">
		</a> <br>
		<h1>구매희망자 현황</h1>
	</div>
	<div id="container">
		<div id="content">
			<div id="aside">
				<div class="dropdown">
					<button onclick="dp_menu2()" class="button">구매희망자 정보 삭제</button>
					<div style="display: none;" id="drop-content2">
						<form action="3.wbl_delete.jsp" method="post">

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
			</div>
			<div id="section">
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
							<td><%=listrs.getString("email")%></td>
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
						href="<%=request.getContextPath()%>3.wbl_board.jsp?currentPage=<%=currentPage - 1%>">이전</a>
					<%
					}
					if (currentPage < lastPage) {
					%>
					<a
						href="<%=request.getContextPath()%>3.wbl_board.jsp?currentPage=<%=currentPage + 1%>">다음</a>
					<%
					}
					%>
				</div>
			</div>
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
		</div>
	</div>
</body>
</html>