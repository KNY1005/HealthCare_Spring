<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>건강상담소 상세보기</title>
<!--파비콘-->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path }/resources/image/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${path }/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path }/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />

<style>
		/*-----------------sub_nav_menu > start---------------*/

		.sub_nav_menu ul {
			margin-left: 135px;
			margin-top: 20px;
		}

		.sub_nav_menu li {
			text-align: center;
			float: left;
			width: 100px;
			padding: 0 30px;
			/*글자길이 길어서 넘어가면 이거 늘리세요 */
			font-weight: bold;
			font-size: 20px;
		}

		.sub_nav_menu li:nth-child(2) {
			border-left: 1px solid #000;
			border-right: 1px solid #000;
		}

		.sub_nav_menu li:nth-child(3) a{
			color: red;
		}

		/*-----------------sub_nav_menu > end---------------*/
	#height {
		height: 80px;
	}
	
	
	* {
		font-weight: bold;
	}
	
	#view {
		width: 1320px;
		height: 1600px;
		margin: 100px auto;
	}
	
	#main #view h2 {
		font-size: 40px;
		font-weight: bold;
	}
	
	hr {
		height: 2px;
		background-color: #FF7373;
		border: none;
		margin-bottom: 50px;
	}
	
	#writing_view {
		width: 1100px;
		height: 650px;
		border: 3px solid #FF8F8F;
		border-radius: 25px;
		margin: 0 auto 0;
	}
	
	.title {
		margin: 20px auto 10px;
		width: 970px;
		height: 40px;
		font-size: 25px;
		line-height: 40px;
	}
	
	.content {
		margin: 0 auto 20px;
		width: 970px;
		height: 360px;
	}
	
	#writing_view ul {
		margin: 30px 70px;
	}
	
	#writing_view li {
		display: inline-block;
		margin-right: 40px;
		font-weight: bold;
	}
	
	.file {
		width: 1000x;
		height: 50px;
		vertical-align: middle;
		margin: 20px auto 0;
	}
	
	
	.filebox p {
		display: inline;
	}
	
	
	.filebox {
		display: flex;
		width: 1000px;
		height: 50px;
		margin: 10px auto 10px;
		border: 3px solid #FF8F8F;
		border-radius: 30px;
		align-items: center;
		font-weight: bold;
	}
	
	.filebox .file1 {
		margin: 0 20px 0 20px;
		font-size: 18px;
	}
	
	.filebox input[type="file"] {
		width: 1px;
		height: 1px;
		padding: 0;
		margin: -1px;
		overflow: hidden;
		clip: rect(0, 0, 0, 0);
		border: 0;
	}
	
	.filebox label {
		background-color: #FFE7E7;
		cursor: pointer;
		border: #FFEFEF;
		border-radius: 10px;
		vertical-align: center;
		padding: 10px;
		margin-left: 715px;
	}
	
	.filebox label:hover {
		border-radius: 10px;
		transition: .2s;
		box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
		cursor: pointer;
	}
	/* named upload */
	.filebox .upload-name {
		font-size: 18px;
		border: none;
		font-weight: bold;
		background: #fff;
	}
	
	#button{
		display:flex;
		margin-top:35px;
		margin-left:720px;
		
		}
	
	#button button {
	
		margin-left:10px;
		width: 100px;
		height: 35px;
		padding: 10px;
		font-size:15px;
		font-weight: bold;
		background-color: #FFEFEF;
		border: #FFEFEF;
		border-radius: 30px;
	}
	
	#button button:hover {
		border-radius: 30px;
		transition: .2s;
		box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
		cursor: pointer;
	}
	/*///////////////////////////////////////////////////////////////////////////////////////////////*/
	/*전문의 답변 작성란*/
	main .like{
		margin-top:30px;
		display:flex;
		font-size:35px;
		margin-left:110px;
		margin-bottom:10px;
		align-items:center;
		}
		
	main .like a{
		margin-left:910px;

  		text-decoration:none; color:inherit; cursor: pointer;
		}
	
	main .like p{
	margin-left:10px;
 	
	}
		
	 .like .icon{
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    width: calc(100vw * (45 / 1920));
	    height: calc(100vw * (45 / 1920));
	
	    border-radius: 50%;
	    border: solid 2px #eaeaea;
	    background-color: #fff;
	}

	.icon.heart img{
	    width: calc(100vw * (24 / 1920));
	    height: calc(100vw * (24 / 1920));
	}

	.icon.heart.fas{
	  color:red
	}
	.heart{
	    transform-origin: center;
	}
	.heart.active img{
	    animation: animateHeart .3s linear forwards;
	}

	@keyframes animateHeart{
	    0%{transform:scale(.2);}
	    40%{transform:scale(1.2);}
	    100%{transform:scale(1);}
	  }
			}
		
		

		
	#view h3 {
		font-size: 35px;
		margin: 0 0 20px 120px;
	}
	
	#doctor_writing_content {
		height:280px;
		width: 1100px;
		margin: 0 auto 0;
		border: 3px solid #FF8F8F;
		border-radius: 25px;
	}
	
	.reply_input {
		margin: 0 auto 0;
	}
	
	#doctor_writing_content input {
		border-radius: 10px;
		margin: 10px 0 10px 40px;
		width: 1000px;
		height: 35px;
		text-align: left;
		font-size: 25px;
	}
	
	#main #doctor_writing_content textarea {
		width: 1000px;
		margin: 0 0 10px 40px;
		height: 150px;
		border-radius: 10px;
	}
	
	.button {
		display: inline-block;
		width: 230px;
		height: 40px;
		margin-left:820px;
		margin-bottom:10px;
	}
	
	.button button {
		font-weight: bold;
		width: 100px;
		padding: 10px;
		font-size: 15px;
		background-color: #FFEFEF;
		border: #FFEFEF;
		border-radius: 30px;
		margin-left:10px;
		
	}
	
	/*전문의 답변 뷰박스*/
	#main #doctor_writing_view {
		height:280px;
		width: 1100px;
		margin-left: 110px;
		margin-top: 30px;
	}
	
	#main  #doctor_writing_view {
		width: 1100px;
		border: 3px solid #FF8F8F;
		border-radius: 25px;
	}
	
	#main #doctor_writing_view .title {
		border-radius: 10px;
		width: 1000px;
		height: 35px;
		text-align: left;
		font-size: 25px;
	}

	#main #doctor_writing_view .content {
		width: 1000px;
		height: 150px;
	}
	
	.hob{
		display:flex;
		width:1100px;
	}
		
	
	.hob #date{
		display:flex;
		flex-direction:row;
		margin-left:50px;
		
		}
	
	#date li{
		font-size:16px;
		margin-right:40px;
		width:64px;}
		
	#main #doctor_writing_view .button{
		height:35px;
		display:flex;
		margin-left:460px;
		margin-bottom:10px;}

	#main #doctor_writing_view .button button{
		font-weight: bold;
		width: 100px;
		padding: 10px;
		font-size: 15px;
		background-color: #FFEFEF;
		border: #FFEFEF;
		border-radius: 30px;
		margin-left:10px;
		
	}
	
	.button button:hover {
		border-radius: 30px;
		transition: .2s;
		box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
		cursor: pointer;
	}
	</style>
</head>

<body>
	<%@include file="../includes/header.jsp"%>

	<div id="height"></div>
	<div class="sub_nav_menu">
		<ul>
			<li><a href="notice1.do">공지사항</a></li>
			<li><a href="question/questionList.do">문의사항</a></li>
			<li><a href="medicallist.do">건강상담소</a></li>
		</ul>
	</div><!--//.sub_nav_menu-->
	<main id="main">
		<section id="view">
			<h2>건강상담소 상세</h2>
			<hr>
			<form action="">
				<div id="writing_view">
					<div class="title">제목</div>
					<div class="content">내용</div>
					<ul>
						<li>작성자</li>
						<li>작성일</li>
						<li>작성날짜</li>
					</ul>
					<div class="file">
					<div class="filebox">
						<p class="file1">첨부파일</p>
						<input class="upload-name" value="파일선택" disabled="disabled">
					</div>
				</div>
				<div id="button">
					<button>답변</button>
					<button type="button" onClick="location.href='medicalmodify.do'">수정</button>
					<button>삭제</button>
				</div>
				</div>
			</form>
			<div class="like">
				<h2>답변</h2><a href="javascript:;" class="icon heart">
     <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
  </a>
				<p>211</p>
			</div><!--//#like-->
			<div id="doctor_writing_content">
				<div class="reply_input">
					<input type="text" name="title" Placeholder="제목을 입력해주세요." /><br>
					<textarea name="content" Placeholder="내용을 입력해주세요."></textarea>
					<div class="button">
						<button>완료</button>
						<button>취소</button>
					</div>
				</div>
			</div>




			<div id="doctor_writing_view">
				<div class="title">제목</div>
				<div class="content">여기는 내용 입니다.</div>
				<div class="hob">
					<ul id="date">
						<li>작성자</li>
						<li>작성일</li>
						<li>작성날짜</li>
					</ul>
					<div class="button">
						<button>삭제</button>
						<button>수정</button>
					</div>
				</div><!--//#hob-->
			</div>
		</section>

	</main>
	<%@include file="../includes/footer.jsp"%>
</body>
<script>
	$(function(){
	    var $likeBtn =$('.icon.heart');
	
	        $likeBtn.click(function(){
	        $likeBtn.toggleClass('active');
	
	        if($likeBtn.hasClass('active')){          
	           $(this).find('img').attr({
	              'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
	               alt:'찜하기 완료'
	                });
	          
	          
	         }else{
	            $(this).find('i').removeClass('fas').addClass('far')
	           $(this).find('img').attr({
	              'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
	              alt:"찜하기"
	           })
	         }
	     })
	})


</script>
</html>