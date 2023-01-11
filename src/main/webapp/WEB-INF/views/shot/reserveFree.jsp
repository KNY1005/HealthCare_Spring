<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약완료</title>
<link href="${path}/resources/css/reset.css" rel="stylesheet"/>
	
    <style>
    @import url("../navbar/font/arita.css");
      body,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      li,
      p,
      #nav li a,
      #topbar,
      input,
      button,
      select,
      textarea,
      a,
      .wf-container > *,
      .widget-title,
      .dwqa-container,
      #wpmem_reg,
      #wpmem_login {
      font-family: "arita-light", "arita-sans-light" !important;
      color: #000;
      }
    *{
      font-weight: bold;
    }
    ul{list-style:none; padding-left:0px;}
    main{
        position: relative; top: 800px; left: 50%;
        transform: translate(-50%, -50%);
        width: 1320px;
        height: 1000px;
        margin: 100px 0;
    }
    .order_box{
        width: 942px;
        display: flex;
        justify-content: center;
        margin-top: 10px;
      }    
    .order{
        width: 600px;
        display: flex;
        flex-direction: row;
        justify-content: space-evenly;
    }
    .check{
        position: relative; top: 400px; left: 50%;
        transform: translate(-50%, -50%);
        width: 1320px;
        height: 1000px;
        margin: 100px 0;
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
    <main>
        <div class="check">
            <div id="money">
                예약이 완료되었습니다.
            </div>
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
            <div id="guide">
                <p>메시지 수신을 동의하신 경우 해당 날짜 전날 SMS 안내문자가 발송될 예정입니다.</p>
                <p>수신동의 설정 : 마이페이지 < 개인정보 수정</p>
            </div>
            <div class="btn">
                <button>예약조회 바로가기</button>
            </div>
            
        </div>
    </main>
    <%@include file="../includes/footer.jsp"  %>
</body>
</html>