<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<style>
* {
	font-weight: bold;
}

main {
	width: 1320px;
	height: 800px;
	margin: 200px auto 0;
}

.notice {
	font-size: 40px;
	margin-bottom: 15px;
}

.order_box {
	width: 745px;
	position: fixed;
	top: 77px;
	display: flex;
	justify-content: center;
	margin-top: 10px;
}

.order {
	width: 460px;
	display: flex;
	flex-direction: row;
	justify-content: space-evenly;
}

h4 {
	font-weight: bold;
	font-size: 36px;
	display: inline-block;
}

#head {
	position: relative;
}

#search {
	bottom: 4px;
	font-weight: bold;
	font-size: 36px;
	vertical-align: top;
	position: absolute;
	right: 10px;
}

input {
	display: inline-block;
}

#search_n {
	position: absolute;
	left: -50px;
	top: 5px;
}

input::-webkit-search-decoration, input::-webkit-search-cancel-button,
	input::-webkit-search-results-button, input::-webkit-search-results-decoration
	{
	display: none;
} /*search내의 요소 삭제*/
input {
	height: 40px;
	font-size: 20px;
	margin-left: 20px;
	border: 1px solid #000;
	border-radius: 10px;
	padding-right: 40px;
}

#search div a {
	position: absolute;
	right: 5px;
	bottom: -2px;
}

hr {
	height: 2px;
	border: 0;
	background: #ff7373;
}

#glass:hover {
	cursor: pointer;
}

table {
	border-collapse: separate;
	border-spacing: 0 20px;
} /*tr간 간격*/
tr {
	background: #ffe7e7;
}

tr:nth-child(1) {
	background: #fff;
}

td:first-child, th:first-child {
	border-radius: 10px 0 0 10px;
	width: 1000px;
} /*td테두리 첫번쨰와 마지막만 둥글게 하기위해서*/
td:first-child {
	text-align: left;
	padding-left: 20px;
}

#tit {
	font-size: 36px;
}

td:last-child, th:last-child {
	border-radius: 0 10px 10px 0;
}

th, td {
	width: 350px;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
	vertical-align: middle;
	height: 73px;
}

td {
	padding: 10px 0;
}

tr:nth-child(n+2):hover {
	background: #fff;
	box-shadow: 0 0 0 3px #ff8f8f inset;
	border-radius: 10px;
	transition: .2s;
	cursor: pointer;
}

button {
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

button:hover {
	border-radius: 10px;
	transition: .2s;
	box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
	cursor: pointer;
}
</style>
</head>
<body>

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
			<h3 class="notice">공지사항</h3>
			<div id="search">
				<P id="search_n">검색</P>
				<div>
					<input type="search" name="search"> <a href="#" id="glass"><i
						class="xi-search"></i></a>
				</div>
			</div>
		</div>
		<hr>
		<table>
			<tr>
				<th>제목 및 내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>

			</tr>
			<tr>
				<td><p id="tit">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>

			</tr>
			<tr>
				<td><p id="tit">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>

			</tr>
			<tr>
				<td><p id="tit">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>

			</tr>
			<tr>
				<td><p id="tit">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>

			</tr>
			<tr>
				<td><p id="tit">제목</p> <br />
					<p>여기는 내용 입니다.</p></td>
				<td>김모모</td>
				<td>작성자</td>
				<td>1000</td>

			</tr>

		</table>
		<button>글쓰기</button>


	</main>

</body>
</html>