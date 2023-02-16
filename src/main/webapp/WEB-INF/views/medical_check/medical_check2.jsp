<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=, initial-scale=1.0">
	<title>건강검진 예약하기</title>
	<!--파비콘-->
	<script type="text/javascript" src="${path }/resources/js/jquery-3.6.1.min.js"></script>
	<link rel="icon" type="image/png" sizes="16x16"
		href="${path }/resources/image/favicon/favicon-16x16.png" />
	<link rel="manifest"
		href="${path }/resources/image/favicon/manifest.json" />
	<meta name="msapplication-TileColor" content="#ffffff" />
	<meta name="msapplication-TileImage"
		content="${path }/resources/image/favicon/ms-icon-144x144.png" />
	<meta name="theme-color" content="#ffffff" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	
	<script>
	
	function resbtn(){
		 if (confirm("예약하시겠습니까?") == true){ 
			   console.log("완료되었습니다.");
			 }else{
			   console.log("취소되었습니다");
			 }
	}
	</script>
	

	<style>
		/*-----------------sub_nav_menu > start---------------*/
		
		*{font-weight:bold;}
		
		
		main {
			width: 1320px;
			min-height:529px;
			margin: 100px auto;
		}
		
		.order_box{
				margin-left:50px;
		        width: 790px;
		        height: 110px;
		        display: flex;
		 		align-items: flex-end;
		        justify-content: center;
		      }    
		.order{
		        width: 600px;
		        display: flex;
		        flex-direction: row;
		        justify-content: space-evenly;
		        }
		.order li:nth-child(3){color:#ce8080;}

		
		/*-----------------sub_nav_menu > end---------------*/
		main h2 {
			font-size: 40px;
		}
		/*첫번째 백그라운드 핑크색박스*/
		main .medical {
			background-color: #FFE7E7;
			width: 1320px;
			height: 66px;
			border-radius: 10px;
			margin-top: 30px;
		}

		main .medical p {
			float: left;
			font-size: 22px;
			margin-top: 22px;
		}

		main .medical p:nth-child(1) {
			margin-left: 44.805px;
		}

		main .medical p:nth-child(2) {
			margin-left: 80px;
		}

		main .medical p:nth-child(3) {
			margin-left: 80px;
		}

		main .medical p:nth-child(4) {
			margin-left: 80px;
		}
		/*중간 핑크색 선*/
		main hr {
			margin-top: 30px;
			border: 1px solid #FF7373;
		}

		/*제일 크고 제일 아래있는 큰 연한 핑크색 박스*/
		main .timetable {
			margin-top:30px;
			border-radius: 40px;
			border: 3px solid#FDBFBF;
			height: 305px;
			width: 1290px;
			display: flex;
			flex-direction:column;
			margin-left: 15px;
		}
		
		main .timetable #title{
			justify-content:center;
			margin-top:60px;
			font-size:25px;
			display:flex;
			}
		main .timetable #title p{
			text-align:center;
			width:250px;
			margin-right:80px;
			}
			
		
		main .timetable #content{
			justify-content:center;
			font-size:25px;
			display:flex;
			}
		
		main .timetable #content p{
			width: 250px;
			height:60px;
			line-height:60px;
			border:none;
			border-radius: 20px;
			margin-right:80px;
			text-align:center;
			background-color:#FFE7E7;}


		main .timetable  #content #date, #time{
			width:250px;
			margin-right:80px;
			}
			
		main .timetable  #content #date label{
			width: 250px;
			height: 50px;
			font-size:25px;
			text-align: center;
	
		}


		#date, #content p{
		margin-top:65px;}

		main .timetable #content #time label{
			width: 250px;
			height: 50px;
			font-size:25px;
			text-align: center;

			
			
		}
		
		#time input{
			height: 50px;
			margin-top:40px;
			
		}
		
		#time input, #date input {
		width: 250px;
		height: 50px;
		font-size: 25px;
		border: 1px solid#000;
		border-radius: 10px;
		text-align: center;
		
		
	}

		
		/*예약 버튼*/
		main button {
			width: 130px;
			height: 50px;
			border-radius: 10px;
			background-color: #FF9797;
			color: #fff;
			font-size: 25px;
			margin-top: 40px;
			border: none;
			margin-left:1170px;
			cursor: pointer;
		}
		
		main button:hover {
			box-shadow: inset 3px 3px 5px #c57171;
			cursor: pointer;
			transition: all 0.3s;
		}
	</style>


</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="order_box">
		<ul class="order">
			<li>건강검진 유의사항</li>
			<li><i class="xi-angle-right"></i></li>
			<li>건강검진 병원조회</li>
			<li><i class="xi-angle-right"></i></li>	
			<li>건강검진 예약하기</li>
			<li><i class="xi-angle-right"></i></li>
			<li>건강검진 예약완료</li>
		</ul>
	</div>
	<main>
		<h2>건강검진 예약</h2>
		<form action="medicalresult.do" method="POST">
		<div class="medical">
			<p><input type="hidden" name="hName" value="${hName}">${hName}</p>
			<p>${hName }</p>
			<p>진료시간 : 09:00 ~ 18:00</p>
			<p>주소 : ${addr }</p>
			<p>연락처 : ${tel }</p>
		</div><!--//.medical-->
		<hr>
		<div class="timetable">
				<div id="title">
					<p>검진명</p>
					<p>날짜</p>
					<p>시간</p>
				</div><!--//#title-->				
				<div id="content">
					<p>일반건강검진</p>
					<div id="date">
						<label for="date"></label>
						<input name="rdate" type="date">
					</div>
					<div id="time">
						<label for="time"></label><br> <input type="text" class="time1" name="rtime" >
					</div>
				</div>
		</div><!--//.timetable-->
		<button onclick="resbtn();">예약</button>
	</form>
	</main>
		<%@include file="../includes/footer.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>



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



</body>

</html>
	