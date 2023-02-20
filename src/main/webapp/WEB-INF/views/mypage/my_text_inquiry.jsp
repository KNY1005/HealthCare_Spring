<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 글 조회</title>
<!--파비콘-->
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favicon/android-icon-144x144.png"/>
<link rel="manifest" href="${path}/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage" content="${path}/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<!-- 제이쿼리 라이브러리 연결 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link href="${path}/resources/css/reset.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage/my_text_inquiry.css" rel="stylesheet" />

<script src="${path}/resources/js/mypage/mypage_sub_menu.js"></script>

</head>
<body>
<div class="header">
<%@include file="../includes/header.jsp"%>
</div>

  <body>
    <main>
      <section>
        <p class="mypage_manu_p">마이페이지</p>
        <div class="mypage_manu">
          <div class="mypage_manu_1">
              <ul id="nav-v1">
                <li class="menu-v1">
                  <p class="a"><a href="<%=request.getContextPath() %>/member/mypage2.do">조회</a></p>
                  <ul class="submenu">
                    <li><a href="<%=request.getContextPath() %>/member/mypage2.do?midx=${member.midx}">예방접종 조회</a></li>
                    <li><a href="<%=request.getContextPath() %>/member/mypage3.do?midx=${member.midx}">건강검진 조회</a></li>
                    <li><a href="<%=request.getContextPath() %>/member/mypage1.do?midx=${member.midx}">헌혈 조회</li>
                  </ul>
                </li>
                <li class="menu-v1">
                  <p class="a"><a href="<%=request.getContextPath() %>/member/mypage4.do?midx=${member.midx}">내가 쓴 글</a></p>
                </li>
                <li class="menu-v1">
                  <p class="a"><a href="<%=request.getContextPath() %>/member/mypage5.do?midx=${member.midx}">개인정보 수정</a></p>
                </li>
              </ul>
          </div>
        </div>
      </section>
      <section class="main_content">
        <div class="main_content_title">
            <h2>내가 쓴 글</h2>
        </div>


        <hr />
        <div class="list">
            <div class="box">
              <div class="checkbox_box">
                <p>전체선택</p>
                <label>
                    <input type="checkbox"  onclick='selectAll(this)'/>
                    <span class="checkbox" >
                    </span>
                </label>

              </div>
                <ul class="main_list">
                    <li>제목</li>
                    <li>내용</li>
                    <li>작성자</li>
                    <li>작성시간</li>
                    <li>조회수</li>
                    <li>삭제여부</li>
                </ul>
            </div>
			<c:forEach items="${selectMyBoard}" var="vo">
            <div class="box">
              <div class="checkbox_box">
                <label>
                    <input type="checkbox" />
                    <span class="checkbox" >
                    </span>
                </label>
              </div>
              
              <ul class="reserve_list">
                <li style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${vo.btitle}</li>
				<li style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">${vo.bcontent}</li>
                <li>${vo.bwriter}</li>
                <li>${vo.bwdate}</li>
                <li>${vo.bhit}</li>
                <li>${vo.bstate}</li>
              </ul>
             </c:forEach>

            </div>
        </div>
        <!--.reserve_list-->
      </section>
      <div class="button">
        <input type="button" value="삭제하기"/>
      </div>
    </main>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>