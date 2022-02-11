<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="DAO.userDao"%>
<%@page import="DTO.userVo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
request.setCharacterEncoding("UTF-8");
String modid = request.getParameter("modid");
%>

	<%
String dbUrl = "jdbc:mysql://127.0.0.1:3306/hocar_db?serverTimezone=UTC&useSSL=false";
String dbUser = "root";
String dbPw = "1234";
Connection con=null;
Statement st=null;
ResultSet totalrs=null;
ResultSet listrs=null;
PreparedStatement totalpstmt=null;
PreparedStatement listpstmt=null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection(dbUrl,dbUser,dbPw);
	String listSql="SELECT * FROM user WHERE id=?";
	
	listpstmt = con.prepareStatement(listSql);
	listpstmt.setString(1, modid);
	
	listrs=listpstmt.executeQuery();
%>
	<%
while (listrs.next()) {
%>

	DB에 수정할 데이터 정보 보내기
	<form action="0.modify_action.jsp" method="post">
이름 : <input name="name" value="<%=listrs.getString("name")%>" id="name" type="text" />
ID : <input type="text" name="modiid"value="<%=listrs.getString("id")%>" id="modiid"><br> 
PW : <input type="password" name="modipw" value="<%=listrs.getString("pw")%>" id="modipw"><br>
전화번호 : <input type="text" name="phone_num"value="<%=listrs.getString("phone_num")%>" id="phone_num" maxlength=13><br> 
주소 :<input type="text" name="getAddress" value="<%=listrs.getString("address")%>"id="getAddress"><br> 
이메일 : <input type="text"name="getEmail" value="<%=listrs.getString("email")%>" id="getEmail"><br>
@ : <input type="text" name="getEmail2" value="<%=listrs.getString("email2")%>" id="getEmail2">.com<br>
<input type="submit" value="수정"> 
	</form>
<%
}
%>

<%	
    }catch(Exception e){
    	e.printStackTrace();
    	response.sendRedirect("0.login_main.jsp");
    }finally{
    	try{totalrs.close();} catch(Exception e){}
    	try{listrs.close();} catch(Exception e){}
    	try{totalpstmt.close();} catch(Exception e){}
    	try{listpstmt.close();} catch(Exception e){}
    	try{con.close();} catch(Exception e){}
    }
%>  

</body>
</html>