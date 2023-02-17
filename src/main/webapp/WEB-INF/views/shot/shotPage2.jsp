<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예방접종 병원조회</title>
	<!--파비콘-->
	<link rel="icon" type="image/png" sizes="16x16"
		href="${path }/resources/image/favicon/favicon-16x16.png" />
	<link rel="manifest"
		href="${path }/resources/image/favicon/manifest.json" />
	<meta name="msapplication-TileColor" content="#ffffff" />
	<meta name="msapplication-TileImage"
		content="${path }/resources/image/favicon/ms-icon-144x144.png" />
	<meta name="theme-color" content="#ffffff" />
<link href="${path}/resources/css/reset.css" rel="stylesheet"/>    
    <style>
      *{
      font-weight: bold;
      }
      main {
        width: 1320px;
		min-height:529px;
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
		
      #btn2{
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
      type="application/javascript"></script>
    <script
      type="application/javascript"
      src="${path}/resources/js/hangjungdong2.js"></script>
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
          
          function handleOnChange(e) {
        	  // 선택된 데이터의 텍스트값 가져오기
        	  const text = e.options[e.selectedIndex].text;
        	  
        	  console.log(e.options);
        	  
        	  // 선택한 텍스트 출력
        	  document.getElementById('result').innerText
        	    = text;
        	}
        });
      });

      function fn_option(code, name) {
        return '<option value="' + code + '">' + name + "</option>";
      }
      function fn_iframe(url) {
        jQuery("#iframe").attr("src", url);
      }
    </script>
    <script>
	    function goPage(obj){
	    	var abc = obj.querySelectorAll("td");
	  		var zip = abc[0].innerText;
	  		var addr = abc[2].innerText;
	  		var phone = abc[3].innerText;
				
			var form = document.createElement("form");
	        form.setAttribute("charset", "UTF-8");
	        form.setAttribute("method", "GET");  //Post 방식
	        form.setAttribute("action", "abc3.do"); //요청 보낼 주소

	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "zip");
	        hiddenField.setAttribute("value", zip);
	        form.appendChild(hiddenField);       	
	       
	        hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "addr");
	        hiddenField.setAttribute("value", addr);
	        form.appendChild(hiddenField);
	        
	        hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "phone");
	        hiddenField.setAttribute("value", phone);
	        form.appendChild(hiddenField);
	        
	        document.body.appendChild(form);

	        form.submit(); 
			
	      }
          function search(){
              var sido = $("#sido option:selected").text();
              var sigugun = $("#sigugun option:selected").text();
              if($("#sigugun option:selected").text()=='선택'){
            	  return sido;
              }else{
              		return sido+" "+sigugun;
              }; 
            }
          function getList() {
        	var sido = $("#sido option:selected").text();
      		var sigugun = $("#sigugun option:selected").text();
      		var result_list=[];
      		$.ajax({
    			url:"https://api.odcloud.kr/api/apnmOrg/v2/list?page=1&perPage=6500&cond%5BorgZipaddr%3A%3ALIKE%5D="+search()+"&serviceKey=WMYt954ER1qV9fi8xf2kgPxHFVXPiJl8GTJHSVT8LQr%2F4j6%2F6Lp2qSmjiBMa9KcCUWC6BbtkeLevU9HrSZP3KA%3D%3D",
    			method:"post",
    			data :{},
    			success:function(data){
    				console.log(Object.keys(data).length);
    				
    				var list = data.data;
    				var output = "";
    				list.forEach(function(item,index){						
    						//console.log('아이템은?'+item.orgZipaddr);
    						output += "<tr class='content' onclick='goPage(this)'>";
    			    	  	output += '<td>'+item['orgnm']+'</td>';
    			      		output += '<td>'+'09:00 ~ 18:00'+'</td>';
    			            output += '<td>'+item.orgZipaddr+'</td>';
    			            output += '<td>'+item.orgTlno+'</td>';            
    			            output += '</tr>';							
    				})
    				
    				$(".content").remove();		//데이터 지우기
    	      	    $("#info").append(output);  // 새로운 데이터 덮어쓰기 */			
    				
    			}
    			
    		})
    		
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
        
        <hr id="line">
        <div id="addr">            
          <div id="address_search">지역                            
                  <select id="sido"><option disabled selected>시/도</option></select>
                  <select id="sigugun"><option disabled selected>시/구/군</option></select>
                  <button id="btn2" onClick="getList()" value="ajax"><i class="xi-search xi-2x"></i></button>                 
          </div>
        </div>
        <hr id="line">
        </div>
        <div id='result'></div>
        <div id="hospital_list">
          <table id="info">
            <tr>
                <th>병원명</th>
                <th>진료시간</th>
                <th>주소</th>
                <th>연락처</th>
            </tr>
          </table>
          
          <table id="output">
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
