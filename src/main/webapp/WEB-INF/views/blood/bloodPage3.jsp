<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헌혈 예약</title>
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

            //시군구 변경시 행정동 옵션추가
            jQuery('#sigugun').change(function(){
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
            });
        });

        function fn_option(code, name){
            return '<option value="' + code +'">' + name +'</option>';
        }
        function fn_iframe(url){
            jQuery('#iframe').attr('src', url);
        }
    
</script>
<style>
body, h1, h2, h3, h4, h5, h6, li, p, #nav li a, #topbar, input, button,
	select, textarea, a, .wf-container>*, .widget-title, .dwqa-container,
	#wpmem_reg, #wpmem_login {
	font-family: "arita-light", "arita-sans-light" !important;
	color: #000;
}

main {
	width: 1320px;
	height: 1000px;
	margin: 0 auto 0;
}

#height {
	height: 80px;
}
.sub_nav_menu {
	margin: 0 0 120px 150px;
}
.sub_nav_menu li {
	text-align: center;
	float: left;
	font-weight: bold;
	font-size: 20px;
	margin-left:20px;
	margin-right:20px;
}
.sub_nav_menu li:nth-child(5){
    color:red;
} 

.h3 {
	font-weight: bold;
	font-size: 40px;
}

.hr {
	height: 2px;
	border: 0;
	background: #ff7373;
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
	margin-left:10px;
}

.button:hover {
	background: #ffe7e7;
	border-radius: 10px;
	transition: .2s;
	box-shadow: inset 3px 3px 5px #c57171;
	cursor: pointer
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

#addr #address_search {
	display:flex;
	justify-content: center;
	align-items: center;
}

.blood_info {
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

.blood_info th {
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
	<div class="sub_nav_menu">
		<ul>
			<li>헌혈 유의사항</li>
			<li><i class="xi-angle-right"></i></li>
			<li>헌혈 전자문진</li>
			<li><i class="xi-angle-right"></i></li>
			<li>헌혈 예약</li>
			<li><i class="xi-angle-right"></i></li>
			<li>헌혈 예약 완료</li>
		</ul>
	</div>
	<main>

		<h3 class="h3">헌혈 예약</h3>
		<hr class="hr">
		<div id="addr">
			<div id="address_search">
				지역 <select class="addr" id="sido"><option disabled selected>시/도</option></select>
				<select class="addr" id="sigugun"><option disabled selected>시/구/군</option></select>
				<select class="addr" id="dong"><option disabled selected>동</option></select>
				<button class="button">
					<i class="xi-search xi-2x"></i>
				</button>
			</div>
		</div>
		<hr class="hr">
		<table class="blood_info">
			<tr class="column">
				<th>헌혈의집명</th>
				<th>운영시간</th>
				<th>주소</th>
				<th>연락처</th>
			</tr>
			<tr class="column content" onClick="location.href='page4.do'">
				<td>땡땡 헌혈의 집</td>
				<td>00:00 ~ 00:00</td>
				<td>전라북도 전주시 땡땡</td>
				<td>010-0000-1234</td>
			</tr>
			<tr class="column content" onClick="location.href='page4.do'">
				<td>땡땡 헌혈의 집</td>
				<td>00:00 ~ 00:00</td>
				<td>전라북도 전주시 땡땡</td>
				<td>010-0000-1234</td>
			</tr>
		</table>

	</main>

	<%@include file="../includes/footer.jsp"%>
</body>
</html>