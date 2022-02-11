<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>  
<%@ page import="java.sql.*"%>
<%@ page import="DAO.DB_Connection" %>
<%@ page import="DTO.usedCarVo" %>
    <jsp:useBean id="cardao" class="DAO.DB_Connection" scope="page"/>
    <jsp:useBean id="cardto" class="DTO.usedCarVo" scope="page"/>
    <jsp:useBean id="sev" class="DTO.usedCarVo" scope="page"/>
    
 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
private Connection con;
private Statement st;
private ResultSet rs;
private PreparedStatement pstmt;
private String url="jdbc:mysql://127.0.0.1:3306/jsp_practice?serverTimezone=UTC&useSSL=false";
private String dbID="root";
private String dbPW="1234";

%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection(
"jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false", 
"root", "1234");
st = con.createStatement();

out.print("정상연결");
%>

<%
String SQL = "SELECT * FROM usedcar where car_number= " + "'" + "01거1135" + "'";
try {
	ResultSet rs = st.executeQuery(SQL);

	while (rs.next()) {
		String car_number = rs.getString("car_number");
		String car_type = rs.getString("car_type");
		String car_name = rs.getString("car_name");
		String made_company = rs.getString("made_company");
		int price = rs.getInt("price");
		double made_year = rs.getDouble("made_year");
		int dis_driven = rs.getInt("dis_driven");
		String fuel_type = rs.getString("fuel_type");
		String color = rs.getString("color");

		System.out.printf("차량번호 : %s / ", car_number);
		System.out.printf("차량종류 : %s / ", car_type);
		System.out.printf("모델명 : %s / ", car_name);
		System.out.printf("제조사 : %s / ", made_company);
		System.out.printf("가격 : ", price + "만원 ");
		System.out.printf("연식 : %.0f년형 / ", made_year);
		System.out.printf("주행거리 : " ,dis_driven + "km ");
		System.out.printf("연료 : %s / ", fuel_type);
		System.out.printf("색상 : %s \n", color);
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>


</body>
</html>