<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차는 역시 호카!</title>
<script type="text/javascript">
	function showPopup() {
		window.open("1.inputdata.jsp", "a",
				"width=400, height=300, left=100, top=50");
	}
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

.dropdown1 {
	display: inline-block;
	position: relative;
}

.dropdown2 {
	display: inline-block;
	position: relative;
	padding-top: 20px;
}

.dropdown3 {
	padding-top: 20px;
}

.dropdown4 {
	padding-top: 20px;
}

#container {
	width: 2000;
	margin: 0 auto;
	position: relative;
	clear: both;
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
		<a href="0.Board_Manager_Main.jsp"> <img src="hocar.PNG" width=200px
			height=100px align="left">
		</a>
		<br>
		<h1>등록된 차량 현황</h1>
	</div>
	<div id="container">
		<div id="content">
			<div id="aside">
				<div class="dropdown1">
					<button onclick="dp_menu1()" class="button">차량 정보 추가</button>
					<div style="display: none; padding-top: 20px;" id="drop-content1">
						<form METHOD="post" ACTION="1.usedcar_data_insert.jsp">
							차량번호 : <input type="text" name="car_number"><br>
							차량종류 : <input type="text" name="car_type"><br> 차량이름
							: <input type="text" name="car_name"><br> 제조업체 : <input
								type="text" name="made_company"><br> 차량가격 : <input
								type="text" name="price"><br> 차량연식 : <input
								type="text" name="made_year"><br> 주행거리 : <input
								type="text" name="dis_driven"><br> 연료타입 : <input
								type="text" name="fuel_type"><br> 색상타입 : <input
								type="text" name="color"><br> <br> <input
								type="submit" value="등록">

						</form>
					</div>
				</div>
				<div class="dropdown2">
					<button onclick="dp_menu2()" class="button">차량 정보 삭제</button>
					<div style="display: none;" id="drop-content2">
						<form
							action="<%=request.getContextPath()%>/1.usedcar_delete.jsp"
							method="post">
							<div style="padding-top: 20px;">
								차량번호 : <input name="car_number" type="text">
							</div>
							<br>
							<div>
								<input type="submit" style="width: 60px;" value="삭제" /> &nbsp;
								<input type="reset" style="width: 60px;" value="초기화" />
							</div>
						</form>
					</div>
				</div>
				<div class="dropdown3">
					<button class="button" onclick="showPopup();">차량 정보 수정</button>
				</div>
				<div class="dropdown4">
					<form ACTION="<%=request.getContextPath()%>/0.Board_Manager_Main.jsp">
						<button class="button">메인 페이지로</button>
					</form>
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
					String totalSql = "Select count(*)from usedcar";
					totalpstmt = con.prepareStatement(totalSql);
					totalrs = totalpstmt.executeQuery();
					st = con.createStatement();
					if (totalrs.next()) {
						totalRowCount = totalrs.getInt(1);
					}
				%>
				<%
				int pagePerRow = 25;
				String listSql = "select * from usedcar order by car_number asc limit ?,?";

				listpstmt = con.prepareStatement(listSql);
				listpstmt.setInt(1, (currentPage - 1) * pagePerRow);
				listpstmt.setInt(2, pagePerRow);
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
						<th>주행거리(KM)</th>
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
						href="<%=request.getContextPath()%>/1.usedcar_board.jsp?currentPage=<%=currentPage - 1%>">이전</a>
					<%
					}
					if (currentPage < lastPage) {
					%>
					<a
						href="<%=request.getContextPath()%>/1.usedcar_board.jsp?currentPage=<%=currentPage + 1%>">다음</a>
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