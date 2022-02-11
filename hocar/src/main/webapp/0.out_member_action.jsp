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
String outid = request.getParameter("outid");
String outpw = request.getParameter("outpw");

%>
<%
userDao udao=new userDao();
boolean check=udao.checkLogin(outid, outpw);
if(check==true){
	udao.deletUserInfo(outid);
	out.println("탈퇴 완료");
%>
	<a href="http://localhost:9997/hocar/0.join_member.jsp">확인</a>
<%
}else{
	out.println("아이디와 비밀번호를 확인하세요");
	%>
	<a href="http://localhost:9997/hocar/0.out_member.jsp">확인</a>
<%
}
%>

</body>
</html>