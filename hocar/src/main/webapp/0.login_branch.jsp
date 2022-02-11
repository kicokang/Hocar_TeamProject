<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DAO.userDao"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차는 역시 호카!</title>
</head>
<body>
<%
String id=request.getParameter("id");
String pw=request.getParameter("pw");

userDao udao=new userDao();
boolean result=udao.checkLogin(id,pw);
String email="sodeo123";

if(result==true){
	String manager=udao.getEmail(id);
	System.out.printf("manager",manager);
	if(manager.equals(email)==true){
		//관리자로
		System.out.println("로그인 성공!:세션에 값 저장!");
		session.setAttribute("id", id);
		response.sendRedirect("0.Board_Manager_Main.jsp");
	}else{
		//사용자로
		System.out.println("로그인 성공!:세션에 값 저장!");
		session.setAttribute("id", id);
		response.sendRedirect("2.Board_Main.jsp");
	}
} else {
	System.out.println("로그인 실패!");
	response.sendRedirect("0.login_main.jsp");
}
%>
<%

%>

</body>
</html>