<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>관리자페이지</title>
    <meta charset="utf-8" />
    <!--파비콘sss-->
<link rel="icon" type="image/png" sizes="16x16" href="${path}/resources/image/favicon/android-icon-144x144.png"/>
<link rel="manifest" href="${path}/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage" content="${path}/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />

<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />

    <!-- 제이쿼리 라이브러리 연결 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
  <!-- CSS only -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <!-- JavaScript Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </head>
  <style>
    .side_menu {
      width: 300px;
      height: 800px;
      border: 1px solid #b8b8b8;
      border-radius: 10px;
      margin-top: 100px;
    }
  </style>
  <body> 
     <section>
      <div class="side_menu">
        <div class="list-group">
          <a
            href="naver.com"
            class="list-group-item list-group-item-action active"
            aria-current="true"
          >
            관리자
          </a>
          <script>
          //
          //	function openFrame(){
          //		document.getElmentById("ifr2").src = "/controller/admin/memberlist_center.do";         		
          //	}
          
          $(document).ready(function(e) {
			/* a요소를 클릭 했을 시 */
			    $('a').click(function(){
			/* iframe 요소의 src 속성값을 a 요소의 data-url 속성값으로 변경 */ 
			        $('#ifr2').attr('src',$(this).attr('data-url'));
			        })
			});
          </script>
          <a
          	id="memberManage"
          	data-url="/controller/admin/memberlist_center.do"
            class="list-group-item list-group-item-action"
            target="iframe"
            >회원관리</a>
          <a
            data-url="http://naver.com"
            class="list-group-item list-group-item-action"
            target="iframe"
            >게시물관리</a
          >
          <a 
          href="<%=request.getContextPath() %>/"
          class="list-group-item list-group-item-action" href=""
            >메인메뉴바로가기</a
          >
        </div>
      </div>
    </section>
    <section>
      <div
        style="
          position: absolute;
          top: 100px;
          left: 56%;
          transform: translate(-50%, 0%);
        "
      >
      	<div id="ifr">
	         <iframe
	        id = "ifr2"
	          width="1500px"
	          height="800px"
	          
	          frameborder="0" 
	                
	        ></iframe>
        </div>
      </div>
    </section>
    <div style=""></div>
    <%@include file="../includes/footer.jsp"%>
  </body>
</html>
