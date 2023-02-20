<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>건강검진 병원조회</title>
	<!--파비콘-->
	<link rel="icon" type="image/png" sizes="16x16"
		href="${path }/resources/image/favicon/favicon-16x16.png" />
	<link rel="manifest"
		href="${path }/resources/image/favicon/manifest.json" />
	<meta name="msapplication-TileColor" content="#ffffff" />
	<meta name="msapplication-TileImage"
		content="${path }/resources/image/favicon/ms-icon-144x144.png" />
	<meta name="theme-color" content="#ffffff" />
	<!--Jquery-->
	<script src="https://code.jquery.com/jquery-latest.min.js"
		type="application/javascript"></script>
	<script type="application/javascript"
		src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<script type="application/javascript">	
        jQuery(document).ready(function(){
            jQuery('#table1').css('color', 'red');
            jQuery('#table_header').css('font-size', '30pt');
            jQuery('#table2 td:first-child').css('color', 'blue');

            //sido option 추가
            jQuery.each(hangjungdong.sido, function(idx, code){
                //append를 이용하여 option 하위에 붙여넣음
                jQuery('#sido').append(fn_option(code.sido, code.codeNm));
               
            });
                                

            //sido 변경시 시군구 option 추가
            jQuery('#sido').change(function(){
                jQuery('#sigugun').show();
                jQuery('#sigugun').empty();
                jQuery('#sigugun').append(fn_option('','선택')); //
                jQuery.each(hangjungdong.sigugun, function(idx, code){
                    if(jQuery('#sido > option:selected').val() == code.sido)
                        jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
                });

                //세종특별자치시 예외처리
                //옵션값을 읽어 비교
                if(jQuery('#sido option:selected').val() == '36'){
                    jQuery('#sigugun').hide();
                    //index를 이용해서 selected 속성(attr)추가
                    //기본 선택 옵션이 최상위로 index 0을 가짐
                    jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
                    //trigger를 이용해 change 실행
                    jQuery('#sigugun').trigger('change');
                }
            });

            
        });

        function fn_option(code, name){
            return '<option value="' + code +'">' + name +'</option>';
        }
        function fn_iframe(url){
            jQuery('#iframe').attr('src', url);
        }

</script>


<script>
	function siDoCd(){
		var sido = $("#sido option:selected").val();
		return sido;
	}
	function siGunGuCd(){
		var sigugun = $("#sigugun option:selected").val();
		return sigugun;
	}
	function getInfo(){
	var str_HTML = "";
	var result_list=[];		
	var output = "";	
	$.ajax({
		type : "GET",
		dataType : "XML",
		data : {},
		url : "http://openapi1.nhis.or.kr/openapi/service/rest/HmcSearchService/getRegnHmcList?"+
			"numOfRows=5000&"+			
			"siDoCd="+siDoCd()+"&"+
			"siGunGuCd="+siGunGuCd()+"&"+ 	
			"serviceKey=SXsBCxP5w%2BvYN0eL9xWlIZU5Ov2q0%2Bwuv76Q4LpEPsfTEjaZ1uJ9IoRCKmUv0zb%2Bxb7etRcQUBOA18BAgdrPYQ%3D%3D",
		success : function(data){			
			let item = data.querySelectorAll("item");
			item.forEach(function(value,index){
				var hmcNm = value.querySelector('hmcNm');
				var locAddr = value.querySelector('locAddr');
				var hmcTelNo = value.querySelector('hmcTelNo');
				var hmcNm_val = "";
				var locAddr_val = "";
				var hmcTelNo_val = "";
				
				if(hmcNm != null) { hmcNm_val = hmcNm.innerHTML; }
				if(locAddr != null) { locAddr_val = locAddr.innerHTML; }
				if(hmcTelNo != null) { hmcTelNo_val = hmcTelNo.innerHTML; }
				
					output += "<tr class='column content' onclick='medical2(this)'>";
		    	  	output += "<td>" + hmcNm_val + '</td>';
		      		output += "<td>09:00 ~ 18:00</td>";
		            output += "<td>" + locAddr_val + '</td>';
		            output += "<td>" + hmcTelNo_val + "</td>";            
		            output += '</tr>';				
				result_list.push(value);			
			});	
			$(".content").remove();		//데이터 지우기				
      	    $("#info").append(output);  // 새로운 데이터 덮어쓰기  
		}		
	})
			
			
	
}

	function medical2(obj) {			
		var abc = obj.querySelectorAll("td");
		var name = abc[0].innerText;
		var addr = abc[2].innerText;
		var tel = abc[3].innerText;
		var form = document.createElement("form");
	    form.setAttribute("charset", "UTF-8");
	    form.setAttribute("method", "POST");  //Post 방식
	    form.setAttribute("action", "medical2.do"); //요청 보낼 주소
	
	    var hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "hName");
	    hiddenField.setAttribute("value", name);
	    form.appendChild(hiddenField);       	
	   
	    hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "addr");
	    hiddenField.setAttribute("value", addr);
	    form.appendChild(hiddenField);
	    
	    hiddenField = document.createElement("input");
	    hiddenField.setAttribute("type", "hidden");
	    hiddenField.setAttribute("name", "tel");
	    hiddenField.setAttribute("value", tel);
	    form.appendChild(hiddenField);
	    
	    document.body.appendChild(form);
	
	    form.submit(); 
	}
	
</script>
	<style>
		/*-----------------sub_nav_menu > start---------------*/

		.order_box{
				margin-left:50px;
		        width: 790px;
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
		.order li:nth-child(3){color:#ce8080;}


		/*-----------------sub_nav_menu > end---------------*/

		*{font-weight:bold;}

		
		main {
			width: 1320px;
			min-height:529px;
			margin: 100px auto;
		}
		
		main h2 {
			font-size: 40px;
		}

		main hr {
			height: 2px;
			border: 0;
			background: #ff7373;
		}
		
		.xi-search {
			color: #000;
		}
		
		#addr {
			font-weight: bold;
			font-size: 25px;
			vertical-align: auto;
			margin: 25px 0;
		}


		.addr {
			-webkit-appearance: none; /* 네이티브 외형 감추기 */
			-moz-appearance: none;
			appearance: none;
			font-weight: bold;
			width: 180px;
			height: 45px;
			margin-left: 20px;
			background-size: 20px;
			padding: 5px 30px 5px 10px;
			border-radius: 4px;
			outline: 0 none;
			font-size: 20px;
			background: url("${path }/resources/image/bottom_arrow.png") no-repeat
				95% 50%; /* 화살표 모양의 이미지 */
		}
		
		.addr:hover {
			border: 3px solid #ff8f8f;
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

		option {
			background: #ff8f8f;
			color: #fff;
			padding: 3px 0;
		}

		.button {
			border: 0;
			background: #ffe7e7;
			width: 40px;
			height: 45px;
			border-radius: 4px;
			margin-left: 10px;
		}

		.button:hover {
			background: #ffe7e7;
			border-radius: 10px;
			transition: .2s;
			box-shadow: inset 3px 3px 5px #c57171;
			cursor: pointer
		}

		

		#addr #address_search {
			display: flex;
			justify-content: center;
			align-items: center;
		}

		.medical_info {
			border-collapse: separate;
			border-spacing: 0 20px;
		} /*tr간 간격*/

		.column {
			background: #ffe7e7;
		}
		
		.column:nth-child(1) {
			background: #fff;
		}

		.content td:first-child, th:first-child {
			border-radius: 10px 0 0 10px;
		} /*td테두리 첫번쨰와 마지막만 둥글게 하기위해서*/
		.content td:last-child, th:last-child {
			border-radius: 0 10px 10px 0;
		}

		.medical_info th {
			width: 350px;
			font-weight: bold;
			font-size: 20px;
			text-align: center;
			vertical-align: middle;
			height: 73px;
		}
		
		.content td {
			width: 350px;
			font-weight: bold;
			font-size: 20px;
			text-align: center;
			vertical-align: middle;
			height: 73px;
		}

		

		.content:hover {
			background: #fff;
			box-shadow: 0 0 0 3px #ff8f8f inset;
			border-radius: 10px;
			transition: .2s;
			cursor: pointer
		}

	</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
		<div class="order_box">
		<ul class="order">
			<li>건강검진 유의사항</li>
			<li><i class="xi-angle-right"></i></li>
			<li>건강검진 병원조회</li>
			<li><i class="xi-angle-right"></i></li>
			<li>건강검진 예약하기</li>
			<li><i class="xi-angle-right"></i></li>
			<li>건강검진 예약완료</li>
		</ul>
	</div>
	<main>
		<h2>건강검진 병원조회</h2>
		<hr>
		<form name="form_1" id="form_1" method="post" action="ajax.jsp" onsubmit="return getInfo();">
			<div id="addr">
				<div id="address_search">
					지역 <select class="addr" name="sido" id="sido"><option disabled selected>시/도</option></select>
					<select class="addr" name="sigugun" id="sigugun"><option disabled selected>시/구/군</option></select>					
					<button class="button" type="button" onclick="getInfo();">
						<i class="xi-search xi-2x"></i>
					</button>
				</div>
			</div>
		</form>
		<hr>
		<table class="medical_info" id="info">
			<tr class="column">
				<th>병원명</th>
				<th>진료시간</th>
				<th>주소</th>
				<th>연락처</th>
			</tr>
		</table>
		<div id="page"></div>
	</main>
		<%@include file="../includes/footer.jsp"%>
</body>


</html>