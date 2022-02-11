<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고차는 역시 호카!</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	if (request.getParameter("car_number") == null || request.getParameter("car_number") == null) {
		response.sendRedirect(request.getContextPath() + "/1.usedcar_board.jsp");
	} else {
		String incarNumber = request.getParameter("car_number");
		String carType = request.getParameter("searched_car_type");
		String carName = request.getParameter("searched_car_name");
		String madeCompany = request.getParameter("searched_made_company");
		int setPrice = Integer.parseInt(request.getParameter("searched_price"));
		int madeYear = Integer.parseInt(request.getParameter("searched_made_year"));
		int disDriven = Integer.parseInt(request.getParameter("searched_dis_driven"));
		String fuelType = request.getParameter("searched_fuel_type");
		String setColor = request.getParameter("searched_color");

		String dbUrl = "jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false";
		String dbUser = "root";
		String dbPw = "1234";
		Connection connection = null;
		PreparedStatement statement = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
			String selectSql = "UPDATE usedcar SET car_type=?, car_name=?, made_company=?, price=?,made_year=? ,dis_driven=? ,fuel_type=? , color=? WHERE car_number=?";
			statement = connection.prepareStatement(selectSql);
			statement.setString(1, carType);
			statement.setString(2, carName);
			statement.setString(3, madeCompany);
			statement.setInt(4, setPrice);
			statement.setInt(5, madeYear);
			statement.setInt(6, disDriven);
			statement.setString(7, fuelType);
			statement.setString(8, setColor);
			statement.setString(9, incarNumber);
			
			statement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			out.print("ERROR!");
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

