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
			<form action="abc4.do" method="get">
			<div class="hospital">
				<ul>
					<li>병원명 : <input type="hidden" name="zip" value="${zip}">${zip}</li>
					<li>진료시간 : 09:00 ~ 18:00</li>
					<li>주소 : ${addr }</li>
					<li>연락처 : ${phone }</li>
				</ul>
			</div>  
			</form>
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
			<c:forEach items="${datalist}" var="vo"  varStatus="status">
				<form id="choice_form_${status.index}">
					<div class="choice">
						<ul class="box">
							<li id="cdnm">${vo.cdNm}</li>                
							<li>${vo.cdDate}</li>
							<li>${vo.cdCount}</li>
							<li>${vo.cdFC}</li>
						</ul>
					
						<div class="able" style="display: none;">
							<div id="date">
								<label>날짜</label>
								<input id="input_date" class="form-control" type="date">
							</div>
							<div id="time">
								<label>시간</label>
								<input type="text" class="time1 form-control" name="time1" id="contents">
							</div>
							<div id="btn" onclick="EX01(${status.index});">
								<button id="reserveBtn" type="button" data-toggle="modal" data-target="#myModal"data-id="전달할 값"><a href="#modal1" rel="modal:open">모달창띄우기</a></button>
							</div>
						</div>
					</div>
				</form>
			</c:forEach>
        </div>
        <%-- <div id="my_modal">
		<div id="background_modal" class="background_modal">
			<div class="modal_contents">
				 <div id="confirm">
	                <p>예방접종 예약 확인</p>
	            </div>
	            <div class="reserve2">
	                <p>예약일 / 예약시간</p>
	                <p>${zip}</p>
	                <p>${vo.cdNm}</p>
	                <p>예약하시겠습니까?</p>
	            </div>
				<br>
				<button onClick="location.href='abc6.do'">확인</button>
			</div>
		    <a class="modal_close_btn"><i class="xi-close"></i></a>
		</div> --%>
	</div>
	</main>
	<%@include file="../includes/footer.jsp"  %>
	

<div id="modal1" class="modal">
  <p>예약일 / 예약시간</p>
	                <p>${zip}</p>
	                <p>${vo.cdNm}</p>
	                <p>예약하시겠습니까?</p>
  <a href="abc6.do">확인</a>
</div>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script type="text/javascript">
	//모달창
	
	function EX01(idx){
//		alert("EX01 call");
		var str_id = "#choice_form_" + idx;
		var obj = $("#cdnm",str_id).html();
		var form_data = $(str_id).serialize();
//		console.log(idx);
		console.log(obj);
		console.log(form_data);
		var info = $("#modal1").text(form_data);
		alert(info);
		$("#modal1").text(form_data);
	    /* modal('my_modal',obj,form_data); */
	    
	    
		
	    
		/* function modal(id, obj, form_data) {
		    var zIndex = 9999;
		    var modal = document.getElementById(id);

		    // 모달 div 뒤에 희끄무레한 레이어
		    var bg = document.createElement('div');
		    bg.setStyle({
		        position: 'fixed',
		        zIndex: zIndex,
		        left: '0px',
		        top: '0px',
		        width: '100%',
		        height: '100%',
		        overflow: 'auto',
		        // 레이어 색갈은 여기서 바꾸면 됨
		        backgroundColor: 'rgba(0,0,0,0.4)'
		    });
		    document.body.append(bg);

		    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
		    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
		        bg.remove();
		        modal.style.display = 'none';
		    });

		    modal.setStyle({
		        position: 'fixed',
		        display: 'block',
		        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

		        // 시꺼먼 레이어 보다 한칸 위에 보이기
		        zIndex: zIndex + 1,

		        // div center 정렬
		        top: '50%',
		        left: '50%',
		        transform: 'translate(-50%, -50%)',
		        msTransform: 'translate(-50%, -50%)',
		        webkitTransform: 'translate(-50%, -50%)'
		    });
		}  */
	}
	


	// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
	Element.prototype.setStyle = function(styles) {
	    for (var k in styles) this.style[k] = styles[k];
	    return this;
	};

	/* document.getElementById('reserveBtn').addEventListener('click', function() {
		
		 var select = $(this).data('id');
		 $("#contents.time1").val(data);
	    // 모달창 띄우기
	    modal('my_modal');
	}); */
 
	</script>
</body>

</html>