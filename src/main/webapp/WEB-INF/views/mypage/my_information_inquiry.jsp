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
<script type="text/javascript">
var path = "${pageContext.request.contextPath }";

function fnSubmit() {
	 
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var tel_rule = /^\d{2,3}\d{3,4}\d{4}$/;
	 
	if ($("#mname").val() == null || $("#mname").val() == "") {
	alert("이름을 입력해주세요.");
	$("#mname").focus();
	 
	return false;
	}
	 
	if ($("#mid").val() == null || $("#mid").val() == "") {
	alert("아이디를 입력해주세요.");
	$("#mid").focus();
	 
	return false;
	}
	 
	if ($("#mphone").val() == null || $("#mphone").val() == "") {
	alert("전화번호를 입력해주세요.");
	$("#mphone").focus();
	 
	return false;
	}
	 
	if(!tel_rule.test($("#mphone").val())){
	alert("전화번호 형식에 맞게 입력해주세요.");
	return false;
	}
	 
	if ($("#memail").val() == null || $("#memail").val() == "") {
	alert("이메일을 입력해주세요.");
	$("#memail").focus();
	 
	return false;
	}
	 
	if(!email_rule.test($("#memail").val())){
	alert("이메일을 형식에 맞게 입력해주세요.");
	return false;
	}
	 
	if ($("#mpwd").val() != "" && $("#mpwd2").val() == "") {
	alert("비밀번호 확인을 입력해주세요.");
	$("#mpwd").focus();
	 
	return false;
	}
	 
	if ($("#mpwd").val() == "" && $("#mpwd2").val() != "") {
	alert("비밀번호를 입력해주세요.");
	$("#mpwd2").focus();
	 
	return false;
	}
	 
	if ($("#mpwd").val() != $("#mpwd2").val()) {
	alert("비밀번호가 일치하지 않습니다.");
	$("#mpwd2").focus();
	 
	return false;
	}
	 
	if (confirm("수정하시겠습니까??")) {
	 
	$("#createForm").submit();
	 
	return false;
	}
	}
	
	
	
</script>
<style>


</style>
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
        		<form action="/controller/mypage5.do" method="post"  >
      <div class="form-group row">
              아이디 : <input type="text" class="form-control form-control-user" id="mid" name="mid" style="text-align:center;" value="${member.mid }"
                  placeholder="아이디" readonly="readonly">
      </div>
      <div class="form-group row">  
              이름 : <input type="text" class="form-control form-control-user" id="mname" name="mname" style="text-align:center;" value="${member.mname }"
                  placeholder="이름">
      </div>
      <div class="form-group row">
              전화번호 : <input type="text" class="form-control form-control-user" id="mphone" name="mphone" style="text-align:center;" value="${member.mphone }"
                  placeholder="전화번호">
      </div>
      <div class="form-group row">
              이메일 주소 : <input type="text" class="form-control form-control-user" id="memail" name="memail" style="text-align:center;" value="${member.memail }"
                  placeholder="이메일 주소">
      </div>
      <div class="form-group row">
              비밀번호 : <input type="password" class="form-control form-control-user" id="mpwd" name="mpwd" style="text-align:center;"
                  placeholder="비밀번호">
      </div>
      <div class="form-group row">
              비밀번호 확인 : <input type="password" class="form-control form-control-user" id="mpwd2" style="text-align:center;"
                  placeholder="비밀번호 확인">
      </div>
      
      <input type="submit" id="createForm" class="btn btn-primary btn-user btn-block" onclick="fnSubmit();"/>
      
      <a href="<%=request.getContextPath() %>/" class="btn btn-warning btn-user btn-block">
           메인화면으로
      </a>
  </form>
	</section>
      </main>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>