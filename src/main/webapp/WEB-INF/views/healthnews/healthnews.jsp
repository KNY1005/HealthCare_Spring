<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강소식</title>
<!--파비콘-->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path }/resources/image/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${path }/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path }/resources/image\favicon\android-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<script>	
		/* //건강소식 가져오기
		$.ajax({
			type:'POST',
			dataType:'json',
			url:"ApiSearchNew.java",
			data:{'GUBUN':'news','SEARVALUE':SEARVALUE},
			cache:false,
			async:false
		})
		.done(function(result){
			var news_html="";
			for(var i=0; i<(result.item.length>5?5:result.item.length);i++)
				{
				var row_html="";
				row_html+="<div></div>"
				row_html+=
					
				news_html+=row_html;
				}
			if(news_html)
				{
				$("#news_result").html(news_html);
				}
		}) */
	
	
	</script>
<style>
main {
	width: 1320px;
	margin: 100px auto;
}

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

.h3 {
	font-weight: bold;
	font-size: 40px;
	margin-right: 63%;
}

#head {
	display: flex;
	flex-direction: row;
}

#search button {
	style: none;
}

#search input::-webkit-search-decoration, #search input::-webkit-search-cancel-button,
	#search input::-webkit-search-results-button, #search input::-webkit-search-results-decoration
	{
	display: none;
} /*search내의 요소 삭제*/
#search input {
	height: 36px;
	font-size: 20px;
	margin-left: -8px;
	border: 1px solid #000;
	border-left: none;
	border-right: none;
	margin-right: -8px;
	padding-left: 10px;
}

#search input:focus {
	outline: none;
	background: #fff;
}

.hr {
	height: 2px;
	border: 0;
	background: #ff7373;
}

.cate {
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	font-weight: bold;
	width: 80px;
	padding-left: 10px;
	height: 40px;
	border: 1px solid #000;
	border-radius: 10px 0 0 10px;
	outline: 0 none;
	font-size: 20px;
	background: url("${path }/resources/image/bottom_arrow.png") no-repeat
		95% 50%; /* 화살표 모양의 이미지 */
}

#glass {
	border: 1px solid #000;
	padding: 3px 10px 5px 10px;
	border-radius: 0 10px 10px 0;
	border-left: none;
	background: #fff;
	font-size: 20px;
	height: 40px;
}

#glass i {
	
}

#glass {
	border: 1px solid #000;
	padding: 3px 10px 5px 10px;
	border-radius: 0 10px 10px 0;
	border-left: none;
	background: #fff;
	font-size: 20px;
	height: 40px;
}

#glass i {
	
}

#glass:hover {
	cursor: pointer;
}

.content_box {
	display: flex;
	flex-direction: row;
	background: #fff;
	border: 4px solid #ff7373;
	width: 97%;
	height: 150px;
	border-radius: 15px;
}

.content_img {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 10px;
	margin-left: 20px;
	background: #ffdbdb;
	width: 200px;
	height: 130px;
}

.content_img img {
	width: 200px;
	height: 110px;
}

.content_text p:nth-child(1) {
	font-size: 40px;
	font-weight: bold;
}

.content_text p:nth-child(2) {
	font-size: 20px;
	font-weight: bold;
	margin-top: 10px;
}

.content_text {
	margin-top: 10px;
	margin-left: 20px;
}

.content_list li {
	margin-top: 20px;
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="order_box"></div>


	<main>
		<div id="head">
			<h3 class="h3">건강소식</h3>
			<div id="search">
				<form action="noticeList.do" method="get">
					<select class="cate" name="searchType">
						<option value="btitle"
							<c:if test="${param.searchType eq 'btitle' }">selected</c:if>>제목</option>
						<option value="bcontent"
							<c:if test="${param.searchType eq 'bcontent' }">selected</c:if>>내용</option>

					</select> <input type="text" name="keyWord" placeholder="검색">
					<button id="glass">
						<i class="xi-search"></i>
					</button>
				</form>
			</div>
		</div>
		<hr class="hr">
		<ul class="content_list">
			<li>
				<div class="content_box">
					<div class="content_img">
						<img src="${path}/resources/image/logo2.png" />
					</div>
					<div class="content_text">
						<p>제목</p>
						<p>여기는 내용 입니다</p>

					</div>
				</div>
			</li>

		</ul>
		<script>
	      $(document).ready(function(){
				$.ajax({
					type : "GET",
					dataType : "JSON",
					url : "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&channelId=UC6KwCU8Y8Uw4h_Q0ptLZkqw&type=video&key=AIzaSyBEMOzRRSZQw6xFyQVBW8XIB6RDTndW0_Y",
					contentType : "application/json",
					success : function(jsonData) {
						alert("test");						
						for (var i = 0; i < jsonData.items.length; i++) {
							var items = jsonData.items[i];							
							console.log("비디오아이디:"+items.id.videoid);
							console.log("제목:"+items.snippet.title);
							console.log("썸네일:"+items.snippet.thumbnails.medium.url);
							
		            }
				},
					complete : function(data) {
	
	            } /*,
	          		error : function(xhr, status, error) {
	              	console.log("유튜브 요청 에러: "+error);
	          } */
	    	 });
	      }
	      )
      </script>
	</main>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>