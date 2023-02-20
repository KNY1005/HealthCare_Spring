<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=, initial-scale=1.0">
	<title>건강상담소 글 작성</title>
	<!--파비콘-->
	<link rel="icon" type="image/png" sizes="16x16"
		href="${path }/resources/image/favicon/favicon-16x16.png" />
	<link rel="manifest"
		href="${path }/resources/image/favicon/manifest.json" />
	<meta name="msapplication-TileColor" content="#ffffff" />
	<meta name="msapplication-TileImage"
		content="${path }/resources/image/favicon/ms-icon-144x144.png" />
	<meta name="theme-color" content="#ffffff" />
	<script>
		$(document).ready(
			function() {
				var fileTarget = $('.filebox .upload-hidden');

				fileTarget.on('change', function() { // 값이 변경되면, on : 실행하고자하는 jQuery코드
					if (window.FileReader) { // modern browser
						var filename = $(this)[0].files[0].name;
					} else { // old IE
						var filename = $(this).val().split('/').pop().split(
								'\\').pop(); // 파일명만 추출
					}

					// 추출한 파일명 삽입
					$(this).siblings('.upload-name').val(filename);
				});
			});
	</script>
	<style>
		/*-----------------sub_nav_menu > start---------------*/

		.order_box {
			width: 790px;
			height: 110px;
			display: flex;
			align-items: flex-end;
			justify-content: center;
		}
		
		.order {
			width: 500px;
			display: flex;
			flex-direction: row;
			justify-content: space-evenly;
		}


		/*-----------------sub_nav_menu > end---------------*/
		
		* {
			font-weight: bold;
		}

		main {
			width: 1320px;
			height: 940px;
			vertical-align: center;
			position: relative;
			top: 520px;
			left: 50%;
			transform: translate(-50%, -50%);
			margin-top: 40px;
		}

		main #menu h2 {
			font-size: 40px;
		}

		main hr {
			height: 3px;
			background-color: #FF7373;
			border: none;
			margin: 10px 0;
		}

		/*----------컨텐츠 작성란----------*/
		main #writing_view {
			display: flex;
			flex-direction: column;
			width: 1100px;
			height: 515px;
			margin: 40px auto;
			border: 3px solid #FF8F8F;
			border-radius: 10px;
		}

		main #writing_view .title {
			width: 1000px;
			height: 40px;
			text-align: left;
			font-size: 25px;
			margin-left: 50px;
			margin-top: 30px;
		}

		main #writing_view .content {
			width: 1000px;
			height: 360px;
			resize: none;
			margin-left: 50px;
			margin-top: 10px;
			font-size: 16px;
		}

		main #writing_view textarea {
			border-radius: 10px;
		}

		main #writing_view input {
			border-radius: 10px;
		}

		/*작성자,작성날짜,작성시간*/
		main #writing_view ul {
			width: 1000px;
			margin-left: 50px;
			margin-top: 25px;
			display: flex;
			justify-content: flex-start;


		}

		main #writing_view li {
			font-size: 16px;
			margin-right: 40px;
			text-align: center;
		}




		/*첨부파일 업로드 박스*/
		main .filebox {
			font-size: 16px;
			font-weight: bold;
			width: 1100px;
			height: 50px;
			display: flex;
			margin: 30px auto;
			justify-content: flex-start;
			align-items: center;
			border: 3px solid #FF8F8F;
			border-radius: 30px;
		}

		main .filebox .file1 {
			margin-left: 30px;
		}



		main .filebox input[type="file"] {

			width: 1px;
			height: 1px;
			padding: 0;

			overflow: hidden;
			clip: rect(0, 0, 0, 0);
			border: 0;
		}

		main .filebox label:hover {
			border-radius: 30px;
			box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
			cursor: pointer;
		}

		main .filebox label {
			width: 80px;
			margin-left: 520px;
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
		main .filebox .upload-name {
			width: 300px;
			margin-left: 50px;
			display: inline-block;
			padding: .5em .75em;
			/* label의 패딩값과 일치 */
			font-size: inherit;
			font-family: inherit;
			line-height: normal;
			vertical-align: middle;
			background-color: #FFFFFF;
			border: 1px solid #FFFFFF;
			border-bottom-color: #FFFFFF;
			border-radius: .25em;
			-webkit-appearance: none;
			/* 네이티브 외형 감추기 */
			-moz-appearance: none;
			appearance: none;
		}

		/*완료, 삭제 버튼*/
		main #btn {
			margin: 10px auto;
			width: 1100px;
			height: 50px;
			display: flex;
			justify-content: flex-end;

		}

		main #btn button {
			width: 120px;
			padding: 10px;
			margin: 0 10px;
			font-size: 25px;
			background-color: #FFEFEF;
			border: #FFEFEF;
			border-radius: 30px;
		}

		main #btn :hover {
			border-radius: 30px;
			box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
			cursor: pointer;
		}
	</style>
</head>

<body>

	<%@include file="../includes/header.jsp"%>
	<div class="order_box">
		<ul class="order">
			<li>공지사항</li>
			<li>|</li>
			<li>문의사항</li>
			<li>|</li>
			<li style="color: #CE8080;">건강상담소</li>
		</ul>
	</div>
	<main>
		<div id="menu">
			<h2>건강상담소 상담글 작성</h2>
			<hr>
		</div>

		<form action="medicalWrite.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="blist" value="H">
			<input type="hidden" name="midx" value="${member.midx}">
			<input type="hidden" name="mname" value="${member.mname }">
			<div id="writing_view">
				<input type="text" class="title" name="btitle"/>
				<textarea class="content" name="bcontent"></textarea>
				<ul>
					<li>${member.mname }</li>
				</ul>
			</div>
				<div class="filebox">
					<p class="file1">첨부파일</p>
					<input class="upload-name" value="파일선택" disabled="disabled" name=filename>
					<label for="ex_filename">업로드</label> <input type="file"
						id="ex_filename" class="upload-hidden" name="upload">					
				</div>
			<div id="btn">
				<button type="button" onclick="location.href='medicalList.do'">취소</button>
				<button>완료</button>
			</div>
		</form>
	</main>
	
	<%@include file="../includes/footer.jsp"%>








</body>
</html>