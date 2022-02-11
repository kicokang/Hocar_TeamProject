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
if(request.getParameter("car_number") == null) {
    response.sendRedirect(request.getContextPath()+"/3.Board_list.jsp");
} else{
	String car_number=request.getParameter("car_number");
    System.out.println("car_number");

    DB_Connection cdao=new DB_Connection();
    cdao.DeleteusedCar(car_number);
    
    System.out.println("삭제완료");
}

%>
</body>
</html>