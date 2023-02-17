<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헌혈 유의사항</title>
<!--파비콘-->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path }/resources/image/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${path }/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path }/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<!-- timepicker -->
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"></link>

<script>
		$(function() {
		    $(".time1").timepicker({
		        timeFormat: 'h:mm p',
		        interval: 30,
		        minTime: '09',
		        maxTime: '6:00pm',
		        defaultTime: '09',
		        startTime: '09:00',
		        dynamic: false,
		        dropdown: true,
		        scrollbar: true        
		    });
		})
</script>

<style>

/*main CSS*/
main {
	border: 1px soild #000;
	width: 1320px;
	height: 700px;
	margin: 100px auto ;
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
.order li:nth-child(5){color:#ce8080;}        
/*건강검진 예약*/
main h2 {
	font-size: 40px;
	font-weight: bold;
}
/*첫번째 백그라운드 핑크색박스*/
main .medical {
	background-color: #FFE7E7;
	width: 1320px;
	height: 66px;
	border-radius: 10px;
	margin-top: 30px;
	display: flex;
	align-items: center;
}
#time input, #date input {
		width: 150px;
		height: 50px;
		font-size: 18px;
		font-weight: bold;
		border-radius: 15px;
		text-align: center;
	}
main .medical p {
	text-align: center;
	display: inline-block;
	width: 24%;
	font-size: 20px;
	font-weight: bold;
}

/*중간 핑크색 선*/
main hr {
	margin-top: 30px;
	border: 1px solid #FF7373;
}

main .timetable {
	border-radius: 40px;
	border: 3px solid #FDBFBF;
	margin-top: 30px;
}
/*제일 크고 제일 아래있는 큰 연한 핑크색 박스*/
main .timetable .able {
	height: 350px;
	width: 1290px;
	clear: both;
	display: block;
	z-index: -10;
	margin-left: 15px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	text-align: center;
	font-size: 20px;
}

main .timetable .able #type {
	width: 33%;
	border-radius: 10px;
	background: #Ffe7e7;
	height: 80px;
	display: flex;
	align-items: center;
	font-weight: bold;
	text-align: center;
	justify-content: center;
}

#type input {
	margin-top: 20px;
}

#calender option {
	background: #ff8f8f;
	color: #fff;
	padding: 3px 0;
}

#date label, #date input {
	width: 200px;
	height: 50px;
	font-size: 18px;
	text-align: center;
	border-radius: 15px;
	margin-top: 10px;
}

#date {
	margin: 0 40px 0;
}

#time label, #time input {
	width: 200px;
	height: 50px;
	font-size: 18px;
	border-radius: 15px;
	margin-top: 10px;
}

/*예약 버튼*/
main .timetable #button {
	margin-top: -100px;
	margin-left: 1100px;
	margin-bottom: 30px;
	width: 130px;
	height: 50px;
	border-radius: 10px;
	background-color: #FF9797;
	color: #fff;
	font-size: 25px;
	font-weight: bold;
	border: none;
}

#button:hover {
	border-radius: 10px;
	transition: .2s;
	box-shadow: inset 3px 3px 5px #c57171;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	
	<div class="order_box">
		<ul class="order">
			<li>헌혈 유의사항</li>
			<li><i class="xi-angle-right"></i></li>
			<li>헌혈 전자문진</li>
			<li><i class="xi-angle-right"></i></li>
			<li>헌혈 예약</li>
			<li><i class="xi-angle-right"></i></li>
			<li>헌혈 예약 완료</li>
		</ul>
	</div>

	<main>
		<h2>헌혈 예약</h2>
		<form action="page5.do" method="POST">
			<div class="medical">
				<p><input type="hidden" name="rhospital" value="${zip}">${zip}</p>
				<p>진료시간 : 09:00 ~ 18:00</p>
				<p>주소 : ${addr }</p>
				<p>연락처 : ${phone }</p>
			</div>
			<!--//.medical-->
			<hr>
			<div class="timetable">
				<div class="able">
					<div id="type">
						<p>
							<label> 헌혈종류</label><br> 
							<input type="radio" id="blood_type1" name="rname" value="전혈"><label for="blood_type1">전혈</label> 
							<input type="radio" id="blood_type2" name="rname" value="혈장"><label	for="blood_type2">혈장</label> 
							<input type="radio" id="blood_type3" name="rname" value="혈소판"><label for="blood_type3">혈소판</label>
					</div>
	
					<div id="date">
						<label for="date">날짜</label><br> <input name="rdate" type="date">
					</div>
					<div id="time">
						<label for="time">시간</label><br> <input type="text" class="time1" name="rtime" >
					</div>
	
				</div>
				<input type="hidden" name="rcase" value="B">
				<input type="hidden" name="rstate" value="Y">
				<input type="hidden" name="midx" value="${member.midx }">
				<button id="button" >예약</button>
			</div> 
		</form>
		<!--//.timetable-->
	</main>
	<%@include file="../includes/footer.jsp"%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>