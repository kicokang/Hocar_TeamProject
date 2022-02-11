<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차는 역시 호카!</title>
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

#container {
	width: 2000;
	margin: 0 auto;
	position: relative;
	clear: both;
}
#content {
	width: 1800px;
	margin: 0 auto;
	padding: 10px;
	overflow: hidden;
	margin-right: 50 px;
	justify-content: center;
	align-items: center;
}
#content > #section {
	width: 1350px;
	height: 800px;
	margin-left: 250px;
	margin-top: 50px;
}
table {
	width: 1300px;
	margin: auto;
}
</style>
</head>
<body>
	<h1>HOCAR 데이터베이스 관리</h1>
	<div id="header">
		<a href="0.Board_Manager_Main.jsp"> <img src="hocar.PNG"
			width=200px height=100px align="left">
		</a> <br>
		<h1>판매희망자 현황</h1>
	</div>
	<div id="container">
		<div id="content">
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
					String totalSql = "Select count(*)from wishselllist";
					totalpstmt = con.prepareStatement(totalSql);
					totalrs = totalpstmt.executeQuery();
					st = con.createStatement();
					if (totalrs.next()) {
						totalRowCount = totalrs.getInt(1);
					}
				%>
				<%
				int pagePerRow = 10;
				String listSql = "select * from wishselllist order by car_number asc limit ?,?";

				listpstmt = con.prepareStatement(listSql);
				listpstmt.setInt(1, (currentPage - 1) * pagePerRow);
				listpstmt.setInt(2, pagePerRow);
				listrs = listpstmt.executeQuery();
				%>
				<table border="1">
					<thead>
						<th>판매자 이름</th>
						<th>전화번호</th>
						<th>차량번호</th>
						<th>E-Mail</th>
					</thead>
					<tbody>
						<%
						while (listrs.next()) {
						%>
						<tr>
							<td><%=listrs.getString("wishSellUser_name")%></td>
							<td><%=listrs.getString("phone_num")%></td>
							<td><%=listrs.getString("car_number")%></td>
							<td><%=listrs.getString("email")%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>

				<br> 현재 페이지:
				<%=currentPage%>
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
						href="<%=request.getContextPath()%>3.wsl_board.jsp?currentPage=<%=currentPage - 1%>">이전</a>
					<%
					}
					if (currentPage < lastPage) {
					%>
					<a
						href="<%=request.getContextPath()%>3.wsl_board.jsp?currentPage=<%=currentPage + 1%>">다음</a>
					<%
					}
					%>
				</div>
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
</body>
</html>