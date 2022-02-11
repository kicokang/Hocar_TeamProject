<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String car_number=request.getParameter("car_number");
String car_type=request.getParameter("car_type");
String car_name=request.getParameter("car_name");
String made_company=request.getParameter("made_company");
String fuel_type=request.getParameter("fuel_type");
String color=request.getParameter("color");

DB_Connection cdao=new DB_Connection();
String a = cdao.test(car_type);
ArrayList<usedCarVo> dtos;	
%>
차타입:<jsp:getProperty property="car_type" name="cvo" /><br />
차타입:<%=cvo.getcar_type() %><br />
차이름:<%=a %><br />

<%
ArrayList<usedCarVo> usedcarList = new ArrayList<usedCarVo>();
dtos=cdao.getAllUsedCar();
%>

<%
for(int i=0;i<usedcarList.size();i++){
%>
<%
dtos.get(i).getcar_name();
cvo.getcar_name();
%>
<%
}
%>

</body>
</html>