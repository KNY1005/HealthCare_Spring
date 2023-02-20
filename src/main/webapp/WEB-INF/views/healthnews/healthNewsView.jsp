<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건강소식 상세보기</title>
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

* {
	font-weight: bold;
}
.order_box {
	width: 790px;
	height: 60px;
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

#view {
	width: 1320px;
	margin: 100px auto;
}

#main #view h2 {
	font-size: 40px;
	font-weight: bold;
}

#view hr {
	height: 2px;
	background-color: #FF7373;
	border: none;
	margin-bottom: 50px;
}

#writing_view {
	width: 1100px;
	height: 625px;
	border: 3px solid #FF8F8F;
	border-radius: 10px;
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
	margin: 0 auto 5px;
	width: 970px;
	height: 540px;
}

#writing_view ul {
	margin: 30px 70px;
}

#writing_view li {
	display: inline-block;
	margin-right: 40px;
	font-weight: bold;
}

#button {
	height: 50px;
	margin-top: 30px;
	margin-right: 100px;
	margin-bottom: 50px;
}

#button button {
	width: 100px;
	height: 50px;
	padding: 10px;
	margin: 0 10px;
	font-size: 20px;
	font-weight: bold;
	background-color: #FFEFEF;
	border: #FFEFEF;
	border-radius: 10px;
	display: inline-block;
	float: right;
}

#button button:hover {
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
			<li></li>			
		</ul>
	</div>
	<main id="main">
		<section id="view">
			<h2>건강소식 상세</h2>
			<hr>
			<div id="writing_view">
				<div class="title">${tubeTitle}</div>
				<div class="content">
					<iframe width="100%" height="100%" src="${tubeURL }"title="YouTube video player" allowfullscreen ></iframe>
				</div>				
			</div>
			<div id="button">
				<button type="button" onClick="location.href='healthnews1.do'">목록</button>
			</div>		
		</section>
	</main>
	<%@include file="../includes/footer.jsp"%>
</body>

</html>