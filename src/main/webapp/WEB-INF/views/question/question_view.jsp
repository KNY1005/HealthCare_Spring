<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 상세보기</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="${path }/resources/image/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${path }/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path }/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<link href="${path}/resources/css/footer.css" rel="stylesheet" />
<style>
/*-----------------sub_nav_menu > start---------------*/
#height {
	height: 80px;
}

.sub_nav_menu {
	margin: 0 0 120px 150px;
}
.sub_nav_menu li {
	text-align: center;
	float: left;
	font-weight: bold;
	font-size: 20px;
	margin-left:20px;
	margin-right:20px;
}
.sub_nav_menu li:nth-child(3){
    color:red;
} 
/*-----------------sub_nav_menu > end---------------*/
main h2 {
	font-size: 40px;
	font-weight: bold;
}

main hr {
	height: 3px;
	background-color: #FF8F8F;
	border: none;
	margin: 10px 0;
}

main {
	width: 1320px;
	font-weight: bold;
	position: relative;
	margin: 0 auto 0;
}

/*질문 상세 뷰 박스*/
main #view #writing_view {
	width: 1100px;
	height: 650px;
	position: relative;
	margin-top: 30px;
	margin-left: 110px;
	border: 3px solid #FF8F8F;
	border-radius: 25px;
}

main #view #writing_view .title {
	width: 1000px;
	height: 40px;
	text-align: left;
	font-size: 25px;
	position: absolute;
	margin-top: 30px;
	margin-left: 50px;
}

main #view #writing_view .content {
	width: 1000px;
	height: 360px;
	position: absolute;
	margin-top: 80px;
	margin-left: 50px;
}

/*작성자, 작성일, 작성시간*/
main #view #writing_view ul {
	position: absolute;
	top: 465px;
	left: 50px;
}

main #view #writing_view li {
	display: inline-block;
	margin-right: 40px;
}

/*첨부파일 업로드 부분*/
main #view #writing_view #file {
	width: 1000px;
	height: 50px;
	position: absolute;
	top: 510px;
	left: 47px;
	border: 3px solid #FF8F8F;
	border-radius: 30px;
}

main #view #writing_view #file p {
	display: inline-block;
}

main #view #writing_view #file .file1 {
	position: absolute;
	top: 18px;
	left: 34px;
}

main #view #writing_view #file .file2 {
	position: absolute;
	top: 18px;
	left: 145px;
}

/*답변, 수정, 삭제버튼*/
main #view #writing_view #button {
	width: 380px;
	height: 40px;
	position: absolute;
	bottom: 22px;
	right: 14px;
}

main #view #writing_view #button button {
	font-weight: bold;
	width: 100px;
	padding: 10px;
	margin: 0 10px;
	font-size: 15px;
	background-color: #FFEFEF;
	border: #FFEFEF;
	border-radius: 30px;
}

/*전문의 답변 작성란*/
main #doctor_write {
	width: 1100px;
	margin-left: 110px;
}

main #doctor_write h2 {
	font-size: 35px;
	font-weight: bold;
	margin-top: 30px;
}

main #doctor_write #doctor_writing_content {
	width: 1100px;
	height: 280px;
	position: relative;
	margin-top: 10px;
	border: 3px solid #FF8F8F;
	border-radius: 25px;
}

main #doctor_write #doctor_writing_content input {
	border-radius: 10px;
	width: 1000px;
	height: 35px;
	text-align: left;
	font-size: 25px;
	position: absolute;
	margin-top: 10px;
	margin-left: 50px;
}

main #doctor_write #doctor_writing_content textarea {
	width: 1000px;
	height: 150px;
	position: absolute;
	margin-top: 45px;
	margin-left: 50px;
	border-radius: 10px;
}

main #doctor_write #doctor_writing_content #button {
	width: 250px;
	height: 40px;
	position: absolute;
	bottom: 10px;
	right: 14px;
}

main #doctor_write #doctor_writing_content #button button {
	font-weight: bold;
	width: 100px;
	padding: 10px;
	margin: 0 10px;
	font-size: 15px;
	background-color: #FFEFEF;
	border: #FFEFEF;
	border-radius: 30px;
}

/*전문의 답변 뷰박스*/
main #doctor_view {
	width: 1100px;
	margin-left: 110px;
	margin-top: 30px;
}

main #doctor_view #doctor_writing_view {
	width: 1100px;
	height: 280px;
	position: relative;
	margin-top: 10px;
	border: 3px solid #FF8F8F;
	border-radius: 25px;
}

main #doctor_view #doctor_writing_view .title {
	border-radius: 10px;
	width: 1000px;
	height: 35px;
	text-align: left;
	font-size: 25px;
	position: absolute;
	margin-top: 10px;
	margin-left: 50px;
}

main #doctor_view #doctor_writing_view .content {
	width: 1000px;
	height: 150px;
	position: absolute;
	margin-top: 45px;
	margin-left: 50px;
	border-radius: 10px;
}

main #doctor_view #doctor_writing_view ul {
	position: absolute;
	top: 465px;
	left: 50px;
}

main #doctor_view #doctor_writing_view li {
	display: inline-block;
	margin-right: 40px;
}

main #doctor_view #doctor_writing_view #button {
	width: 250px;
	height: 40px;
	position: absolute;
	bottom: 10px;
	right: 14px;
}

main #doctor_view #doctor_writing_view #button button {
	font-weight: bold;
	width: 100px;
	padding: 10px;
	margin: 0 10px;
	font-size: 15px;
	background-color: #FFEFEF;
	border: #FFEFEF;
	border-radius: 30px;
}
</style>
</head>

<body>
	<%@include file="../includes/header.jsp"%>
	<div id="height"></div>
	<div class="sub_nav_menu">
		<ul>
			<li>공지사항</li>
			<li>|</li>
			<li>문의사항</li>
			<li>|</li>
			<li>건강상담소</li>			
		</ul>
	</div>
<body>
	<main>
		<h2>건강상담소 상세</h2>
		<hr>

		<!--/*질문 상세 뷰 박스*/-->
		<section id="view">
			<div id="writing_view">
				<div class="title">제목</div>
				<div class="content">여기는 내용 입니당 뀨.</div>
				<ul>
					<li>작성자</li>
					<li>작성일</li>
					<li>작성날짜</li>
				</ul>
				<div id="file">
					<p class="file1">첨부파일</p>
					<p class="file2">첨부파일.PDF</p>
				</div>
				<!--//#file-->
				<div id="button">
					<button>답변</button>
					<button>수정</button>
					<button>삭제</button>
				</div>
				<!--//#button-->
			</div>
			<!--//#writing_view-->
		</section>

		<!--/*전문의 답변 작성란*/-->
		<section id="doctor_write">
			<h2>답변</h2>
			<div id="doctor_writing_content">
				<input type="text" name="title" Placeholder="제목을 입력해주세요." /><br>
				<textarea name="content" Placeholder="내용을 입력해주세요."></textarea>
				<div id="button">
					<button>완료</button>
					<button>취소</button>
				</div>
				<!--#button-->
			</div>
			<!--//#doctor_writing_content-->
		</section>
		<!--//#doctor_write-->

		<!--/*전문의 답변 뷰박스*/-->
		<section id="doctor_view">
			<div id="doctor_writing_view">
				<div class="title">제목</div>
				<!--//.title-->
				<div class="content">여기는 내용 입니다.</div>
				<ul>
					<li>작성자</li>
					<li>작성일</li>
					<li>작성날짜</li>
				</ul>
				<div id="button">
					<button>삭제</button>
					<button>수정</button>
				</div>
				<!--//#button-->
			</div>
			<!--//#doctor_writing_view-->
		</section>
		<!--//#doctor_view-->
	</main>
</body>
<%@include file="../includes/footer.jsp"%>

</html>