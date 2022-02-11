<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고차는 역시 호카!</title>
</head>
<body>
	<%
	session.removeAttribute("id");
	//메인화면으로 돌아갈 화면입력
	response.sendRedirect("0.login_main.jsp");
	%>
</body>
</html>