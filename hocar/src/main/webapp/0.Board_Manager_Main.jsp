<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>중고차는 역시 호카!</title>
<style>
form {
	float: left;
	width: 350px;
}

.header {
	margin-left:250px;
	width: 400px;
	height: 250px;
}
</style>
</head>

<body>
	<div class="header">
		<a href="0.logout.jsp"><img
			src="https://images-ext-1.discordapp.net/external/Ja623e9GRowal0l5iBHJ7ZEegy61fd_Ly9BmRref0uA/%3Fraw%3Dtrue/https/github.com/HWAN9/java.Project/blob/main/hocar.PNG?width=400&height=250"><br>
	</a>
	</div>
	<form ACTION="<%=request.getContextPath()%>/3.wbl_board.jsp">
		<button>구매희망자 페이지</button>
	</form>

	<form ACTION="<%=request.getContextPath()%>/3.wsl_board.jsp">
		<button>판매희망자 페이지</button>
	</form>

	<form
		ACTION="<%=request.getContextPath()%>/1.usedcar_board.jsp">
		<button>관리자 페이지</button>
	</form>

</body>
</html>
