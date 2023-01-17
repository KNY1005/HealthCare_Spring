<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--파비콘-->
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favicon/android-icon-144x144.png"/>
<link rel="manifest" href="${path}/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage" content="${path}/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />

<link href="${path}/resources/css/reset.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage/my_information_inquiry.css" rel="stylesheet" />

<script src="${path}/resources/js/mypage/my_information_inquiry.js"></script>

</head>
<body>
<%@include file="../includes/header.jsp"%>
    <main>
      <section>
        <p class="mypage_manu_p">마이페이지</p>
        <div class="mypage_manu">
          <div class="mypage_manu_1">
              <ul id="nav-v1">
                <li class="menu-v1">
                  <p class="a"><a href="mypage2.do">조회</a></p>
                  <ul class="submenu">
                    <li><a href="mypage2.do">예방접종 조회</a></li>
                    <li><a href="mypage3.do">건강검진 조회</a></li>
                    <li><a href="mypage1.do">헌혈 스탬프 / 조회</li>
                  </ul>
                </li>
                <li class="menu-v1">
                  <p class="a"><a href="#">내가 쓴 글</a></p>
                </li>
                <li class="menu-v1">
                  <p class="a"><a href="#">개인정보 수정</a></p>
                </li>
              </ul>
          </div>
        </div>
      </section>
      <section class="main_content">
        <div class="main_content_title">
            <h2>개인정보설정</h2>
        </div>
        <hr />
      </main>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>