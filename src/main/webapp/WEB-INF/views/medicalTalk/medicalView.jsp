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
					<button>답변</button>
					<button type="button" onClick="location.href='medicalModify.do?bidx=${vo.bidx}'">수정</button>
					<button type="button"
					onClick="location.href='medicalDelete.do?bidx=${vo.bidx}'">삭제</button>
				</div>
				</div>
			</form>
			<div class="like">
				<h2>답변</h2><a href="javascript:;" class="icon heart">
     			<img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
  					</a>
				<p>211</p>
			</div><!--//#like-->
			<!-- 답변 시작 -->
			<div class="doctor_writing_content" id="reply_card${tmp.no}">
				<section class="modal-section">
					<div class="card card-body">
						<!-- 답글목록 -->
						<div class="reply-list reply-list${tmp.no}">
							<!-- 댓글의 목록이 들어가는 속 -->
						</div>
						<!-- 댓글작성 >로그인한 상태여야만 댓글작성 칸이 나온다. -->
						<c:if test="${not empty sessionScope.name}">
							<div class="row reply_write">
								<div class="col-1">
									${vo.mname}							
								</div>
								<div class="col-8"  class="input_reply_div">
									<input class="w-100 form-control" id="input_reply${tmp.no}"
										type="text" placeholder="답글입력">
								</div>
								<div class="col-3">
									<button type="button" id="${tmp.no }"
										class="btn btn-success mb-1 write_reply">완료</button>
								</div>
							</div>
						</c:if>
					</div>
				</section>
			</div>
		</section>

	</main>
	<%@include file="../includes/footer.jsp"%>
</body>
<script>
	const ReplyList = function(pidx) {
		$.ajax({
			url : 'replyList.do',
			type : 'get',
			data : {
				pidx : pidx
			},
			success : function(data){
				
				console.log("댓글 리스트 가져오기 성공");
				
				//댓글 목록을 html로 담기
				
				let listHtml = "";
				for(const i in data){
					let pidx = data[i].no;
					let bidx = data[i].bidx;
					let grp = data[i].grp;
					let grps = data[i].grps;
					let midx = data[i].midx;
					let pcontent = data[i].pcontent;
					let pdate = data[i].pdata;
					let pdelete = data[i].pdelete;
					
					listHtml += "<div class='row replyrow reply" + pidx + "'>";
					
					if(content == ""){
						listHtml += "<div>";
						listHtml += "(삭제된 댓글입니다)";
						listHtml += "</div>";
					}else{
						listHtml += "</div>";
					}else{
						listHtml += "<div class='col-1'>"
						listHtml += "</div>";
						listHtml += "<div class='col-1'>";
						listHtml += "답변";
						listHtml += "</div>";
						listHtml +="<span>";
						listHtml +="<b>"+midx+"</b>";
						listHtml +="</span>";
						listHtml +="<span>";
						listHtml += pcontent;
						listHtml +="</span>";
						listHtml +="</div>";
						listHtml +="</div>";
					}

					listHtml += "<div class='col-3 reply-right'>";
					listHtml += "<div>";
					listHtml += pdate;
					listHtml += "</div>";
					if("${name}" != ""){
						if("${name}" == midx){
							listHtml += "<div>";
							listHtml += "<a href='javascript:'pidx='"+pidx+"'bidx='"+bidx+"'midx='"+midx+"'grp='"+grp+"'grps='"+grps+"' class='reply_delete'>삭제</a>";
							listHtml += "</div>";
							}
						}
					listHtml +="</div>";
					listHtml += "</div>";
			
					$(".reply-list"+pidx).html(listHtml);
						
					$('.reply_delete').on('click',function(){
					DeleteReply($(this).attr('pidx'),$(this).attr('bidx'));
					}
				}
		
			},
			error: function(){
				alert('서버 에러');
			}
		});
	};
	
	
	const DeleteReply = function(pidx, bidx){
		$.ajax({
			url : 'deleteReply.do',
			type : 'get',
			data : {
				pidx : pidx,
				bidx : bidx
			},
			success : function(pto){
				let reply = pto.reply;
				
				$('#m_reply'+bidx).text(reply);
				$('#reply'+bidx).text(reply);
				
				console.log("답글 삭제 성공");
				
				ReplyList(bidx);
		
			},
			error :function(){
				alert('서버 에러');
			}
		});
	};
	


</script>
</html>