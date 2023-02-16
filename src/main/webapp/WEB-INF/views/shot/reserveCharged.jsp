<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.*"%>
<%@ page import="edu.study.vo.ShotVo"%>
<!DOCTYPE html>
<html>
<head>
	<!-- 아임포트 -->
	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
    function charge(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp08752868'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'html5_inicis',
            pay_method : 'card',
            Cnum : 'merchant_' + new Date().getTime(),
            name : '${rname}',
            amount : '${rbuy}',
            buyer_email : 'dbsco0322@naver.com',
            buyer_name : '박윤채',
            buyer_tel : '22',
            buyer_addr : '22',
            //buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='<%=request.getContextPath()%>/shot/abc9.do?msg='+msg;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
                
                
            }
        });
        
    };
    </script>
<title>예약완료</title>
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
    *{
      font-weight: bold;
    }
    ul{list-style:none; padding-left:0px;}
    main{
        
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
    .check{
        
        width: 1320px;
        height: 1000px;
        margin: 230px 0;
    }
    #money{
        text-align: center;
        font-size: 40px;
        margin-bottom: 40px;
    }
    #infor{
        width: 1319px;
        height: 170px; 
        background-color: #FFEFEF;
        border-radius: 20px;
        display: flex;
        justify-content: space-evenly;
    }
    #infor ul{
        padding: 30px; 
        font-size: 25px;
        line-height: 70px;
    }
    #infor li{
        width: 200px;
        height: 50px;
        text-align: center;
    }
    #guide{
        display: flex;
        flex-direction: column;
        margin: 10px 0;
    }
    .btn{
        display: flex;
        justify-content: flex-end;
    }
    .btn button{
        width: 270px; 
        padding: 15px; 
        font-size: 25px;
        background-color: #FFEFEF; 
        border: #FFEFEF;  
        border-radius: 30px;}
    .btn :hover{
        border-radius: 30px;
        box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
        cursor:pointer;
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
            <li>예방접종 예약하기</li>
            <li><i class="xi-angle-right"></i></i></li>
            <li style="color: #CE8080;">예방접종 예약완료</li>
        </ul>
    </div>
    <main id="main">
        <div class="check">
            <div id="money">
                예약이 완료되었습니다.
            </div>
            <div>
                <ul>
                    <li>병원명</li>
                    <li>${rhospital}</li>
                </ul>
                <ul>
                    <li>날짜</li>
                    <li>${rdate}/${rtime}</li>
                </ul>
                <ul>
                    <li>접종명</li>
                    <li>${rname}</li>
                </ul>
                <ul>
                  <li>금액</li>
                  <li>${rbuy}</li>
                </ul>
            </div>
            <div id="guide">
                <p>메시지 수신을 동의하신 경우 해당 날짜 전날 SMS 안내문자가 발송될 예정입니다.</p>
                <p>수신동의 설정 : 마이페이지 < 개인정보 수정</p>
            </div>
            <div class="btnn">
                <button onClick="charge();">결제진행 바로가기</button>
            </div>
            
        </div>
    </main>
    <%@include file="../includes/footer.jsp"  %>
</body>
</html>