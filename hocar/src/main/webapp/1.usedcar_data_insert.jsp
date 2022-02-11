<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>중고차는 역시 호카!</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String car_number = request.getParameter("car_number");
	System.out.println("car_number:" + car_number);
	String car_type = request.getParameter("car_type");
	String car_name = request.getParameter("car_name");
	String made_company = request.getParameter("made_company");
	int price = Integer.parseInt(request.getParameter("price"));
	int made_year = Integer.parseInt(request.getParameter("made_year"));
	int dis_driven = Integer.parseInt(request.getParameter("dis_driven"));
	String fuel_type = request.getParameter("fuel_type");
	String color = request.getParameter("color");

	String dbUrl = "jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false";
	String dbUser = "root";
	String dbPw = "1234";
	Connection con = null;
	PreparedStatement pstmt = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection(dbUrl, dbUser, dbPw);

		String sql = "INSERT INTO usedcar values(?,?,?,?,?,?,?,?,?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, car_number);
		pstmt.setString(2, car_type);
		pstmt.setString(3, car_name);
		pstmt.setString(4, made_company);
		pstmt.setInt(5, price);
		pstmt.setInt(6, made_year);
		pstmt.setInt(7, dis_driven);
		pstmt.setString(8, fuel_type);
		pstmt.setString(9, color);
		pstmt.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
		out.print("입력 예외 발생");
	} finally {
		try {
			pstmt.close();
		} catch (Exception e) {
		}
		try {
			con.close();
		} catch (Exception e) {
		}
	}
	%>
	
	<% response.sendRedirect(request.getContextPath() + "/1.usedcar_board.jsp"); %>

</body>
</html>

