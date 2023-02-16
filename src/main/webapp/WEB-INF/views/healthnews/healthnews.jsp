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

.content_text p{
	font-size: 25px;
	font-weight: bold;
	
	}
.content_text {
	margin-top: 10px;
	margin-left: 20px;	
	display:flex;
	align-items: center;
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
			<!-- youtube contents -->
		</ul>
		<script>
		  
	      $(document).ready(function(){
	    	var result_list=[];
	    	var output = "";		
			$.ajax({
				type : "GET",
				dataType : "JSON",
				url : "https://www.googleapis.com/youtube/v3/search?"+
						"part=snippet&"+
						"maxResults=100&"+
						"channelId=UCa7-3Zvxg-5Rfxgu3RQY_gw&"+
						"q=코로나or감기or독감&"+
						"type=video&"+
						"key=AIzaSyBEMOzRRSZQw6xFyQVBW8XIB6RDTndW0_Y",
				contentType : "application/json",
				success : function(data) {								
					for (var i = 0; i < data.items.length; i++) {
						var items = data.items[i];							
						/* console.log("비디오아이디:"+items.id.videoid);
						console.log("제목:"+items.snippet.title);
						console.log("썸네일:"+items.snippet.thumbnails['default'].url); */
						result_list.push(items);							
		       			}
				},
				complete : function(data) {					
					result_list.forEach(function(item){
						var imgURL =item.snippet.thumbnails['default'].url;
						var tubeTitle = item.snippet.title;
						var tubeURL = "https://www.youtube.com/embed/"+item.id.videoId+"?autoplay=1&mute=1";
						//console.log('url은??'+tubeURL);
						output += "<li onclick='goPage(this)'><div class='content_box'>";
			    	  	output += "<div class='content_img'><img src='"+imgURL+"'/></div>";			      		
			            output += "<div class='content_text'><p>"+tubeTitle+"</p>";
			            output += "<p style='display:none;'>"+tubeURL+"</p></div>"
			            output += "</div></li>";	
					});								
		      	    $(".content_list").append(output);  // 새로운 데이터 덮어쓰기 */		
	            },
	          	error : function(xhr, status, error) {
	              	console.log("유튜브 요청 에러: "+error);
	            } 
	    	 });
	      }
	      )
	      
	      function goPage(obj){
			  var li = obj.querySelectorAll("p");
			  var tubeTitle = li[0].innerText;
			  var tubeURL = li[1].innerText;
			  var form = document.createElement("form");
		      form.setAttribute("charset", "UTF-8");
		      form.setAttribute("method", "POST");  //Post 방식
		      form.setAttribute("action", "healthnews1.do"); //요청 보낼 주소

		      var hiddenField = document.createElement("input");
		      hiddenField.setAttribute("type", "hidden");
		      hiddenField.setAttribute("name", "tubeTitle");
		      hiddenField.setAttribute("value", tubeTitle);
		      form.appendChild(hiddenField);
		      
		      var hiddenField = document.createElement("input");
		      hiddenField.setAttribute("type", "hidden");
		      hiddenField.setAttribute("name", "tubeURL");
		      hiddenField.setAttribute("value", tubeURL);
		      form.appendChild(hiddenField);
		      
		      document.body.appendChild(form);
		      form.submit(); 
		  }
      </script>
	</main>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>