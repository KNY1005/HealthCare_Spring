<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예방접종 유료결제</title>
    <style>
    *{
      font-weight: bold;
    }
    body{
        height: 1200px;
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
    	box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
        cursor:pointer;
    } 
    #charge_alert{width: 500px;height: 400px; position: fixed; top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            background-color: white; opacity: 1; border-radius: 10px; z-index: 2;} 
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
                <button style="background-color: #05CF00;">네이버페이</button>
                <button style="background-color: #FFE800;">카카오페이</button>
                <button>카드결제</button>
            </div>
            
        </div>
    </main>
    <%@include file="../includes/footer.jsp"  %>
    <div id="charge_alert"></div>
    <div id="bac"></div>
</body>
</html>