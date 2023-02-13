<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=, initial-scale=1.0">
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
            $("#sido option:eq(1)").text("서울");
            $("#sido option:eq(2)").text("부산");
            $("#sido option:eq(3)").text("대구");
            $("#sido option:eq(4)").text("인천");
            $("#sido option:eq(5)").text("광주");
            $("#sido option:eq(6)").text("대전");
            $("#sido option:eq(7)").text("울산");
            $("#sido option:eq(8)").text("세종");
            $("#sido option:eq(9)").text("경기");
            $("#sido option:eq(10)").text("강원");
            $("#sido option:eq(11)").text("충북");
            $("#sido option:eq(12)").text("충남");
            $("#sido option:eq(13)").text("전북");
            $("#sido option:eq(14)").text("전남");
            $("#sido option:eq(15)").text("경북");
            $("#sido option:eq(16)").text("경남");
            $("#sido option:eq(17)").text("제주");                         

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

            //시군구 변경시 행정동 옵션추가
            /* jQuery('#sigugun').change(function(){
                //option 제거
                jQuery('#dong').empty();
                jQuery.each(hangjungdong.dong, function(idx, code){
                    if(jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
                        jQuery('#dong').append(fn_option(code.dong, code.codeNm));
                });
                //option의 맨앞에 추가
                jQuery('#dong').prepend(fn_option('','선택'));
                //option중 선택을 기본으로 선택
                jQuery('#dong option:eq("")').attr('selected', 'selected');

            }); 

            jQuery('#dong').change(function(){
                var sido = jQuery('#sido option:selected').val();
                var sigugun = jQuery('#sigugun option:selected').val();
                var dong = jQuery('#dong option:selected').val();
                var dongCode = sido + sigugun + dong + '00';
            });*/
        });

        function fn_option(code, name){
            return '<option value="' + code +'">' + name +'</option>';
        }
        function fn_iframe(url){
            jQuery('#iframe').attr('src', url);
        }

</script>

<script>	
	function xmlToJson(xml) {
	  // Create the return object
	  var obj = {};

	  if (xml.nodeType == 1) {
	    // element
	    // do attributes
	    if (xml.attributes.length > 0) {
	      obj["@attributes"] = {};
	      for (var j = 0; j < xml.attributes.length; j++) {
	        var attribute = xml.attributes.item(j);
	        obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
	      }
	    }
	  } else if (xml.nodeType == 3) {
	    // text
	    obj = xml.nodeValue;
	  }

	  // do children
	  // If all text nodes inside, get concatenated text from them.
	  var textNodes = [].slice.call(xml.childNodes).filter(function(node) {
	    return node.nodeType === 3;
	  });
	  if (xml.hasChildNodes() && xml.childNodes.length === textNodes.length) {
	    obj = [].slice.call(xml.childNodes).reduce(function(text, node) {
	      return text + node.nodeValue;
	    }, "");
	  } else if (xml.hasChildNodes()) {
	    for (var i = 0; i < xml.childNodes.length; i++) {
	      var item = xml.childNodes.item(i);
	      var nodeName = item.nodeName;
	      if (typeof obj[nodeName] == "undefined") {
	        obj[nodeName] = xmlToJson(item);
	      } else {
	        if (typeof obj[nodeName].push == "undefined") {
	          var old = obj[nodeName];
	          obj[nodeName] = [];
	          obj[nodeName].push(old);
	        }
	        obj[nodeName].push(xmlToJson(item));
	      }
	    }
	  }
	  return obj;
	}
	
	const getXMLfromAPI = async () => {
		const url = "http://openapi1.nhis.or.kr/openapi/service/rest/HmcSearchService";
		const reqURL = `${url}${SXsBCxP5w%2BvYN0eL9xWlIZU5Ov2q0%2Bwuv76Q4LpEPsfTEjaZ1uJ9IoRCKmUv0zb%2Bxb7etRcQUBOA18BAgdrPYQ%3D%3D}`;
	    const response = await fetch(reqURL);
	    const xmlString = await response.text();
	    let XmlNode = new DOMParser().parseFromString(xmlString, "text/xml");
	    console.log(xmlToJson(XmlNode));
	  };
	
	

	function goPage4(obj) {			
  		var abc = obj.querySelectorAll("td");
  		var zip = abc[0].innerText;
  		var addr = abc[2].innerText;
  		var phone = abc[3].innerText;
			
		var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "POST");  //Post 방식
        form.setAttribute("action", "page4.do"); //요청 보낼 주소

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
	
	function getInfo(){			
		var sido = $("#sido option:selected").text();
		var sigugun = $("#sigugun option:selected").text();
		var result_list=[];
		
		$.ajax({
			url:" http://openapi1.nhis.or.kr/openapi/service/rest/HmcSearchService/getRegnHmcList?page=1&pageno=5&ServiceKey=SXsBCxP5w%2BvYN0eL9xWlIZU5Ov2q0%2Bwuv76Q4LpEPsfTEjaZ1uJ9IoRCKmUv0zb%2Bxb7etRcQUBOA18BAgdrPYQ%3D%3D",
			method:"post",
			data :{},
			success:function(data){				
				var list = data.data;
				var output = "";		
				alert
				if($("#sigugun option:selected").text()=='선택'){
					$.each(list,function(index,value){
						var addr = list[index].주소지;
						if(addr.includes(sido)){
							result_list.push(value);						
						}		
				});
				}else($.each(list,function(index,value){
					var addr = list[index].주소지;
					if(addr.includes(sido+" "+sigugun)){
						result_list.push(value);					
					}			
				}));		
			},
			complete : function(data){
				var output = "";
				result_list.forEach(function(item,index){						
						console.log('아이템은?'+index);
						output += "<tr class='column content' onclick='goPage4(this)'>";
			    	  	output += "<td>" + item['건강검진 병원조회'] + '</td>';
			      		output += "<td>"+'09:00 ~ 18:00'+'</td>';
			            output += "<td>"+item.주소지+'</td>';
			            output += "<td>"+item.전화번호+"</td>";            
			            output += '</tr>';							
				});
				$(".content").remove();		//데이터 지우기				
	      	    $("#info").append(output);  // 새로운 데이터 덮어쓰기 */			
				
			}
		})
		
	}

</script>
	<style>
		/*-----------------sub_nav_menu > start---------------*/

		.order_box{
		        width: 790px;
		        height: 110px;
		        display: flex;
		 		align-items: flex-end;
		        justify-content: center;
		      }    
		.order{
		        width: 500px;
		        display: flex;
		        flex-direction: row;
		        justify-content: space-evenly;
		        }
		.order li:nth-child(3){color:#ce8080;}


		/*-----------------sub_nav_menu > end---------------*/

		*{font-weight:bold;}
		
		#height {
			height: 80px;
		}
		
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
	<div id="height"></div>
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