<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<%			
request.setCharacterEncoding("UTF-8");

String car_name=request.getParameter("car_name");
Object currentPage = session.getAttribute("currentPage");
System.out.println("car_name:" + car_name);
System.out.println("currentPage:" + currentPage);

request.setAttribute("car_name",car_name);
request.setAttribute("currentPage",currentPage);
pageContext.forward("NewFile2.jsp");%>


<%

%>
</body>
</html>