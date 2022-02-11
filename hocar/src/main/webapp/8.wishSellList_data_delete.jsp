<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="DAO.wishSellListDao"%>
<%@ page import="DTO.wishSellListVo"%>
<jsp:useBean id="svo" class="DTO.wishSellListVo" />
<jsp:setProperty property="*" name="svo" />
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
if(request.getParameter("car_name") == null) {
    response.sendRedirect(request.getContextPath()+"/3.Board_list.jsp");
} else{
	String car_name=request.getParameter("car_name");

	wishSellListDao sdao=new wishSellListDao();
    sdao.deleteSellList(car_name);
    
    System.out.println("삭제완료");
}

%>
</body>
</html>