<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
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
		String car_number = request.getParameter("car_number");
		String dbUrl = "jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false";
		String dbUser = "root";
		String dbPw = "1234";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			String sql = "DELETE FROM usedcar WHERE car_number=?";
			statement = connection.prepareStatement(sql);
			statement.setString(1, car_number);
			if (statement.executeUpdate() == 1) {
		response.sendRedirect(request.getContextPath() + "/1.usedcar_board.jsp");
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
	}
	%>
</body>
</html>