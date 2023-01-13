<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예방접종 병원조회</title>
<link href="${path}/resources/css/reset.css" rel="stylesheet"/>    
    <style>
      *{
      font-weight: bold;
      }
      main {
        
        width: 1320px;
        height: 1000px;
        margin: 100px auto;
      }  
     .order_box{
        width: 942px;
        height: 110px;
        display: flex;
 		align-items: flex-end;
        justify-content: center;
      }    
    .order{
        width: 600px;
        display: flex;
        flex-direction: row;
        justify-content: space-evenly;
    }
      #hospital_search h2 {
        font-size: 40px;
        margin-bottom: 40px;
      }

      #age {
        width: 1320px;
        margin-bottom: 40px;
      }
      #age ul {
        display: flex;
        flex-direction: row;
        justify-content: space-evenly;
      }
      #age li {
        box-sizing: border-box;
        width: 250px;
        height: 250px;
        border: 3px solid rgb(160, 155, 155);
        border-radius: 10px;
        text-align: center;
      }
      

      #age img {
        height: 180px;
        width: 180px;
        text-align: center;
      }

      #age li:hover {
        border: 3px solid #ff9797;
        color: #ff9797;
      }

      .bold{
        font-size: 20px;
        margin-bottom: 12px;
      }
      #line{
        height: 2px; 
        background-color: #FF7373; 
        border: none; 
        margin-top: 25px;
      }
      #addr{
        display: flex;
        justify-content: center;
        font-size:30px;
        margin:25px 0;
      }
      #address_search{
        width: 700px;
        display: flex;
        justify-content: space-evenly;
      } 
      #address_search select{
        width: 150px;
        font-size: 20px;
        border-radius: 10px;
        text-align: center;
      }
      main #addr #address_search select {
			-webkit-appearance: none;
			/* 네이티브 외형 감추기 */
			-moz-appearance: none;
			appearance: none;
		}

		main #addr #address_search select {
			width: 180px;
			height: 45px;
			margin-left: 20px;
			background-size: 20px;
			padding: 5px 30px 5px 10px;
			border-radius: 4px;
			outline: 0 none;
			font-size: 20px;
			background: url("${path }/resources/image/bottom_arrow.png") no-repeat 95% 50%;
			/* 화살표 모양의 이미지 */
			text-align: center;
		}

		main #addr #address_search select:hover {
			border: 3px solid #ff8f8f;
		}
		main #addr #address_search option {
			background: #ff8f8f;
			color: #fff;
			padding: 3px 0;
		}
		
      .btn2{
        background-color:#FFAEAE;
        border: #FFAEAE;
        border-radius: 10px; 
        color:#fff;
      }  
      button:hover{
        border-radius: 10px;
        box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
        cursor:pointer;
      }
      #hospital_list table{ /*tr간 간격*/
      	border-collapse: separate; 
      	border-spacing: 0 20px;
      	width: 1320px;
      }   
      #hospital_list tr:nth-child(1){
      	background:#fff;
      }
      #hospital_list tr{
      	
      	line-height: 73px;
      	font-size: 25px;
      	border-spacing: 0 20px;
      }
      
        
        td:first-child,th:first-child {border-radius: 10px 0 0 10px;}   /*td테두리 첫번쨰와 마지막만 둥글게 하기위해서*/
        td:last-child,th:last-child {border-radius: 0 10px 10px 0;}       
        th,td{width:350px; text-align:center; vertical-align:middle; height:73px;}
        .content{
        	background:#ffe7e7;
        }            
       .content:hover {
	background:#fff;
	box-shadow: 0 0 0 3px #ff8f8f inset;
	border-radius: 10px;
	transition: .2s;
	cursor: pointer;
}
    </style>
    <script
      src="https://code.jquery.com/jquery-latest.min.js"
      type="application/javascript"
    ></script>
    <script
      type="application/javascript"
      src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"
    ></script>
    <script type="application/javascript">
      jQuery(document).ready(function () {
        jQuery("#table1").css("color", "red");
        jQuery("#table_header").css("font-size", "30pt");
        jQuery("#table2 td:first-child").css("color", "blue");

        //sido option 추가
        jQuery.each(hangjungdong.sido, function (idx, code) {
          //append를 이용하여 option 하위에 붙여넣음
          jQuery("#sido").append(fn_option(code.sido, code.codeNm));
        });

        //sido 변경시 시군구 option 추가
        jQuery("#sido").change(function () {
          jQuery("#sigugun").show();
          jQuery("#sigugun").empty();
          jQuery("#sigugun").append(fn_option("", "선택")); //
          jQuery.each(hangjungdong.sigugun, function (idx, code) {
            if (jQuery("#sido > option:selected").val() == code.sido)
              jQuery("#sigugun").append(fn_option(code.sigugun, code.codeNm));
          });

          //세종특별자치시 예외처리
          //옵션값을 읽어 비교
          if (jQuery("#sido option:selected").val() == "36") {
            jQuery("#sigugun").hide();
            //index를 이용해서 selected 속성(attr)추가
            //기본 선택 옵션이 최상위로 index 0을 가짐
            jQuery("#sigugun option:eq(1)").attr("selected", "selected");
            //trigger를 이용해 change 실행
            jQuery("#sigugun").trigger("change");
          }
        });

        //시군구 변경시 행정동 옵션추가
        jQuery("#sigugun").change(function () {
          //option 제거
          jQuery("#dong").empty();
          jQuery.each(hangjungdong.dong, function (idx, code) {
            if (
              jQuery("#sido > option:selected").val() == code.sido &&
              jQuery("#sigugun > option:selected").val() == code.sigugun
            )
              jQuery("#dong").append(fn_option(code.dong, code.codeNm));
          });
          //option의 맨앞에 추가
          jQuery("#dong").prepend(fn_option("", "선택"));
          //option중 선택을 기본으로 선택
          jQuery('#dong option:eq("")').attr("selected", "selected");
        });

        jQuery("#dong").change(function () {
          var sido = jQuery("#sido option:selected").val();
          var sigugun = jQuery("#sigugun option:selected").val();
          var dong = jQuery("#dong option:selected").val();
          var dongCode = sido + sigugun + dong + "00";
        });
      });

      function fn_option(code, name) {
        return '<option value="' + code + '">' + name + "</option>";
      }
      function fn_iframe(url) {
        jQuery("#iframe").attr("src", url);
      }
    </script>
  </head>
  <body>
    <%@include file="../includes/header.jsp"  %>
    <div class="order_box">
        <ul class="order">
            <li>예방접종 유의사항</li>
            <li><i class="xi-angle-right"></i></i></li>
            <li style="color: #CE8080;">예방접종 병원조회</li>
            <li><i class="xi-angle-right"></i></i></li>
            <li>예방접종 예약하기</li>
            <li><i class="xi-angle-right"></i></i></li>
            <li>예방접종 예약완료</li>
        </ul>
    </div>
    <main>
      <div id="hospital_search">
        <h2>예방접종 병원조회</h2>
        <div id="age">
          <ul>
            <li>
              <img
                class="age_choice"
                src="${path }/resources/image/baby.png"
                alt="영유아"
              />
              <p class="bold">영유아</p>
              <p>생후 6개월 ~ 만 13세 이하</p>
            </li>
            <li>
              <img
                class="age_choice"
                src="${path }/resources/image/adult.png"
                alt="청·장년"
              />
              <p class="bold">청·장년</p>
              <p>만 14세 이상 ~ 만 64세 이하</p>
            </li>
            <li>
              <img
                class="age_choice"
                src="${path }/resources/image/old.png"
                alt="노년층"
              />
              <p class="bold">노년층</p>
              <p>만 65세 이상</p>
            </li>
          </ul>
        </div>
        <hr id="line">
        <div id="addr">            
          <div id="address_search">지역                            
                  <select id="sido"><option disabled selected>시/도</option></select>
                  <select id="sigugun"><option disabled selected>시/구/군</option></select>
                  <select id="dong"><option disabled selected>읍/면/동</option></select> 
                  <button class="btn2"><i class="xi-search xi-2x"></i></button>                 
          </div>
        </div>
        <hr id="line">
        </div>
        <div id="hospital_list">
          <table>
            <tr>
                <th>병원명</th>
                <th>진료시간</th>
                <th>주소</th>
                <th>연락처</th>
            </tr>
            <tr class="content"
            onClick="location.href='abc3.do'">
                <td>땡땡 병원</td>
                <td>00:00 ~ 00:00</td>
                <td>전라북도 전주시 땡땡</td>
                <td>010-0000-1234</td>
            </tr>
            <tr class="content"
            onClick="location.href='abc3.do'">
                <td>땡땡 병원</td>
                <td>00:00 ~ 00:00</td>
                <td>전라북도 전주시 땡땡</td>
                <td>010-0000-1234</td>
            </tr>
          </table>
          <table id="page_num">
            <tr>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </table>
        </div>
      </div>
    </main>
    <%@include file="../includes/footer.jsp"  %>
  </body>
</html>
