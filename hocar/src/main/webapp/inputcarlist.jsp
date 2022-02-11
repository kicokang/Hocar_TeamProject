<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form METHOD="post" ACTION="2.usedcar_data_insert.jsp">
차량번호 : <input type="text" name="car_number"><br>
차종 : <input type="text" name="car_type"><br>
차량명 : <input type="text" name="car_name"><br>
제조사 : <input type="text" name="made_company"><br>
가격 : <input type="text" name="price"><br>
연식 : <input type="text" name="made_year"><br>
주행거리 : <input type="text" name="dis_driven"><br>
연료종류 : <input type="text" name="fuel_type"><br>
색상 : <input type="text" name="color"><br>
<input type="submit" value="등록">
</form>
</body>
</html>