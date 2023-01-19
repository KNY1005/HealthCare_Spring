<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<!-- 카카오페이 -->
	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp08752868"); 
    
        function requestPay() {
            IMP.request_pay({	// param
                pg : 'kakaopay',
                pay_method : 'card',
                merchant_uid: 'merchant_' + new Date().getTime(),  // 예약번호
                name : '독감 백신',
                amount : 1004,
                buyer_email : 'Iamport@chai.finance',
                buyer_name : '구매자 이름',
                buyer_tel : '010-1234-5678',
                buyer_addr : '전라북도 전주시',
                buyer_postcode : '123-456'
            }, function (rsp) {		// callback
            	/** 결제 검증 **/
                $.ajax({
                    type: 'POST',
                    url: '/verifyIamport/'+rsp.imp_uid,
                    beforeSend: function(xhr){
                        xhr.setRequestHeader(header, token);
                    }
                }).done(function(result){

                    // rsp.paid_amount와 result.response.amount(서버 검증) 비교 후 로직 실행
                    if(rsp.paid_amount === result.response.amount){
                        alert("결제가 완료되었습니다.");
                        $.ajax({
                            type:'POST',
                            url:'http://localhost:8090/controller/abc9.do',
                            beforeSend: function(xhr){
                                xhr.setRequestHeader(header, token);
                            }
                        }).done(function() {
                        	window.location.href = "abc9.do";
                        }).fail(function(error){
                                alert(JSON.stringify(error));
                        })
                    } else{
                    	alert("결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}");
                    }
                })
            });
        };
    </script>
<meta charset="UTF-8">
<title>유료결제</title>
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
        text-align: left;
        font-size: 40px;
        margin-bottom: 20px;
    }
    #line{
		height: 2px; 
		background-color: #FF7373; 
		border: none; 
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
    #button{
      display: flex;
      justify-content: flex-end;
      width: 1325px;
      height: 50px;
      margin-top: 20px;
    }
    #button button{
      width: 150px;
      margin: 0 10px; 
      font-size: 25px;
      background-color: #FFEFEF; 
      border: #FFEFEF;  
      border-radius: 30px;}
	 #button :hover{
    	box-shadow: inset 1px 1px 3px rgb(148, 140, 140);
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
            <li style="color: #CE8080;">예방접종 유료결제</li>
        </ul>
    </div>
    <main>
        <div class="check">
            <div id="money">
                예방접종 유료결제
            </div>
            <hr id="line">
            <div id="infor">
                <ul>
                    <li>병원명</li>
                    <li>땡떙병원</li>
                </ul>
                <ul>
                    <li>날짜</li>
                    <li></li>
                </ul>
                <ul>
                    <li>접종명</li>
                    <li></li>
                </ul>
            </div>
            
            <div id="button">
                <button style="background-color: #05CF00;"
                 onClick="location.href='abc8.do'">네이버페이</button>
                <button style="background-color: #FFE800;"
                 onClick="requestPay()">카카오페이</button>
                <button onClick="location.href='abc8.do'">카드결제</button>
            </div>
            
        </div>
    </main>
   <%@include file="../includes/footer.jsp"  %>
</body>
</html>