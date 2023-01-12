<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
<title>Home</title>
<style>
	
</style>
</head>
<body>
	<header>
      <div class="nav_background">
        <nav class="nav">
          <div class="nav_main_menu">
            <ul class="nav_main_menu_1">
              <li>
                <a href="#"
                  ><img src="../image/로고2.png" alt="로고이미지"
                /></a>
              </li>
            </ul>
            <ul>
              <li><a href="#">예방접종</a></li>
            </ul>
            <ul>
              <li><a href="#">건강검진</a></li>
            </ul>
            <ul>
              <li><a href="#">헌혈</a></li>
            </ul>
            <ul>
              <li><a href="#">모두건강</a></li>
            </ul>
            <ul>
              <li><a href="#">건강광장</a></li>
            </ul>
          </div>
          <div id="sliding_menu">
            <ul>
              <li><a href="#">예방접종 예약</a></li>
            </ul>
            <ul>
              <li><a href="#">건강검진 예약</a></li>
            </ul>
            <ul>
              <li><a href="#">헌혈 예약</a></li>
            </ul>
            <ul>
              <li><a href="#">건강소식</a></li>
              <li><a href="#">자가검진</a></li>
            </ul>
            <ul>
              <li><a href="#">공지사항</a></li>
              <li><a href="#">문의사항</a></li>
              <li><a href="#">건강상담소</a></li>
            </ul>
          </div>
        </nav>
        <div id="profli">
          <div class="main_profli">
            <img src="../image/profli.png" alt="프로필" />
            <button type="submit" class="btn">
              <i class="xi-plus" alt="검색"></i>
            </button>
            <p>김모모님</p>
          </div>
          <div id="profli_menu">
            <ul>
              <li><img src="../image/profli.png" alt="프로필" /></li>
              <li><p>김모모님</p></li>
              <li><hr width="250px" /></li>
              <li><a href="#">마이페이지</a></li>
              <li><a href="#">내가 쓴 글</a></li>
              <li><a href="#">개인정보 설정</a></li>
              <li><hr width="250px" /></li>
              <li>
                <button><a href="#">로그아웃</a></button>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </header>
    <main>
      <div class="background">
        <div class="layer"></div>
      </div>
      <div class="mask_box">
        <h2>
          Health..
          <div class="mask">
            <span data-show>건강을 챙기자</span>
            <span>띠용</span>
            <span>하하..</span>
            <span>저리가세요</span>
          </div>
        </h2>
      </div>
      <div class="search-box">
        <input
          class="search-txt"
          type="text"
          placeholder="검색어를 입력해 주세요"
          autofocus
        />
        <button class="search-btn" type="submit">
          <i class="xi-search"></i>
        </button>
      </div>

      <div class="main_hover_menu">
        <div>
          <ul class="main_hover_menu_left">
            <li><a href="#">예방접종 예약</a></li>
            <li><a href="#">건강검진 예약</a></li>
          </ul>
        </div>
        <div class="gref">
          <div class="graph_wrap">
            <strong class="tit">국민건강현황</strong>
            <p>날짜</p>
            <div class="graph">
              <!-- 기준 -->
              <ul class="y-axis">
                <li><span></span></li>
                <li><span></span></li>
                <li><span></span></li>
                <li><span></span></li>
                <li><span></span></li>
                <li><span></span></li>
                <li><span></span></li>
                <li><span></span></li>
              </ul>

              <!-- 목록 -->
              <ul class="x-axis">
                <li><span>독감</span></li>
                <li><span>식중독</span></li>
                <li><span>감기</span></li>
                <li><span>코로나</span></li>
              </ul>

              <!-- 바 그래프 (백분율 만큼 heigh값) -->
              <ul class="bar">
                <li>
                  <div style="height: 100%"><span></span></div>
                </li>
                <li style="height: 70%"><span></span></li>
                <li style="height: 30%"><span></span></li>
                <li style="height: 70%"><span></span></li>
              </ul>
            </div>
          </div>
        </div>
        <div>
          <ul class="main_hover_menu_right">
            <li><a href="#">자가진단</a></li>
            <li><a href="#">건강소식</a></li>
          </ul>
        </div>
      </div>
    </main>
</body>
</html>
