<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<html>
<head>
<meta charset="UTF-8">
<title>중고차는 역시 호카!</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	if (request.getParameter("car_number") == null) {
		response.sendRedirect(request.getContextPath() + "/1.usedcar_board.jsp");
	} else {
		String intput_car_number = request.getParameter("car_number");
		System.out.println("car_num:" + intput_car_number);

		String dbUrl = "jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false";
		String dbUser = "root";
		String dbPw = "1234";
		Connection con = null;
		Statement st = null;
		ResultSet totalrs = null;
		ResultSet listrs = null;
		PreparedStatement totalpstmt = null;
		PreparedStatement listpstmt = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			String listSql = "SELECT * FROM usedcar WHERE car_number=?";

			listpstmt = con.prepareStatement(listSql);
			listpstmt.setString(1, intput_car_number);

			listrs = listpstmt.executeQuery();
	%>
	<%
	while (listrs.next()) {
	%>

	<form action="1.usedcar_modify.jsp" method="post">
		차량번호 : <input name="car_number"
			value="<%=listrs.getString("car_number")%>" id="car_number"
			type="text" /> 차종 : <input type="text" name="searched_car_type"
			value="<%=listrs.getString("car_type")%>" id="searched_car_type"><br>
		차량명 : <input type="text" name="searched_car_name"
			value="<%=listrs.getString("car_name")%>" id="searched_car_name"><br>
		제조사 : <input type="text" name="searched_made_company"
			value="<%=listrs.getString("made_company")%>"
			id="searched_made_company"><br> 가격 : <input type="text"
			name="searched_price" value="<%=listrs.getString("price")%>"
			id="searched_price"><br> 연식 : <input type="text"
			name="searched_made_year" value="<%=listrs.getString("made_year")%>"
			id="searched_made_year"><br> 주행거리 : <input type="text"
			name="searched_dis_driven"
			value="<%=listrs.getString("dis_driven")%>" id="searched_dis_driven"><br>
		연료종류 : <input type="text" name="searched_fuel_type"
			value="<%=listrs.getString("fuel_type")%>" id="searched_fuel_type"><br>
		색상 : <input type="text" name="searched_color"
			value="<%=listrs.getString("color")%>" id="searched_color"><br>
		<input type="submit" value="수정">
	</form>

	<%
	}
	%>

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


	<%
	}
	%>
</body>
</html>