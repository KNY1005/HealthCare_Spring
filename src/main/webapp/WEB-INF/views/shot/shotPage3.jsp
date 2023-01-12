<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예방접종 선택</title>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
	<script>
		$(document).ready(function(){
        $(".choice").mouseover(function(){
            $(this).children(".able").stop().slideDown(600);
        });
        $(".choice").mouseleave(function(){
            $(this).children(".able").stop().slideUp(600);
        });
    });
	</script>
    <style>
    *{
		font-weight: bold;
	}
    main {
        
        width: 1320px;
        height: 1000px;
        margin: 100px auto;
    }    
     .order_box{
        width: 942px;
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
	.reserve{
		display: flex;
		flex-wrap: wrap;
	}
	.menu{
		width: 1400px;
		font-size: 40px;
	}
	.hospital ul{
		width: 1281px;
		height: 50px;
		display: flex;
		flex-direction: row;
		justify-content: space-evenly;
		margin-top: 40px;
		background-color: #FFE7E7;	
		border-radius: 20px;
		font-size: 20px;
		line-height: 50px;
		padding: 20px;
	}	
	#line{
		height: 2px; 
		background-color: #FF7373; 
		border: none; 
        margin-top: 40px;
	}
    .list ul{
		height: 80px;
		line-height: 80px;
		display: flex;
		justify-content: space-evenly;
		font-size: 20px;
		border-radius: 10px;
		margin-bottom: 15px;
		text-align: center;
	}
    .list li{
		width: 160px;
	}
	
	.box{
		background-color: #ffe7e7;
	}
	.able{ 
		width: 1297px; 
		height: 200px;
		display: flex;
		flex-direction: row;
		justify-content: space-evenly;
		align-items: center;
		border: 1px solid #FF6D6D;
		border-radius: 15px;
		position: relative;
		right: -10px;
		margin-bottom: 13px;
	} 
	#time label, #date label {
		width: 150px;
		height: 50px;
		font-size: 20px;
		text-align: center;
		border-radius: 15px;
		margin-right: 10px;
	}

	#time input, #date input {
		width: 150px;
		height: 50px;
		font-size: 18px;
		border-radius: 15px;
		text-align: center;
	}

	#btn button{
		width: 130px;
		height: 50px;
		border-radius: 10px;
		background-color: #FF9797;
		color: #fff;
		font-size: 18px;
		margin-right: 30px;
		border: none;
		justify-content: flex-end;
	}
	#btn button:hover {
	box-shadow: inset 1px 1px 3px #c57171;
	cursor: pointer;
	transition: box-shadow 0.1s linear;
	}
	</style>
</head>

<body>
	<%@include file="../includes/header.jsp"  %>
    <div class="order_box">
        <ul class="order">
            <li>예방접종 유의사항</li>
            <li><i class="xi-angle-right"></i></i></li>
            <li>예방접종 병원조회</li>
            <li><i class="xi-angle-right"></i></i></li>
            <li style="color: #CE8080;">예방접종 예약하기</li>
            <li><i class="xi-angle-right"></i></i></li>
            <li>예방접종 예약완료</li>
        </ul>
    </div>
	<main>
		<div class="reserve">
            <div class="menu">
                <p>예방접종 예약</p>
			</div>
			<div class="hospital">
				<ul>
					<li>땡땡 병원</li>
					<li>진료시간 : 00:00 ~ 00:00</li>
					<li>주소 : 전라북도 전주시 완산구 땡땡로 77</li>
					<li>연락처 : 063-222-0000</li>
				</ul>
			</div>  
        </div>
		<hr id="line">
		<div class="list">
			<div class="inf">
				<ul>
					<li>백신명</li>
					<li>신청가능기간</li>
					<li>잔여량</li>
					<li>유/무료</li>
				</ul>
			</div>
			<div class="choice">
				<ul class="box">
					<li >독감</li>                
					<li>22.10.10 ~ 22.12.10</li>
					<li>잔여량</li>
					<li>유/무료</li>
				</ul>
				<div class="able" style="display: none;">
					<div id="date">
						<label for="">날짜</label>
						<input type="date">
					</div>
					<div id="time">
						<label for="">시간</label>
						<input type="time">
					</div>
					<div id="btn">
						<button>예약</button>
					</div>
				</div>	
			</div>
			
			<div class="choice">
				<ul class="box">
					<li >독감</li>                
					<li>22.10.10 ~ 22.12.10</li>
					<li>잔여량</li>
					<li>유/무료</li>
				</ul>
				<div class="able" style="display: none;">
					<div id="date">
						<label for="">날짜</label>
						<input type="date">
					</div>
					<div id="time">
						<label for="">시간</label>
						<input type="time">
					</div>
					<div id="btn">
						<button>예약</button>
					</div>
				</div>	
			</div>
			<div class="choice">
				<ul class="box">
					<li >독감</li>                
					<li>22.10.10 ~ 22.12.10</li>
					<li>잔여량</li>
					<li>유/무료</li>
				</ul>
				<div class="able" style="display: none;">
					<div id="date">
						<label for="">날짜</label>
						<input type="date">
					</div>
					<div id="time">
						<label for="">시간</label>
						<input type="time">
					</div>
					<div id="btn">
						<button>예약</button>
					</div>
				</div>	
			</div>
        </div>
	</main>
	<%@include file="../includes/footer.jsp"  %>
</body>

</html>