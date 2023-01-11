<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<title>문의사항</title>
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
body, h1, h2, h3, h4, h5, h6, li, p, #nav li a, #topbar, input, button,
	select, textarea, a, .wf-container>*, .widget-title, .dwqa-container,
	#wpmem_reg, #wpmem_login {
	font-family: "arita-light", "arita-sans-light" !important;
	color: #000;
}

main {
	width: 1320px;
	height: 1000px;
	margin: 0 auto 0;
}

.h3 {
	font-weight: bold;
	font-size: 40px;
	display: inline-block;
}

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
	margin-left: 20px;
	margin-right: 20px;
}

.sub_nav_menu li:nth-child(3) {
	color: red;
}

#head {
	position: relative;
}

#search {
	bottom: 4px;
	font-weight: bold;
	font-size: 25px;
	vertical-align: top;
	position: absolute;
	right: 10px;
}



#search input::-webkit-search-decoration, #search input::-webkit-search-cancel-button,
#search input::-webkit-search-results-button, #search input::-webkit-search-results-decoration
	{
	display: none;
} /*search내의 요소 삭제*/
#search input {
	height: 40px;
	font-size: 20px;
	margin-left:0;
	border: 1px solid #000;
	border-radius: 10px;
	padding-right: 40px;
	padding-left: 110px;
}

.hr {
	height: 2px;
	border: 0;
	background: #ff7373;
}
.cate{-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
	font-weight: bold;
	width: 100px;
	height: 40px;	
	padding: 5px 30px 5px 10px;
	border:none;
	border-right:1px solid #000;
	outline: 0 none;
	font-size: 20px;
	background: url("${path }/resources/image/bottom_arrow.png") no-repeat
		95% 50%; /* 화살표 모양의 이미지 */	
	position:absolute;
	}
#search div a {
	position: absolute;
	right: 5px;
	bottom: 5px;
}

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
	box-shadow: inset 3px 3px 5px #c57171;
	cursor: pointer;
}

table {
	border: 1px;
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

	<main>
		<div id="head">
			<h3 class="h3">문의사항</h3>
			<div id="search">
				<div>				
				<select class="cate">
					<option>제목</option>
					<option>작성자</option>
				</select>
					<input type="search" name="search" value="검색"> <a href="#" id="glass"><i
						class="xi-search"></i></a>
				</div>
			</div>
		</div>
		<hr class="hr">
		<table id="question_list">
			<tr class="column">
				<th>제목 및 내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>답변</th>
			</tr>
			<tr class="column content"
				onClick="location.href='http://www.daum.net/'">
				<td><p class="title">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>
			<tr class="content" onClick="location.href='http://www.daum.net/'">
				<td><p class="title">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>
			<tr class="content" onClick="location.href='http://www.daum.net/'"
				style="cursor: pointer;">
				<td><p class="title">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>


		</table>
		<button class="button">글쓰기</button>


	</main>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>