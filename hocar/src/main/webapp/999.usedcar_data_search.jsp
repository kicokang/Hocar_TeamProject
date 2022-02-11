<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="DAO.DB_Connection"%>
<%@ page import="DTO.usedCarVo"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<jsp:useBean id="cvo" class="DTO.usedCarVo" />
<jsp:setProperty property="*" name="cvo" />
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

	String car_number=request.getParameter("car_number");

    DB_Connection cdao=new DB_Connection();

    ArrayList<usedCarVo>dtos;
    dtos=cdao.InsertusedCar(car_number, car_type, car_name, made_company, price, made_year, dis_driven, fuel_type, color)
    System.out.println("ㅇ");

%>

<%
for(int i=0; i<dtos.size();i++){
%>
	<div>dtos.get(i).getCar_Name();</div>



</body>
</html>