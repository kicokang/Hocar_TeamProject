<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고차는 역시 호카!</title>

<style>
.main {
	width: 1200px;
	height: 400px;
	text-align: center;
	position: relative;
	clear: both;
}
header {
	background-color: #FFDEAD;
	width: 1200px;
	height: 50px;
	text-align: center;
}
footer {
	width: 1200px;
	height: 50px;
	background-color: #FFDEAD;
	text-align: center;
	padding: 10px;
}
</style>

</head>
<body>

	<header>
	<H1>HOCAR 회원가입</H1>
	</header>
	<br>

	<div class="main">
		<form METHOD="post" ACTION="0.join_action.jsp">
            이름 : <input type="text" name="name">
        <br>
            아이디 : <input type="text" name="newid">
        <br>
            비밀번호 : <input type="password" name="newpw">
        <br>
            휴대폰 번호 : <input type="text" name="phone_num" required size=11>
        <br>
            주소 : <input type="text" name="address">
        <br>
            이메일 : <input type="text" name="email"> @: <input type="text"
                name="email2">.com<br>
        <br>
            <input type="submit" value="회원가입">
        </form>
		<br>
		<br>
		<form ACTION="0.login_main.jsp">
			<button class="button" onclick="location='0.login_main.jsp'">돌아가기</button>
		</form>
	</div class="main">
	<br>

	<footer>

	<div></div>

	</footer>

</body>
</html>
