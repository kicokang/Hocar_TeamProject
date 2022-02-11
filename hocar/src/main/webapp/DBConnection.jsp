<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>  
<%@ page import="java.sql.*"%>
<%@ page import="DAO.DB_Connection" %>
<%@ page import="DTO.usedCarVo" %>
    <jsp:useBean id="cardao" class="DAO.DB_Connection" scope="page"/>
    <jsp:useBean id="cardto" class="DTO.usedCarVo" scope="page"/>

    
 
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

String car_number_arr[]=new String [30];
String car_type_arr[]=new String [30];
String car_name_arr[]=new String [30];
String made_company_arr[]=new String [20];
int price_arr[]=new int[10];
double made_year_arr[]=new double[10];
int dis_dirven_arr[]=new int[10];
String fuel_type_arr[]=new String[20];
String color_arr[]=new String[10];
%>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
con = DriverManager.getConnection(
"jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false", 
"root", "1234");
st = con.createStatement();

int i = 0;
%>

<%
String SQL = "SELECT * FROM usedcar where car_number= " + "'" + "01거1135" + "'";
try {
	ResultSet rs = st.executeQuery(SQL);
	
	while (rs.next()) {
		String car_number = rs.getString("car_number");
		car_number_arr[i]=car_number;
		
		String car_type = rs.getString("car_type");
		car_type_arr[i]=car_type;
		
		String car_name = rs.getString("car_name");
		car_name_arr[i]=car_name;
		
		String made_company = rs.getString("made_company");
		made_company_arr[i]=made_company;
		
		int price = rs.getInt("price");
		price_arr[i]=price;
		
		double made_year = rs.getDouble("made_year");
		made_year_arr[i]=made_year;
				
		int dis_driven = rs.getInt("dis_driven");
		dis_dirven_arr[i]=dis_driven;
				 
		String fuel_type = rs.getString("fuel_type");
		fuel_type_arr[i]=fuel_type;
		
		String color = rs.getString("color");
		color_arr[i]=color;

		out.println("차량번호 :  "+ car_number+"<br>");
		out.println("차량종류 : "+ car_type+"<br>");
		out.println("모델명 : "+ car_name+"<br>");
		out.println("제조사 : "+ made_company+"<br>");
		out.println("가격 : "+ price + "만원 "+"<br>");
		out.println("연식 : "+ made_year+"<br>");
		out.println("주행거리 : " + dis_driven + "km "+"<br>");
		out.println("연료 : "+ fuel_type+"<br>");
		out.println("색상 : "+ color+"<br>");
		
		i++;
	}
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>


</body>
</html>