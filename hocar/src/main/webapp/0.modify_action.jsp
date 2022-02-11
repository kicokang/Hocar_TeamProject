<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DAO.userDao" %>
    <%@page import="DTO.userVo" %>
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

request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
String modiid = request.getParameter("modiid");
String modipw = request.getParameter("modipw");
String phone_num = request.getParameter("phone_num");
String getAddress = request.getParameter("getAddress");
String getEmail = request.getParameter("getEmail");
String getEmail2 = request.getParameter("getEmail2");
%>
<%
userDao udao=new userDao();
udao.modiInfo(name, modiid, modipw, phone_num, getAddress, getEmail, getEmail2);
%>
	
<%
System.out.println("정보 수정 완료");
response.sendRedirect("0.login_main.jsp");
%>


</body>
</html>