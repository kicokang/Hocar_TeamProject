<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중고차는 역시 호카!</title>
<style>
header {
	background-color: #FFDEAD;
	width: 1800px;
	height: 100px;
}

section {
	width: 1800px;
	text-align: left;
	float: left;
	padding: 10px;
}

footer {
	background-color: #FFDEAD;
	width: 1800px;
	height: 100px;
	clear: both;
}

header, nav {
	text-align: center;
}

header {
	line-height: 100px;
}
.section > .slide {/* radio 박스가 안보이게 설정 */
display:none;
}
.section .slidewrap {/* 사진의 좌우 여백 남을시 제한,가리기*/
max-width:1800px;

overflow:hidden;
}
.section .slidelist {
white-space:nowrap;
font-size:0;
}
.section .slidelist > li {
display:inline-block;
vertical-align:middle;
width:100%;
transition:all .5s;
}
.section .slidelist > li > a {
display:block;
position:relative;
}
.section .slidelist > li > a lmg {
width:100%;
}
.section .slidelist label {/* 커서가 손가락 모양으로 바뀜 */
position:absolute;
z-index:10;     /* 3차원 설정으로 화살표 앞에 표시되게 */
top:50%;
transform:translateY(-50%);
padding:50px;
cursor:pointer;
}
.section .slidelist .left{ /* 좌우 이동 url,사진 */
left:30px;
background:url('https://media.discordapp.net/attachments/879272150723354647/909443289147658270/unknown.png') center center / 100% no-repeat;
}
.section .slidelist .right{
right:30px;
background:url('https://images-ext-1.discordapp.net/external/sU0hT6IAvm0sRdkPPjAPNqT1ovON57opE5nX25HQc2E/%3Fraw%3Dtrue/https/github.com/HWAN9/java.Project/blob/main/right.png') center center / 100% no-repeat;
}

.section input[id="slide04"]:checked ~ .slidewrap .slidelist > li {transform:translateX(0%);}
.section input[id="slide05"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-100%);}
.section input[id="slide06"]:checked ~ .slidewrap .slidelist > li {transform:translateX(-200%);}

.button {
float:left;
width:20%;
font-size:25px;
padding:5px 5px;
border-radius:5px;
}

form:nth-child(1){
position: relative;
left:50px;
}
form:nth-child(2){
position: relative;
left:300px;
}
form:nth-child(3){
position: relative;
left:600px;
}
.button {
	float: left;
	width: 20%;
	font-size: 25px;
	padding: 5px 5px;
	border-radius: 5px;
}

form:nth-child(1) {
	position: relative;
	left: 50px;
}

form:nth-child(2) {
	position: relative;
	left: 300px;
}

form:nth-child(3) {
	position: relative;
	left: 600px;
}
</style>
</head>

<body>

	<header>
		<h1>HOCAR</h1>
	</header>

	<section>
		<div class="section">
			<input class="slide" type="radio" name="slide" id="slide04" checked> <!--slide04 초기화면설정-->
			<input class="slide" type="radio" name="slide" id="slide05"> 
			<input class="slide" type="radio" name="slide" id="slide06">

			<div class="slidewrap">
				<ul class="slidelist">
					<li><a> <label for="slide06" class="left"></label> <img
							src="https://media.discordapp.net/attachments/879272150723354647/909470061750779914/unknown.png?width=960&height=409" width=1800px height=500px> <label
							for="slide05" class="right"></label> <!--for태그로 사진순환 넘버링  -->
					</a></li>
					<li><a> <label for="slide04" class="left"></label> <img
							src="https://media.discordapp.net/attachments/879272150723354647/909467728555946024/banner202131042AK6Q.jpg?width=960&height=264" width=1800px height=500px> <label
							for="slide06" class="right"></label>
					</a></li>
					<li><a> <label for="slide05" class="left"></label> <img
							src="https://media.discordapp.net/attachments/879272150723354647/909450558912475156/unknown.png?width=960&height=381" width=1800px height=500px> <label
							for="slide04" class="right"></label>
					</a></li>
				</ul>
			</div>
		</div>
	</section>
	<footer>
		<%
			Object id = session.getAttribute("id");
		%>
		<%
			if (id == null) {
		%><form ACTION="0.login.jsp">
			<button class="button" onclick="location.href='0.login.jsp' ">로그인</button>
		</form>
		<form ACTION="0.join_member.jsp">
			<button class="button" onclick="location.href='0.join_member.jsp' ">회원가입</button>
		</form>

		<%
			} else {
		%>
		<form ACTION="0.logout.jsp">
			<button class="button" onclick="location.href='0.logout.jsp' ">로그아웃</button>
		</form>

		<form ACTION="0.info_modify.jsp">
			<button class="button" onclick="location.href='0.info_modify.jsp' ">개인정보수정</button>
		</form>
	
	<%
		}
		%>




	</footer>
</body>
</html>