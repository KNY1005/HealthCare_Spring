<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>아이디 비번찾기</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <script src="${path}/resources/js/login.js"></script>
    
    <!-- 제이쿼리 라이브러리 연결 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<!-- Custom fonts for this template-->
	<link href=" ${path}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	
	<!-- Custom styles for this template-->
	<link href="${path}/resources/css/sb-admin-2.min.css" rel="stylesheet">
 
  </head>
  <script>
var path = "${pageContext.request.contextPath }";
 
$(document).ready(function() {
var msg = "${msg}";
if(msg != ""){
alert(msg);    
}
});
 
 
function fnSubmit() {
 
var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var tel_rule = /^\d{2,3}\d{3,4}\d{4}$/;
 
if ($("#mname").val() == null || $("#mname").val() == "") {
alert("이름을 입력해주세요.");
$("#mname").focus();
 
return false;
}
 
if ($("#mphone").val() == null || $("#mphone").val() == "") {
alert("전화번호를 입력해주세요.");
$("#mphone").focus();
 
return false;
}
 
if(!tel_rule.test($("#mphone").val())){-
alert("전화번호 형식에 맞게 입력해주세요.");
return false;
}
 
 
if (confirm("아이디를 찾으시겠습니까?")) {
 
$("#createForm").submit();
 
return false;
}
}
 
</script>


 
<form commandName="searchVo" id="createForm" action="<%=request.getContextPath() %>/member/search_result_id.do" method="post">
 
<body class="bg-gradient-primary">
<div class="container">
	<!-- Outer Row -->
	<div class="row justify-content-center">
		 
		<div class="col-xl-10 col-lg-12 col-md-9">
			 
			<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">
			<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
			<div class="col-lg-6">
			<div class="p-5">
			  <div class="text-center">
			      <h1 class="h4 text-gray-900 mb-2">아이디를 찾으시겠습니까?</h1>
			      <p class="mb-4">아래에 이름과 전화번호만 입력하시면 아이디 재설정 링크를 보내드리겠습니다!
			</p>
			  </div>
			      <div class="form-group">
			          <input type="text" class="form-control form-control-user"
			              id="mname" name="mname"
			              placeholder="이름을 입력하세요...">
			      </div>
			      <div class="form-group">
			          <input type="email" class="form-control form-control-user"
			              id="mphone" name="mphone"
			              placeholder="전화번호를 입력하세요...">
			      </div>
			      <a href="javascript:void(0)" onclick="fnSubmit(); return false;" class="btn btn-primary btn-user btn-block">
			          아이디 찾기
			      </a>
			  <hr>
			     <div class="text-center">
			      <a class="small" href="/member/join">계정 만들기!</a>
			  </div>
			  <div class="text-center">
			      <a class="small" href="/account/login">이미 계정이 있습니까? 로그인!</a>
			  </div>
			</div>
			</div>
			</div>
			</div>
			</div>
		 
		</div>
	 
	</div>
	 
</div>
 
</body>
 
 
</form>
</html>
</html>
