<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<title>네비바</title>

    <!--파비콘-->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favicon/android-icon-144x144.png"/>
    <link rel="manifest" href="${path}/resources/image/favicon/manifest.json" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="msapplication-TileImage" content="${path}/resources/image/favicon/ms-icon-144x144.png" />
    <meta name="theme-color" content="#ffffff" />
    
    <!-- 제이쿼리 라이브러리 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- 리셋, 헤더 css -->
	<link href="${path}/resources/css/reset.css" rel="stylesheet" />
	<link href="${path}/resources/css/header.css" rel="stylesheet" />
	
	<!-- 헤더 js -->
	<script src="${path}/resources/js/header.js"></script>
	
	<!--xe아이콘-->
	<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />


</head>
<body>
	<header>
		<div class="nav_background">
			<nav class="nav">
				<div class="nav_main_menu">
					<ul class="nav_main_menu_1">
						<li><a href="<%=request.getContextPath() %>/"><img
								src="${path}/resources/image/logo2.png" alt="로고이미지" /></a>
						</li>
					</ul>
					<ul>
						<li><a href="<%=request.getContextPath() %>/shot/abc1.do">예방접종</a></li>
					</ul>
					<ul>
						<li><a href="<%=request.getContextPath() %>/medical_check/medicalmain.do">건강검진</a></li>
					</ul>
					<ul>
						<li><a href="<%=request.getContextPath() %>/blood/main.do">헌혈</a></li>
					</ul>
					<ul>
						<li><a href="<%=request.getContextPath()%>/notice/healthnews1.do">모두건강</a></li>
					</ul>
					<ul>
						<li><a href="<%=request.getContextPath() %>/notice1.do">건강광장</a></li>
					</ul>
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
		              <li><a href="<%=request.getContextPath() %>/notice/list.do">공지사항</a></li>
		              <li><a href="<%=request.getContextPath() %>/question/questionList.do">문의사항</a></li>
		              <li><a href="<%=request.getContextPath() %>/medicalTalk/medicalList.do">건강상담소</a></li>
		            </ul>
					</ul>
				</div>
			</nav>

			 <div id="profli">
        <c:if test="${member!= null }">
          <div class="main_profli">
           <img src="${path}/resources/image/profli.png" alt="프로필" />
            <button type="submit" class="profli_btn">
              <i class="xi-plus" alt="검색"></i>
            </button>
            <p>${member.mname}님 환영합니다!</p>
          </div>
          <div id="profli_menu">
		      	<a href="<%=request.getContextPath() %>/admin/god.do">회원 관리</a>
            <ul>
              <li><img src="${path}/resources/image/profli.png" alt="프로필" /></li>
              <li><p>${member.mname}님</p></li>
              <li><hr width="250px" /></li>
              <li><a href="<%=request.getContextPath() %>/mypage2.do">마이페이지</a></li>
              <li><a href="<%=request.getContextPath() %>/mypage4.do">내가 쓴 글</a></li>
              <li><a href="<%=request.getContextPath() %>/mypage5.do">개인정보 설정</a></li>
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
</body>
</html>
