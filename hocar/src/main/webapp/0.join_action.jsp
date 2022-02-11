<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DAO.userDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차는 역시 호카!</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
String newid=request.getParameter("newid");
String newpw=request.getParameter("newpw");
String phone_num=request.getParameter("phone_num");
String address=request.getParameter("address");
String email=request.getParameter("email");
String email2=request.getParameter("email2");

boolean id_check=true;
userDao udao=new userDao();

id_check=udao.checkDuplicateId(newid);
if(id_check==false){
	System.out.println("중복 아이디가 존재합니다.");
	response.sendRedirect("0.notice.jsp");
}else{
	udao.newJoinMember(name, newid, newpw, phone_num, address, email, email2);
	System.out.println("회원가입완료 !.");
	response.sendRedirect("0.login_main.jsp");
}
%>
</body>
</html>