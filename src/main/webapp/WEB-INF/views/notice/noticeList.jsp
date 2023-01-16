<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<%@ page import="edu.study.vo.BoardVo"%>

<%
	List<BoardVo> list = (List<BoardVo>)request.getAttribute("datalist");	//형변환,컨트롤러의 키값을 가져옴
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
	<!--파비콘-->
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
main {
	width: 1320px;
	height: 1000px;
	margin: 100px auto;
}
.order_box{
        width: 790px;
        height: 110px;
        display: flex;
 		align-items: flex-end;
        justify-content: center;
      }    
.order{
        width: 500px;
        display: flex;
        flex-direction: row;
        justify-content: space-evenly;
        }
.h3 {
	font-weight: bold;
	font-size: 40px;
}


#head {
	display: flex;
	flex-direction: row;
}

#search {
	font-weight: bold;
	font-size: 25px;
	vertical-align: top;
	margin-left: 840px;
	display:flex;
	justify-content: center;
	align-items: center;
}

#search input::-webkit-search-decoration, #search input::-webkit-search-cancel-button,
	#search input::-webkit-search-results-button, #search input::-webkit-search-results-decoration
	{
	display: none;
} /*search내의 요소 삭제*/
#search input {
	height: 40px;
	font-size: 20px;
	margin-left: -8px;
	border: 1px solid #000;
	border-left: none;
	border-right: none;
	margin-right: -8px;
}
#search input:focus {outline: none; background:#fff;}

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

#search  {
	
}

#glass {
	border: 1px solid #000;
	padding: 4px 10px 4px 10px;
	border-radius: 0 10px 10px 0;
	border-left: none;
	
	
}
#glass i{margin-top:2px;}
#glass:hover {
	cursor: pointer;
}

#question_list {
	border-collapse: separate;
	border-spacing: 0 20px;
} /*tr간 간격*/
.content {
	background: #ffe7e7;
}

.title {
	font-size: 30px;
}

.column:nth-child(1) {
	background: #fff;
}

.column th {
	width: 350px;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	vertical-align: middle;
	height: 73px;
}

.column {
	cursor: pointer;
}

.content td:first-child {
	border-radius: 10px 0 0 10px;
	width: 1000px;
	text-align: left;
	padding-left: 20px;
} /*td테두리 첫번쨰와 마지막만 둥글게 하기위해서*/
.content td:last-child {
	border-radius: 0 10px 10px 0;
}

.content td {
	width: 350px;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	vertical-align: middle;
	height: 73px;
	padding: 10px 0;
}

.content:hover {
	background: #fff;
	box-shadow: 0 0 0 3px #ff8f8f inset;
	border-radius: 10px;
	transition: .2s;
	cursor: pointer;
}

.button {
	border: 0;
	background: #ffe7e7;
	width: 180px;
	height: 45px;
	border-radius: 10px;
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	float: right;
	margin-right: 20px;
}

.button:hover {
	border-radius: 10px;
	transition: .2s;
	box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
	cursor: pointer;
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
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
		<div id="head">
			<h3 class="h3">공지사항</h3>
			<div id="search">
				
					<select class="cate">
						<option>제목</option>
						<option>작성자</option>
					</select> <input type="search" name="search" placeholder="검색"> <a href="#"
						id="glass"><i class="xi-search"></i></a>
				
			</div>
		</div>
		<hr class="hr">
		<table id="question_list">
			<tr class="column">
				<th>제목 및 내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		<c:forEach items="${datalist}" var="vo">
			<tr class="content" onClick="location.href='notice3.do'">
				<td><p class="title">${vo.btitle}</p> <br />
					<p><a href="view.do?bidx=${vo.bidx}">${vo.bcontent}</a></p></td>
				<td>${vo.bwriter}</td>
				<td>${vo.bwdate}</td>
				<td>${vo.bhit}</td>
			</tr>
		</c:forEach>
		</table>
		
		<button class="button" onClick="location.href='notice4.do'">글쓰기</button>
		

	</main>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>