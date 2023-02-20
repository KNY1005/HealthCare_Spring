<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%@ page import="edu.study.vo.MemberVo" %>
<html>
<head>
<!--파비콘sss-->
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favicon/android-icon-144x144.png"/>
<link rel="manifest" href="${path}/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage" content="${path}/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />

<!-- 제이쿼리 라이브러리 연결 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 리셋, 홈 css 연결 -->
<link href="${path}/resources/css/reset.css" rel="stylesheet" />
<link href="${path}/resources/css/home.css" rel="stylesheet" />

<!-- 홈 js 연결 -->
<script src="${path}/resources/js/home.js"></script>

<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<title>메인화면</title>
<style>
.background {
  background-image: url("${path}/resources/image/main_view.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
  height: 100vh;
}
</style>
</head>
<script type="text/javascript">
$(document).ready(function(){
	$("#logoutBtn").on("click", function(){
		location.href="member/logout";
	})
	
})
</script>
<body>

<!-- 헤더(inclue랑 css 다름) -->
	<header>
      <div class="nav_background">
        <nav class="nav">
          <div class="nav_main_menu">
            <ul class="nav_main_menu_1">
              <li>
                <a href="<%=request.getContextPath() %>/">
                <img src="${path}/resources/image/logo2.png" alt="로고이미지"/>
                </a>
              </li>
            </ul>
            <ul>
              <li><a href="<%=request.getContextPath() %>/shot/abc1.do">예방접종</a></li>
            </ul>
            <ul>
              <li><a href="<%=request.getContextPath() %>/medical_check//medicalmain.do">건강검진</a></li>
            </ul>
            <ul>
              <li><a href="<%=request.getContextPath() %>/blood/main.do">헌혈</a></li>
            </ul>
            <ul>
              <li><a href="<%=request.getContextPath()%>/healthnews1.do">모두건강</a></li>
            </ul>
            <ul>
              <li><a href="<%=request.getContextPath() %>/notice/list.do?blist=N">건강광장</a></li>
            </ul>
            <c:if test="${member.mgrade == 'A'}">
            <ul>
              <li><a href="<%=request.getContextPath() %>/admin/god.do">회원 관리</a></li>
            </ul>
            </c:if>
          </div>
          <div id="sliding_menu">
            <ul>
              <li><a href="<%=request.getContextPath() %>/shot/abc1.do">예방접종 예약</a></li>
            </ul>
            <ul>
              <li><a href="<%=request.getContextPath() %>/medical_check/medicalmain.do">건강검진 예약</a></li>
            </ul>
            <ul>
              <li><a href="<%=request.getContextPath() %>/blood/main.do">헌혈 예약</a></li>
            </ul>
            <ul>
              <li><a href="<%=request.getContextPath() %>/healthnews1.do">건강소식</a></li>
              <li><a href="<%=request.getContextPath() %>/healthnews2.do">자가검진</a></li>
            </ul>
            <ul>
              <li><a href="<%=request.getContextPath() %>/notice/list.do?blist=N">공지사항</a></li>
              <li><a href="<%=request.getContextPath() %>/question/questionList.do?blist=Q">문의사항</a></li>
              <li><a href="<%=request.getContextPath() %>/medicalTalk/medicalList.do?blist=H">건강상담소</a></li>
            </ul>
          </div>
        </nav>
        
        <div id="profli">
        <c:if test="${member!= null }">
          <div class="main_profli">
           <img src="${path}/resources/image/profli.png" alt="프로필" />
            <button type="submit" class="btn">
              <i class="xi-plus" alt="검색"></i>
            </button>
            <p>${member.mname}님 환영합니다!</p>
          </div>
          <div id="profli_menu">
		      	
            <ul>
              <li><img src="${path}/resources/image/profli.png" alt="프로필" /></li>
              <li><p>${member.mname}님</p></li>
              <li><hr width="250px" /></li>
              <li><a href="<%=request.getContextPath() %>/member/mypage2.do?midx=${member.midx}">마이페이지</a></li>
              <li><a href="<%=request.getContextPath() %>/member/mypage4.do?midx=${member.midx}">내가 쓴 글</a></li>
              <li><a href="<%=request.getContextPath() %>/member/mypage5.do?midx=${member.midx}">개인정보 설정</a></li>
              <li><hr width="250px" /></li>
              <li>
                <button id="logoutBtn"><a href="<%=request.getContextPath() %>/member/logout.do">로그아웃</a></button>
              </li>
            </ul>
          </div>
          </c:if>
          <c:if test="${member == null}">
      	<div class="login" >
      		<button><a href="<%=request.getContextPath() %>/member/login.do">시작하기</a></button>
      	</div>
      	</c:if>
        </div>
      </div>
    </header>
	<!-- 헤더(inclue랑 css 다름) -->
	<!-- 메인 -->
    <main>
      <div class="background">
        <div class="layer"></div>
      </div>
    
      	
    <div class="content_box">
        <div class="center-outer">
          <div class="center-inner">
            <div class="bubbles">
              <h1>HealthCare</h1>
            </div>
          </div>
        </div>
      </div>
    

  <div class="main_hover_menu">
        <ul class="main_hover_menu_1">
          <li class="snip1489 ion-ios-star-outline">
            <a href="<%=request.getContextPath() %>/shot/abc1.do">
              <p>예방접종 예약</p>
              <img src="${path}/resources/image/shot.png" alt="주사기이미지" />
            </a>
          </li>
          <li class="snip1489 ion-ios-star-outline">
            <a href="<%=request.getContextPath() %>/medical_check//medicalmain.do">
              <p>건강검진 예약</p>
              <img src="${path}/resources/image/medical.png" alt="하트이미지" />
            </a>
          </li>
          <li class="snip1489 ion-ios-star-outline">
            <a href="<%=request.getContextPath() %>/healthnews2.do">
              <p>자가검진</p>
              <img src="${path}/resources/image/self.png" alt="설문이미지" />
            </a>
          </li>
          <li class="snip1489 ion-ios-star-outline">
            <a href="<%=request.getContextPath() %>/healthnews1.do">
              <p>건강소식</p>
              <img src="${path}/resources/image/healthnews.png" alt="신문지이미지" />
            </a>
          </li>
        </ul>
      </div>
    </main>
<!-- 메인 -->
<!-- 메인은 푸터 없음 -->
</body>
</html>
