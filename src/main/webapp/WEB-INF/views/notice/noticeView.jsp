<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<style>
* {
	font-weight: bold;
}

li {
	list-style: none;
	padding-left: 0px;
}

main {
	width: 1320px;
	height: 940px;
	vertical-align: center;
	position: relative;
	top: 600px;
	left: 50%;
	transform: translate(-50%, -50%);
	margin-top: 40px;
}

.order_box {
	width: 745px;
	position: fixed;
	top: 77px;
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

.order {
	width: 460px;
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
}

#menu {
	position: relative;
	top: -50px;
}

#menu h2 {
	font-size: 40px;
	margin-bottom: 15px;
}

hr {
	height: 1px;
	background-color: #FF7373;
	border: none;
	margin: 10px 0;
}

#writing_view {
	width: 1100px;
	height: 515px;
	position: absolute;
	top: 32px;
	right: 105px;
	border: 3px solid #FF8F8F;
	border-radius: 10px;
}

.title {
	width: 970px;
	height: 40px;
	text-align: left;
	font-size: 25px;
	position: absolute;
	top: 30px;
	left: 60px;
	line-height: 40px;
}

.content {
	width: 970px;
	height: 360px;
	resize: none;
	position: absolute;
	top: 78px;
	left: 60px;
	font-size: 15px;
}

#writing_view ul {
	width: 350px;
	display: flex;
	position: absolute;
	top: 472px;
	left: 45px;
}

#writing_view li {
	width: 150px;
	text-align: center;
}

#writing_view input {
	border-radius: 10px;
}

#writing_view textarea {
	border-radius: 10px;
}

.filebox {
	width: 1100px;
	height: 50px;
	position: absolute;
	top: 591px;
	right: 103px;
	border: 3px solid #FF8F8F;
	border-radius: 30px;
}

.filebox p {
	display: inline-block;
}

.file1 {
	position: absolute;
	top: 18px;
	left: 34px;
}

#btn {
	width: 1200px;
	height: 50px;
	display: flex;
	justify-content: flex-end;
	position: relative;
	top: 610px;
}

#btn button {
	width: 120px;
	padding: 10px;
	margin: 0 10px;
	font-size: 25px;
	background-color: #FFEFEF;
	border: #FFEFEF;
	border-radius: 30px;
}

#btn :hover {
	border-radius: 30px;
	box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
	cursor: pointer;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.filebox label {
	width: 80px;
	position: absolute;
	top: 9px;
	left: 957px;
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	text-align: center;
	line-height: normal;
	vertical-align: middle;
	background-color: #FFE7E7;
	cursor: pointer;
	border: #FFEFEF;
	border-radius: 30px;
}

/* named upload */
.filebox .upload-name {
	width: 300px;
	position: absolute;
	top: 9px;
	left: 120px;
	display: inline-block;
	padding: .5em .75em; /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #FFFFFF;
	border: 1px solid #FFFFFF;
	border-bottom-color: #FFFFFF;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
</style>
</head>
<body>

	<div class="order_box">
		<ul class="order">
			<li style="color: #CE8080;">공지사항</li>
			<li>|</li>
			<li>문의사항</li>
			<li>|</li>
			<li>건강상담소</li>
		</ul>
	</div>

	<main>
		<div id="menu">
			<h2>공지사항</h2>
			<hr>
		</div>
		<form action="">
			<div id="writing_view">
				<div class="title">제목</div>
				<div class="content">내용</div>
				<ul>
					<li>작성자</li>
					<li>2023.01.10</li>
					<li>AM 00:00</li>
				</ul>
			</div>
			<div class="filebox">
				<p class="file1">첨부파일</p>
				<input class="upload-name" value="파일선택" disabled="disabled">
				<input type="file" id="ex_filename" class="upload-hidden">
			</div>
			<div id="btn">
				<button>수정</button>
				<button>삭제</button>
				<button>목록</button>
			</div>
		</form>
	</main>
	<footer>
		<div class="footer_brand">
			<ul>
				<li><a href="#"> <i class="xi-instagram"></i>
				</a></li>
				<li><a href="#"> <i class="xi-youtube-play"></i>
				</a></li>
				<li><a href="#"> <i class="xi-facebook-official"></i>
				</a></li>
				<li><a href="#"> <i class="xi-twitter"></i>
				</a></li>
			</ul>
		</div>
		<div class="footer_text">
			<p>
				<span> HealthCare</span><br /> <span> Email :
					healthcareeeee@gmail.com</span><br />
			</p>
		</div>
	</footer>


</body>
</html>