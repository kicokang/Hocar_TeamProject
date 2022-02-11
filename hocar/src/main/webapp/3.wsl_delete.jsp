<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	String car_number = request.getParameter("car_number");
	System.out.print(car_number);
	String dbUrl = "jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false";
	String dbUser = "root";
	String dbPw = "1234";
	Connection connection = null;
	PreparedStatement statement = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
		String sql = "DELETE FROM wishselllist WHERE car_number=?";
		statement = connection.prepareStatement(sql);
		statement.setString(1, car_number);
		statement.executeUpdate();

		if (statement.executeUpdate() == 0) {
			response.sendRedirect("2.wsl_board.jsp");
		}
	} catch (Exception e) {
		e.printStackTrace();
		out.print("입력 예외 발생");
	} finally {
		try {
			statement.close();
		} catch (Exception e) {
		}
		try {
			connection.close();
		} catch (Exception e) {
		}
	}
	%>
</body>
</html>