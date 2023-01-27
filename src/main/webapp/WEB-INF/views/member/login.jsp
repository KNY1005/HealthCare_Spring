<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>시작하기</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Font online-->
    <link
      href="https://fonts.googleapis.com/css?family=Open+Sans"
      rel="stylesheet"
    />

    <!-- Animate.css-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"
    />
    <link href="${path}/resources/css/login.css" rel="stylesheet"/>

    <!-- Google JQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="${path}/resources/js/login.js"></script>
    <!-- 제이쿼리 라이브러리 연결 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body>
    <div>
      <div class="panel shadow1">   
        <form class="login" id="login"method="post" name='login' action="/controller/member/login.do">
          <div class="panel-switch animated fadeIn">
            <button type="button" id="sign_up" class="active-button">
              Sign Up
            </button>
            <button type="button" id="log_in" class="" disabled>Log in</button>
          </div>
          <h1 class="animated fadeInUp animate1" id="title-login">
            Welcome Back !
          </h1>
          <h1 class="animated fadeInUp animate1 hidden" id="title-signup">
            Welcome !
          </h1>
          <fieldset id="login-fieldset">
            <input
              class="login animated fadeInUp animate2"
              name="mid"
              type="text"
              required
              placeholder="UserId"
              value=""
              style="ime-mode:disabled"
            />
            <input
              class="login animated fadeInUp animate3"
              name="mpwd"
              type="password"
              required
              placeholder="Password"
              value=""
              style="ime-mode:disabled"
            />
            <label>
                    <form:checkbox path="rememberId"/>아이디 기억
            </label>
          </fieldset>
          <input
            type="submit"
            id="login-form-submit"
            class="login_form button animated fadeInUp animate4"
            value="Login"
            onclick="alert('로그인이 완료되었습니다');"
          />
          <p>
            <a id="lost-password-link" href="" class="animated fadeIn animate5"
              >아이디 비밀번호 찾기
            </a>
          </p>
          </form>
          <form class="join" id="join" method="post" name='join' action="/controller/member/join.do">
          <fieldset id="signup-fieldset" class="hidden">
          
           <!-- style="ime-mode:disabled는 한영키를 무시하고 영어로만 입력됨  -->
            <input
              class="login animated fadeInUp animate2"
              name="mid"
              type="text"
              required
              placeholder="아이디"
              value=""
              style="ime-mode:disabled"
              onblur="blurId(this)"
            /><button class="login animated fadeInUp animate2" id="button_join" type="button" onclick="checkId()">중복체크</button>
            <span  style="display: none; color: green;" class="id_ok">사용 가능한 아이디입니다.</span><br>
			<span style="display: none; color: #d92742; class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
            <input
              class="login animated fadeInUp animate3"
              name="mpwd"
              type="password"
              placeholder="최소 하나의 영문 또는 숫자를 포함하여 6자리"
              required
              value=""
              style="ime-mode:disabled"
            />
            <span id="alert-success" style="display: none; color: green;">비밀번호가 일치합니다.</span>
            <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
            <span id="alert-null" style="display: none; color: black;">비밀번호 확인 칸 을 입력하세요.</span>
            <span id="alert-null2" style="display: none; color: black;">비밀번호 칸 을 입력하세요.</span>
            <input
              class="login animated fadeInUp animate3"
              name="mpwdcheck"
              type="password"
              placeholder="비밀번호 확인"
              required
              value=""
            />
            <input
              class="login animated fadeInUp animate3"
              name="mname"
              type="textbox"
              placeholder="이름"
              required
              value=""
            />
            <input
              class="login animated fadeInUp animate3"
              name="mnumber"
              type="textbox"
              placeholder="주민등록번호"
              required
              value=""
            />
            <input
              class="login animated fadeInUp animate3"
              name="mphone"
              type="textbox"
              placeholder="휴대전화번호"
              required
              value=""
            />
            
            
            <input
              class="login animated fadeInUp animate3"
              name="maddrdetail"
              id="addrBasic"
              type="textbox"
              placeholder="도로명주소"
              required
              value=""
              IsReadOnly="True"
            /><button class="login animated fadeInUp animate2 " id="button_join" onclick="goPopup()" type="button">주소찾기</button>
            
            <input
              class="login animated fadeInUp animate3"
              name="mmaddzipnum"
              id="addrDetail"
              type="textbox"
              placeholder="상세주소"
              required
              value=""
            />
            
            <input
              class="login animated fadeInUp animate3"
              name="memail"
              type="textbox"
              placeholder="Email"
              required
              value=""
              
            />&#64;<input type="text" name="emaddress" value="" ReadOnly="true" />
                        <select id="emailselect" onchange="SetEmailTail(emailselect.options[this.selectedIndex].value)" >
                            <option value="notSelected">::선택하세요::</option>
                            <option value="etc" id="etc">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="nate.com">nate.com</option>
                            <option value="google.com">google.com</option>
                            <!--이메일 확인 스크립트-->
                            <script type="text/javascript" th:inline="javascript">
                        function SetEmailTail(emailValue) {
                            var email = document.all("email")    // 사용자 입력
                            var emailTail = document.all("emaddress") // Select box
                           var esw = $("#etc1");
                               if ( emailValue == "notSelected" ){
                              emailTail.readOnly = true;
                              emailTail.value = '';
                              alert("이메일을 선택or입력하세요  ");
                           }
                            else if ( emailValue == "etc" ) {
                               emailTail.readOnly = false;
                               emailTail.value = "";
                              emailTail.focus();
                           }
                           else {
                               emailTail.readOnly = true;
                               emailTail.value = emailValue;
                           }
                        }
                            </script>
            
            
          </fieldset>
          <input
            type="submit"
            id="signup-form-submit"
            class="login_form button animated fadeInUp animate4 hidden"
            value="Sign up"
            onclick="alert('회원가입이 완료되었습니다');"
          />
		</form>
      </div>
    </div>
  </body>
</html>
