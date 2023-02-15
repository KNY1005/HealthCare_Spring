<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.*"%>
<%@ page import="edu.study.vo.ShotVo"%>
<%
	List<ShotVo> list = (List<ShotVo>)request.getAttribute("datalist");	//형변환,컨트롤러의 키값을 가져옴
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예방접종 선택</title>
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
	<!-- timepicker -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<!-- modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<script>
		$(document).ready(function(){
        $(".choice").click(function(){
            $(this).children(".able").stop().slideDown(600);
        });
        $(".choice").dblclick(function(){
            $(this).children(".able").stop().slideUp(600);
        });
    });
	</script>
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
		});
	</script>
    <style>
    *{
		font-weight: bold;
	}
	#my_modal {
        display: none;
        width: 300px;
        padding: 20px 60px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }

    #my_modal .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
     #confirm{
            height: 80px;
            line-height: 80px;
            text-align: center;
            font-size: 30px;
        }

        .reserve2 {
            
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
	.choice{
		cursor:pointer;
	}
    .list li{
		width: 160px;
	}
	
	.box{
		background-color: #ffe7e7;
	}
	.box li{
		width: 250px;
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
            <li><i class="xi-angle-right"></i></li>
            <li>예방접종 병원조회</li>
            <li><i class="xi-angle-right"></i></li>
            <li style="color: #CE8080;">예방접종 예약하기</li>
            <li><i class="xi-angle-right"></i></li>
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
					<li>병원명 : ${zip}</li>
					<li>진료시간 : 09:00 ~ 18:00</li>
					<li>주소 : ${addr }</li>
					<li>연락처 : ${phone }</li>
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
					<li>가격</li>
				</ul>
			</div>
			<c:forEach items="${datalist}" var="vo"  varStatus="status">				
					<div class="choice">
						<ul class="box">
							<li id="cdnm${status.index}">${vo.cdNm}</li>                
							<li>${vo.cdDate}</li>
							<li>${vo.cdCount}</li>
							<li id="cdCharge${status.index}">${vo.cdCharge}</li>
						</ul>
					
						<div class="able" style="display: none;">
							<div id="date">
								<label>날짜</label>
								<input id="input_date" class="form-control" type="date" name="date">
								
							</div>
							<div id="time">
								<label>시간</label>
								<input type="text" class="time1 form-control" name="time" id="input_time">
							</div>
							<div id="btn">
								<button type="button" onclick="test(${status.index})">예약</button>
							</div>
						</div>
					</div>
					<div id="modal1" class="modal">
						<p id="book_date">
						<input type="hidden" name="date[]" id="date_list" value=""/>
						<input type="submit" onclick="getlist()">
						</p>
						<p id="zip">${zip}</p>
						<p id="cdNm">${vo.cdNm}</p>
						<p>예약하시겠습니까?</p>
						<p><a href="abc6.do">확인</a></p>
					</div>				
			</c:forEach>
        </div>
      
	
	</main>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script type="text/javascript">	
	function test(idx){		
		var cdnm = document.getElementById("cdnm"+idx).innerText;
		var date = document.getElementsByName("date")[idx].value;
		var time = document.getElementsByName("time")[idx].value;
		var cdCharge = document.getElementById("cdCharge"+idx).innerText;
		alert("예약하시겠습니까?");
		console.log("date?"+date+"time"+time+"cdnm?"+cdnm+"병원명"+"${zip}"+"가격:"+cdCharge);
		
		var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "POST");  //Post 방식
        form.setAttribute("action", "abc6.do"); //요청 보낼 주소 */

        var hiddenField = document.createElement("input");        
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "rname");
        hiddenField.setAttribute("value", cdnm);
        form.appendChild(hiddenField);
        
        var hiddenField = document.createElement("input");        
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "rbuy");
        hiddenField.setAttribute("value", cdCharge);
        form.appendChild(hiddenField);
        
        var hiddenField = document.createElement("input");        
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "rdate");
        hiddenField.setAttribute("value", date);
        form.appendChild(hiddenField);
        
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "rtime");
        hiddenField.setAttribute("value", time);
        form.appendChild(hiddenField);
    
        hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", "rhospital");
        hiddenField.setAttribute("value", "${zip}");
        form.appendChild(hiddenField);
        
        document.body.appendChild(form);

        form.submit(); 
	}	
	</script>
	<%@include file="../includes/footer.jsp"  %>
</body>

</html>