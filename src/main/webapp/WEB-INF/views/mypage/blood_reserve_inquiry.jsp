<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헌혈예약조회</title>
<!--파비콘-->
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favicon/android-icon-144x144.png"/>
<link rel="manifest" href="${path}/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage" content="${path}/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<!-- 제이쿼리 라이브러리 연결 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link href="${path}/resources/css/reset.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage/blood_reserve_inquiry.css" rel="stylesheet" />

<script src="${path}/resources/js/mypage/blood_reserve_inquiry.js"></script>
<!--스와이퍼-->
    <link
    rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"
    />
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
                    <li><a href="<%=request.getContextPath() %>mypage2.do">예방접종 조회</a></li>
                    <li><a href="<%=request.getContextPath() %>mypage3.do">건강검진 조회</a></li>
                    <li><a href="<%=request.getContextPath() %>mypage1.do">헌혈 스탬프 / 조회</li>
                  </ul>
                </li>
                <li class="menu-v1">
                  <p class="a"><a href="<%=request.getContextPath() %>mypage4.do">내가 쓴 글</a></p>
                </li>
                <li class="menu-v1">
                  <p class="a"><a href="<%=request.getContextPath() %>mypage5.do">개인정보 수정</a></p>
                </li>
              </ul>
          </div>
      </section>
      <section class="main_content">
        <div class="main_content_title">
            <h2>헌혈 스탬프 / 조회</h2>
            <p><span>김모모</span>님은 <span>10</span>회 헌혈하셧습니다</p>

        </div>
        <hr />
        <div class="blood">
            <!-- 첫번째 슬라이드 -->
            <div class="slider">
              <div class="inner">
                  <ul class="swiper-wrapper slide_list">
                      <li class="swiper-slide">
                        <div class="swiper_box">
                          
                        </div>
                      </li>
                      <li class="swiper-slide">slider2</li>
                      <li class="swiper-slide">slider3</li>
                      <li class="swiper-slide">slider4</li>
                      <li class="swiper-slide">slider5</li>
                      <li class="swiper-slide">slider5</li>
                      <li class="swiper-slide">slider5</li>
                      <li class="swiper-slide">slider5</li>
                      <li class="swiper-slide">slider5</li>
                      <li class="swiper-slide">slider5</li>
                      <li class="swiper-slide">slider5</li>
                  </ul>
              </div>
          </div>
        <hr/>
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
                    <li>종류</li>
                    <li>날짜</li>
                    <li>시간</li>
                    <li>헌혈의 집</li>
                    <li>위치</li>
                </ul>
            </div>
            <div class="box">
              <div class="checkbox_box">
                <label>
                    <input type="checkbox" />
                    <span class="checkbox" >
                    </span>
                </label>

              </div>

              <ul class="reserve_list">
                <li>전혈</li>
                <li>2022년 12월 30일</li>
                <li>오후 4시</li>
                <li>전주 헌혈의 집</li>
                <li>전라북도 전쥐시 땡떙동 땡땡길 10 4층</li>
              </ul>
            </div>

               <div class="box">
              <div class="checkbox_box">
                <label>
                    <input type="checkbox" />
                    <span class="checkbox" >
                    </span>
                </label>

              </div>

              <ul class="reserve_list">
                <li>전혈</li>
                <li>2022년 12월 30일</li>
                <li>오후 4시</li>
                <li>전주 헌혈의 집</li>
                <li>전라북도 전쥐시 땡떙동 땡땡길 10 4층</li>
              </ul>
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