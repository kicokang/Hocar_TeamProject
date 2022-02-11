<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>
<h1>BOARD VIEW</h1>
<%
if(request.getParameter("boardNo") == null) {
	
	
	
    response.sendRedirect(request.getContextPath()+"/board/3.Board_List.jsp");
} else {
    int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    System.out.println("boardNo :"+boardNo);
    String dbUrl = "jdbc:mysql://127.0.0.1:3306/jsp_board?serverTimezone=UTC&useSSL=false";
    String dbUser = "root";
    String dbPw = "1234";
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(dbUrl, dbUser, dbPw);
String sql 
= "SELECT board_title, board_content, board_user, board_date FROM jsp_board_table WHERE board_no=?";
        statement = connection.prepareStatement(sql);
        statement.setInt(1, boardNo);
        resultSet = statement.executeQuery();
        if(resultSet.next()) {
%>
            <div>board_no :</div>
            <div><%=boardNo%></div>
            <div>board_title :</div>
            <div><%=resultSet.getString("board_title")%></div>
            <div>board_content :</div>
            <div><%=resultSet.getString("board_content")%></div>
            <div>board_user :</div>
            <div><%=resultSet.getString("board_user")%></div>
            <div>board_date :</div>
            <div><%=resultSet.getString("board_date")%></div>     
            
            <div>
    	<a href="<%=request.getContextPath()%>/board/7.Board_Modify.jsp?boardNo=<%=boardNo%>">수정</a>
    	<a href="<%=request.getContextPath()%>/board/5.Board_Remove.jsp?boardNo=<%=boardNo%>">삭제</a>
			</div>
<%
        }
    } catch(Exception e) {
        e.printStackTrace();
        out.println("BOARD VIEW ERROR!");
    } finally {
        try {resultSet.close();} catch(Exception e){}
        try {statement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
}
%>
<input type="button" name="back_page" value="이전"onclick="location.href='0.Select.html'">

</body>

</html>

