<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String wishBuyUser_name = request.getParameter("wishBuyUser_name");
System.out.println("wishBuyUser_name:"+wishBuyUser_name);
String id = request.getParameter("id");
String phone_num = request.getParameter("phone_num");
String car_number = request.getParameter("car_number");
String email = request.getParameter("email");

String dbUrl = "jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false";
String dbUser = "root";
String dbPw = "1234";
Connection con = null;
PreparedStatement pstmt = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(dbUrl, dbUser, dbPw);
    
String sql 
= "INSERT INTO wishbuylist values(?,?,?,?,?)";

pstmt = con.prepareStatement(sql);
pstmt.setString(1,wishBuyUser_name);
pstmt.setString(2,id);
pstmt.setString(3,phone_num);
pstmt.setString(4,car_number);
pstmt.setString(5,email);

pstmt.executeUpdate();

} catch(Exception e) {
    e.printStackTrace();
    out.print("입력 예외 발생");
} finally {
    try {pstmt.close();} catch(Exception e){}
    try {con.close();} catch(Exception e){}
}

%>
</body>
</html>

