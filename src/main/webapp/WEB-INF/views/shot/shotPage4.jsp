<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예방접종 예약확인</title>
	<!--파비콘-->
	<link rel="icon" type="image/png" sizes="16x16"
		href="${path }/resources/image/favicon/favicon-16x16.png" />
	<link rel="manifest"
		href="${path }/resources/image/favicon/manifest.json" />
	<meta name="msapplication-TileColor" content="#ffffff" />
	<meta name="msapplication-TileImage"
		content="${path }/resources/image/favicon/ms-icon-144x144.png" />
	<meta name="theme-color" content="#ffffff" />
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
    <script>
        $(document).ready(function () {
            $(".choice").mouseover(function () {
                $(this).children(".able").stop().slideDown(600);
            });
            $(".choice").mouseleave(function () {
                $(this).children(".able").stop().slideUp(600);
            });
        });
        
        function two(){
        	var a=1;
        	if(a==1){ 
        	      location.href ="abc6.do";
        	     }
        	 
        	else{ location.href = "abc5.do";
        	     }
        }
    </script>
    <style>
        * {
            font-weight: bold;
        }

        /* alert css */
        #alert {
            width: 500px;height: 300px; position: fixed; top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            background-color: white; opacity: 1; border-radius: 10px; z-index: 2;
        }

        .all {
            width: 500px;
            display: flex;
            flex-direction: column;
        }

        #confirm{
            height: 80px;
            line-height: 80px;
            text-align: center;
            font-size: 30px;
        }

        .reserve2 {
            width: 500px;
            display: flex;
            flex-direction: column;
            text-align: center;
            margin-bottom: 10px;
        }

        .reserve2 p {
            font-size: 20px;
            height: 50px;
            line-height: 50px;
        }

        #btn2 {
            display: flex;
            justify-content: center;
        }

        #btn2 button {
            width: 100px;
            padding: 10px;
            margin: 0 36px;
            font-size: 20px;
            color: white;
            background-color: #FF9797;
            border: #FF9797;
            border-radius: 10px;
        }

        button:hover {
            box-shadow: inset 3px 3px 5px #c57171;
            cursor: pointer;
            transition: box-shadow 0.1s linear;
        }

        /* alert css */
        body{
			height: 143vh;
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

        .reserve {
            display: flex;
            flex-wrap: wrap;
        }

        .menu p {
            font-size: 40px;
            text-align: left;
        }

        .hospital ul {
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

        #line {
            height: 2px;
            background-color: #FF7373;
            border: none;
            margin-top: 40px;
        }

        .list ul {
            height: 80px;
            line-height: 80px;
            display: flex;
            justify-content: space-evenly;
            font-size: 20px;
            border-radius: 10px;
            margin-bottom: 15px;
            text-align: center;
        }

        .list li {
            width: 160px;
        }

        .box {
            background-color: #ffe7e7;
        }

        .able {
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

        #date label,
        input {

            width: 150px;
            height: 50px;
            font-size: 18px;
            text-align: center;
            border-radius: 15px;
        }

        #time label,
        input {
            width: 150px;
            height: 50px;
            font-size: 18px;
            border-radius: 15px;
        }

        label {
            margin-right: 15px;
        }

        #btn button {
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
            box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
            cursor: pointer;
            transition: box-shadow 0.1s linear;
        }
        #bac{
        position: relative;
        bottom: 1560px;
        height: 143vh;
        background-color: rgba(76, 76, 76, 0.7);
        z-index: 1;
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
                    <li>독감</li>
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
                    <li>독감</li>
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
                    <li>독감</li>
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
    <section id="alert">
        <div class="all">
            <div id="confirm">
                <p>예방접종 예약 확인</p>
            </div>
            <div class="reserve2">
                <p>예약일 / 예약시간</p>
                <p>예약병원/접종명</p>
                <p>예약하시겠습니까?</p>
            </div>
            <div id="btn2">
                <button onClick="two()">확인</button>
                <button onClick="location.href='abc3.do'">취소</button>
            </div>
        </div>
    </section>
    <div id="bac"></div>
</body>

</html>