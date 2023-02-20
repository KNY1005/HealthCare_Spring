<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보설정</title>
<!--파비콘-->
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favicon/android-icon-144x144.png"/>
<link rel="manifest" href="${path}/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage" content="${path}/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<!-- 제이쿼리 라이브러리 연결 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link href="${path}/resources/css/reset.css" rel="stylesheet" />
<link href="${path}/resources/css/mypage/my_information_inquiry.css" rel="stylesheet" />

<script src="${path}/resources/js/mypage/mypage_sub_menu.js"></script>

</head>
<body>
<div class="header">
<%@include file="../includes/header.jsp"%>
</div>
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
                    <li><a href="<%=request.getContextPath() %>/member/mypage1.do?midx=${member.midx}">헌혈 스탬프 / 조회</li>
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
            <h2>개인정보설정</h2>
           <hr>
        </div>
        		<form action="/member/modify.do" method="post">
			<table>
				<tr>
					<td>* 아이디</td>
					<td>${member.mid }
					</td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" name="mpwd" id="mpwd" value=""></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="mname" id="mname" value="${member.mname }" readonly></td>
				</tr>

				<tr>
					<td>* 이메일</td>
					<td><input type="text" name="memail" id="memail" value="${member.memail }"></td>
				</tr>
				<tr>
					<td>* 전화번호</td>
					<td><input type="text" name="mphone" id="mphone" value="${member.mphone }"></td>
				</tr>
				<tr>
					<td>* 주소</td>
					<td><input type="text" name="post" value="${post}" ></td>
					<!-- 배열로 값을 받았다면 ${addreess[0]}으로 표기하여 출력할수 있다-->
				</tr>
				<tr>
					<td>* 상세주소</td>
					<td><input type="text" name="address" value="${address }"></td>
				</tr>
				<tr>
				<td colspan="2" align="center">
			<input type="submit" value="수정하기">
			<button type="button" onclick="removeMember();"> 탈퇴하기 </button>
			<!-- //type을 button으로 꼭 적어줘야! submit이 되지 않는다!! 꼭 기억하기!
				 -->
				</td>
				</tr>
			</table>
			
		</form>
	</section>
      </main>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>