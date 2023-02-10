<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>시작하기</title>

	<!--파비콘sss-->
	<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favicon/android-icon-144x144.png"/>
	<link rel="manifest" href="${path}/resources/image/favicon/manifest.json" />
	<meta name="msapplication-TileColor" content="#ffffff" />
	<meta name="msapplication-TileImage" content="${path}/resources/image/favicon/ms-icon-144x144.png" />
	<meta name="theme-color" content="#ffffff" />
	
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
              oninput="handleOnInput(this)"
            />
            <input
              class="login animated fadeInUp animate3"
              name="mpwd"
              type="password"
              required
              placeholder="Password"
              value=""
              style="ime-mode:disabled"
              oninput="handleOnInput(this)"
            />
          </fieldset>
          <input
            type="submit"
            id="login-form-submit"
            class="login_form button animated fadeInUp animate4"
            value="Login"
          />
          <p>
          <a id="lost-password-link" class="animated fadeIn animate5"
              style="z-index:900;" onclick="movesearch();"
              >아이디 비밀번호 찾기
            </a>
          </p>
         
          </form>
          
          <form class="join" id="join" method="post" name='join' action="/controller/member/join.do">
         
          <fieldset id="signup-fieldset" class="hidden">
           <!-- style="ime-mode:disabled는 한영키를 무시하고 영어로만 입력됨  -->
           
           <div class="mgrade">
           
           <input type="radio" name="mgrade" value="D"
           style="width:30px;"
           >전문의
           <input type="radio" name="mgrade" value="G"
           style="width:30px;" checked="checked"
           >일반           
           
           </div>
            
          	
           
            <input
              class="login animated fadeInUp animate2"
              name="mid"
              id="mid"
              type="text"
              required
              placeholder="아이디"
              value=""
              onblur="blurId(this)"
            	oninput="handleOnInput(this)"
            	maxlength="20"
            /><button class="login animated fadeInUp animate2 join-button"  
            style="background:#ff7575; border:none; color:#fff; position: absolute; top:204px; left:295px; border-radius: 15px; padding:2px; width:70px;" 
            type="button" onclick="checkId();">중복체크</button>
            <span  style="display: none; color: #d92742; font-size:12px; margin:-8px;" class="id_ok" id="span_id_0">공백은 아이디로 쓸수 없습니다.</span>
            <span  style="display: none; color: green; font-size:12px; margin:-8px;" class="id_ok" id="span_id_1">사용 가능한 아이디입니다.</span>
			<span  style="display: none; color: #d92742; font-size:12px; margin:-8px;" class="id_already" id="span_id_2">누군가 이 아이디를 사용하고 있어요.</span>
			<span  style="display: none; color: #d92742; font-size:12px; margin:-8px; class="id_already" id="span_id_3">중복체크를 해주세요</span>
            <input
              class="login animated fadeInUp animate3"
              maxlength='10'
              minlength = "6"
              name="mpwd"
              id="password1"
              type="password"
              placeholder="영문 또는 숫자를 포함하여 최소 6자리이상"
              required
              value=""
              style="ime-mode:disabled"
              oninput="handleOnInput(this)"
            />
            <input
              class="login animated fadeInUp animate3"
               maxlength='10'
              minlength = "6"
              name="mpwdcheck"
              id="password2"
              type="password"
              placeholder="비밀번호 확인"
              required
              value=""
              oninput="handleOnInput(this)"
            />
            <span id="alert1" style="display: none; color: green; font-size:12px; margin:-8px;" >비밀번호가 일치합니다.</span>
            <span id="alert2" style="display: none; color: #d92742; font-size:12px; margin:-8px;" >비밀번호가 일치하지 않습니다.</span>
            
            <input
              class="login animated fadeInUp animate3"
              name="mname"
              id="mname"
              type="textbox"
              placeholder="이름"
              required
              value=""
              oninput="handleOnInput1(this)"
            />
            <input
              class="login animated fadeInUp animate3"
              name="mphone"
              id="mphone"
              type="textbox"
              placeholder="휴대전화번호 ex)01012341234"
              required
              value=""
              oninput="handleOnInput2(this)"
            />
            <br>
                        
            <input
              class="login animated fadeInUp animate3"
              name="maddrdetail"
              id="maddrdetail"
              type="textbox"
              placeholder="도로명주소"
              required
              value=""
              IsReadOnly="True"
              
              onblur="bluraddr(this)"
            /><button class="login animated fadeInUp animate2 join-button"
            style="background:#ff7575; border:none; color:#fff; position: absolute; top:454px; left:295px; border-radius: 15px; padding:2px; width:70px;" 
             onclick="goPopup()" type="button" onclick="checkaddr();">주소찾기</button>
            
            <input
              class="login animated fadeInUp animate3"
              name="mmaddzipnum"
              id="mmaddzipnum"
              type="textbox"
              placeholder="상세주소"
              required
              value=""
            /> <span id="alert3" style="display: none; color: #d92742; font-size:12px; margin:-8px;" >주소를 입력해주세요.</span>
            
            <input
              class="login animated fadeInUp animate3"
              name="memail"
              id="memail"
               type="email"
              placeholder="Email"
              required
              value=""
              maxlength="30"
              
            /> <span id="alert4" style="display: none; color: #d92742; font-size:12px; margin:-8px;" >이메일 형식으로 적어주세요.</span>
            
            
            
          </fieldset>
          <input
           type="submit"
            id="signup-form-submit"
            class="login_form button animated fadeInUp animate4 hidden"
            value="Sign up"
            onclick="loadFn()"
          />
          
          
         
          
          
          
          
          
          
		</form>
      </div>
    </div>
      <script type="text/javascript">
      function movesearch(){
    	     location.href = "<%=request.getContextPath() %>/member/membersearch.do";
    	}
      
    // 주소 팝업
	  function goPopup() {
	  	var pop = window.open("${path}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	  }

	  function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

	    document.getElementById("maddrdetail").value = roadAddrPart1;

	    document.getElementById("mmaddzipnum").value = addrDetail
	  }
	  
	  
	  //알파벳 숫자만
	  function handleOnInput(e)  {
		  e.value = e.value.replace(/[^A-Za-z0-9]/ig, '')
		}
	  
		//한글만
	  function handleOnInput1(e)  {
		  e.value = e.value.replace(/[^ㄱ-힣]/ig, '')
		}
	  
		//숫자만
	  function handleOnInput2(e)  {
		  e.value = e.value.replace(/[^0-9]/ig, '')
		}
	  
	  
		//이메일 형식
		var alert4 = document.getElementById('alert4'); //주소 입력좀
		
	  function email_check( email ) {    
		    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    return (email != '' && email != 'undefined' && regex.test(email)); 
		}

		$("input[type=email]").blur(function(){
		  var email = $(this).val();
		  if( email == '' || email == 'undefined') return;
		  if(! email_check(email) ) {
			  alert4.style.display = 'block';
		    $(this).focus();
		    return false;
		  }else {
			  alert4.style.display = 'none';
		  }
		});
		
	  
	  //아이디 중복확인 및 공백불가 처리
	   var span_id_0 = document.getElementById('span_id_0'); //공백안됨
	  var span_id_1 = document.getElementById('span_id_1'); //사용가능 아이디
	  var span_id_2 = document.getElementById('span_id_2'); //불가능 아이디
	  var span_id_3 = document.getElementById('span_id_3'); //중복체크
	  
	  var alert1 = document.getElementById('alert1'); //비밀번호 일치
	  var alert2 = document.getElementById('alert2'); //불일치
	  
	  var alert3 = document.getElementById('alert3'); //주소 입력좀
	  
	var checkIdFlag = false;
   var checkIdVal = "";
   function loadFn(){
      var join = document.join;
      var tel_rule = /^\d{2,3}\d{3,4}\d{4}$/;
      
      if (checkIdFlag != true)
      {
    	  span_id_3.style.display = 'block';
    	  
         join.mid.focus();
         return false;
      }
      
      if( join.mid.value != checkIdVal)
      {
    	  span_id_3.style.display = 'block';
         join.mid.focus();
         return false;      
      }
      span_id_3.style.display = 'none';
      
      if ($("#password1").val() == null || $("#password1").val() == "") {
	    return false;
	    }
      
      if ($("#password2").val() == null || $("#password2").val() == "") {
	    return false;
	    }
    	   
   	  if ($("#password1").val() != $("#password2").val()) {
   			alert2.style.display = 'block';
   			alert1.style.display = 'none';
   	  return false;
   	  }
   	  
   		alert1.style.display = 'block';
   		alert2.style.display = 'none';
   		
   		if (!tel_rule.test($("#mphone").val())) {
			alert("전화번호 형식에 맞게 입력해주세요.");
			return false;
		}
	   	if( join.mname.val() == null || $("#mname").val() == "")
	    {

	       join.mname.focus();
	       return false;      
	    }
		if( join.mphone.val() == null || $("#mphone").val() == "")
	    {
	       join.mphone.focus();
	       return false;      
	    }
		
		
		if( join.maddrdetail.val() == null || $("#maddrdetail").val() == "")
	    {
			alert3.style.display = 'block';
			span_id_1.style.display = 'none';
       	 	span_id_2.style.display = 'none';
       		 span_id_0.style.display = 'none';
	       join.maddrdetail.focus();
	       return false;      
	    }
		
		if( join.mmaddzipnum.val() == null || $("#mmaddzipnum").val() == "")
	    {
			alert3.style.display = 'block';
			span_id_1.style.display = 'none';
       	 	span_id_2.style.display = 'none';
       		 span_id_0.style.display = 'none';
	       join.mmaddzipnum.focus();
	       return false;      
	    }
		alert3.style.display = 'none';
		
		
		if( join.memail.val() == null || $("#memail").val() == "")
	    {
			alert4.style.display = 'block';
	       join.memail.focus();
	       return false;      
	    }
	      
      join.action = "<%=request.getContextPath()%>/member/join.do";
      join.method = "post"; //감춰져서 넘기는 방식 Post   
      join.submit();
      }

   
	 

	  
	  
	  //아이디중복 확인
	  var checkIdFlag = false;
	  var checkIdVal = "";
	  var span_id_0 = document.getElementById('span_id_0');
	  var span_id_1 = document.getElementById('span_id_1');
	  var span_id_2 = document.getElementById('span_id_2');
	  
	  var alert1 = document.getElementById('alert1');
	  var alert2 = document.getElementById('alert2');
	  

	  function checkId()
	  {
	     var idval = $("#mid").val();
	     if (idval == "")
	     {
	    	span_id_0.style.display = 'block';
       	  	span_id_1.style.display = 'none';
       	 	span_id_2.style.display = 'none';
       		 span_id_3.style.display = 'none';
	        return false;
	     } else if (idval != "")
	     {
	        $.ajax({
	           url : "checkId.do",
	           type : "post",
	           data : "mid=" + idval,
	           success : function(data)
	           {
	              if (data == 1)
	              {
	            	  span_id_0.style.display = 'none';
	            	  span_id_1.style.display = 'none';
	            	  span_id_2.style.display = 'block';
	            	  span_id_3.style.display = 'none';
	                 checkIdFlag = false;
	                 checkIdVal = "";
	              } else
	              {
	            	  span_id_0.style.display = 'none';
	            	  span_id_1.style.display = 'block';
	            	  span_id_2.style.display = 'none';
	            	  span_id_3.style.display = 'none';
	                 checkIdFlag = true;
	                 checkIdVal = idval;
	                 console.log(checkIdVal);
	                 console.log(checkIdFlag);
	              }
	           }
	        });
	     }
	  }

	  function blurId(obj) {
	     var val = obj.value;
	     if (checkIdFlag && val != checkIdVal)
	     {
	        checkIdFlag = false;
	     }else if ($("#mid").val() == "")
	     { // name이 id인 값을 불러와 공백이라면
	        checkIdFlag = false;
	        console.log(checkIdFlag);
	        console.log(val);
	     } else
	     {
	        console.log(val);
	        console.log(checkIdFlag);
	     }
	     
	  }
	  
    </script>
  </body>
</html>
