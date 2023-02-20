<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<script src="https://code.jquery.com/jquery-latest.min.js"
		type="application/javascript"></script>
	<script type="application/javascript"
		src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>

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

		
	main {
		width: 1320px;
		height:3500px;
		margin: 100px auto;
	}
	
	* {
		font-weight: bold;
	}
	
	#view {
		width: 1320px;
		height: 1600px;
		margin: 100px auto;
	}
	
	main #view h2 {
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
	
	#writing_view .title {
		margin: 20px auto 10px;
		width: 970px;
		height: 40px;
		font-size: 25px;
		line-height: 40px;
	}
	
	#writing_view .content {
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
		


		
	#view h3 {
		font-size: 35px;
		margin: 0 0 20px 120px;
	}
	
 	.doctor_writing_content {
		width: 1100px;
		margin: 0 auto 0;
		
	}
	
	.input-group {
		height:280px;
		width: 1100px;
		margin: 0 auto 0;
		border: 3px solid #FF8F8F;
		border-radius: 25px;
	}
	

	input#ptitle {
		border-radius: 10px;
		margin: 10px 0 10px 40px;
		width: 1000px;
		height: 35px;
		text-align: left;
		font-size: 25px;
	}
	
	input#pcontent {
		width: 1000px;
		margin: 0 0 10px 40px;
		height: 150px;
		border-radius: 10px;
	}
	
	.input-group-btn {
		display: inline-block;
		width: 230px;
		height: 40px;
		margin-left:820px;
		margin-bottom:10px;
	}
	
	
	.input-group-btn button {
		font-weight: bold;
		width: 100px;
		padding: 10px;
		font-size: 15px;
		background-color: #FFEFEF;
		border: #FFEFEF;
		border-radius: 30px;
		margin-left:10px;
		
	}
	.input-group-btn button:hover{
		
	
	}
	
	/*전문의 답변 뷰박스*/
	.replyList {
		width: 1100px;
		margin-top: 30px;
		height:100%;
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
		<section id="view">
			<h2>건강상담소</h2>
			<hr>
			<form action="">
				<div id="writing_view">
					<div class="title">${vo.btitle}</div>
					<div class="content">${vo.bcontent}</div>
					<ul>
						<li>${vo.bwriter}</li>
						<li>${vo.bwdate}</li>
					</ul>
					<div class="file">
					<div class="filebox">
						<p class="file1">첨부파일</p>
						<a href="fileDown.do?bidx=${vo.bidx}"><div class="upload-name">${fvo.originname }</div></a>
					</div>
				</div>
				<div id="button">
					<c:if test="${member.mgrade == 'D'}"><button onclick="openClose()" id="answerBtn" type="button">답변하기</button></c:if>
					<button type="button" onClick="location.href='medicalModify.do?bidx=${vo.bidx}'">수정</button>
					<button type="button"
					onClick="location.href='medicalDelete.do?bidx=${vo.bidx}'">삭제</button>
				</div>
				</div>
			</form>
			<div class="like">
				<h2>답변</h2>
			</div><!--//#like-->
			<!-- 답변 시작 -->
			<div class="doctor_writing_content" >
			<c:if test="${member.mgrade == 'D'}">
				<div id="writing_container" style="display:none;">
					<div class="container">
				    	<label for="pcontent"></label>
				        	<form name="replyInsertForm">
				            	<div class="input-group">
				               	<input type="hidden" name="bidx" id='bidx' value="${vo.bidx}"/>
				               	<input type="hidden" id='midx' name="midx" value="${member.midx}"/>
				               	<input type="hidden" name="pwriter" value="${member.mname}"/>
				               	<input type="text" class="form-control" id="ptitle" name="ptitle" placeholder="제목을 입력하세요.">
				               	<input type="text" class="form-control" id="pcontent" name="pcontent" placeholder="내용을 입력하세요.">
				               		<span class="input-group-btn">
				                   		<button class="btn btn-default" type="button" name="replyInsertBtn">등록</button>
				                   		<button type="button">취소</button>
				               		</span>
				              	</div>
				        	</form>
			    	</div>
			 	</div>
			    </c:if>
			   	<div class="container">
			   		<div class="replyList">
			   		<%@ include file="reply.jsp" %></div>
			    </div>
			</div>
			
		
		</section>
		
	</main>
	<%@include file="../includes/footer.jsp"%>
	
 <script>
	function openClose() {
		if($('#writing_container').css('display') == 'none'){
			$('#writing_container').show();
			$('#answerBtn').text('답변취소');
		}else{
			$('#writing_container').hide();
			$('#answerBtn').text('답변하기');
		}	
	}	
</script>
	
</body>
</html>