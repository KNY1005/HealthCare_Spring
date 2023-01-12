<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
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

#search div a {
	
}

#glass {
	border: 1px solid #000;
	padding: 5px 10px 8px 10px;
	border-radius: 0 10px 10px 0;
	border-left: none;
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
				<div>
					<select class="cate">
						<option>제목</option>
						<option>작성자</option>
					</select> <input type="search" name="search" placeholder="검색"> <a href="#"
						id="glass"><i class="xi-search"></i></a>
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
			<tr class="column content" onClick="location.href='#'">
				<td><p class="title">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>
			<tr class="content" onClick="#">
				<td><p class="title">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>
				<td>답변완료</td>
			</tr>
			<tr class="content" onClick="#" style="cursor: pointer;">
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