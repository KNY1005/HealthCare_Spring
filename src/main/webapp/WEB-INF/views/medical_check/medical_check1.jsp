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
	<script type="application/javascript">
		jQuery(document).ready(function () {
			jQuery('#table1').css('color', 'red');
			jQuery('#table_header').css('font-size', '30pt');
			jQuery('#table2 td:first-child').css('color', 'blue');

			//sido option 추가
			jQuery.each(hangjungdong.sido, function (idx, code) {
				//append를 이용하여 option 하위에 붙여넣음
				jQuery('#sido').append(fn_option(code.sido, code.codeNm));
			});

			//sido 변경시 시군구 option 추가
			jQuery('#sido').change(function () {
				jQuery('#sigugun').show();
				jQuery('#sigugun').empty();
				jQuery('#sigugun').append(fn_option('', '선택')); //
				jQuery.each(hangjungdong.sigugun, function (idx, code) {
					if (jQuery('#sido > option:selected').val() == code.sido)
						jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
				});

				//세종특별자치시 예외처리
				//옵션값을 읽어 비교
				if (jQuery('#sido option:selected').val() == '36') {
					jQuery('#sigugun').hide();
					//index를 이용해서 selected 속성(attr)추가
					//기본 선택 옵션이 최상위로 index 0을 가짐
					jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
					//trigger를 이용해 change 실행
					jQuery('#sigugun').trigger('change');
				}
			});

			//시군구 변경시 행정동 옵션추가
			jQuery('#sigugun').change(function () {
				//option 제거
				jQuery('#dong').empty();
				jQuery.each(hangjungdong.dong, function (idx, code) {
					if (jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
						jQuery('#dong').append(fn_option(code.dong, code.codeNm));
				});
				//option의 맨앞에 추가
				jQuery('#dong').prepend(fn_option('', '선택'));
				//option중 선택을 기본으로 선택
				jQuery('#dong option:eq("")').attr('selected', 'selected');

			});

			jQuery('#dong').change(function () {
				var sido = jQuery('#sido option:selected').val();
				var sigugun = jQuery('#sigugun option:selected').val();
				var dong = jQuery('#dong option:selected').val();
				var dongCode = sido + sigugun + dong + '00';
			});
		});

		function fn_option(code, name) {
			return '<option value="' + code + '">' + name + '</option>';
		}
		function fn_iframe(url) {
			jQuery('#iframe').attr('src', url);
		}
	</script>
	<style>
		/*-----------------sub_nav_menu > start---------------*/

		.sub_nav_menu ul {
			margin-left: 165px;
			margin-top: 20px;
		}

		.sub_nav_menu li {
			text-align: center;
			float: left;
			/*글자길이 길어서 넘어가면 이거 늘리세요 */
			font-weight: bold;
			font-size: 20px;
		}

		.sub_nav_menu li:nth-child(1),
		.sub_nav_menu li:nth-child(3),
		.sub_nav_menu li:nth-child(5),
		.sub_nav_menu li:nth-child(7) {
			width: 180px;
		}

		.sub_nav_menu li:nth-child(2),
		.sub_nav_menu li:nth-child(4),
		.sub_nav_menu li:nth-child(6) {
			width: 20px;
		}

		.sub_nav_menu li:nth-child(3) {
			color: #9E0404;
		}

		/*-----------------sub_nav_menu > end---------------*/

		#height {
			height: 80px;
		}
		main h3 {
			font-weight: bold;
			font-size: 48px;
		}

		main hr {
			height: 2px;
			border: 0;
			background: #ff7373;
		}

		main #address_search {
			position: relative;
		}

		main #addr #address_search select {
			-webkit-appearance: none;
			/* 네이티브 외형 감추기 */
			-moz-appearance: none;
			appearance: none;
		}

		main #addr #address_search select {
			font-weight: bold;
			width: 180px;
			height: 45px;
			margin-left: 20px;
			background-size: 20px;
			padding: 5px 30px 5px 10px;
			border-radius: 4px;
			outline: 0 none;
			font-size: 20px;
			background: url("../image/bottom_arrow.png") no-repeat 95% 50%;
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

		main #addr #address_search button {
			border: 0;
			background: #ffe7e7;
			width: 40px;
			height: 45px;
			border-radius: 4px;
			position: absolute;
			right: -60px;
		}

		main #addr #address_search button:hover {
			background: #ffe7e7;
			border-radius: 10px;
			transition: .2s;
			box-shadow: inset 1px 1px 3px rgb(197, 197, 197);
			cursor: pointer
		}

		main #addr #address_search button .xi-search {
			color: #000;
		}

		main #addr {
			font-weight: bold;
			font-size: 30px;
			vertical-align: auto;
			margin: 25px 0;
		}

		main #addr div {
			display: inline-block;
			margin-left: 300px;
		}

		main table {
			border-collapse: separate;
			border-spacing: 0 20px;
		}

		/*tr간 간격*/
		main table tr {
			background: #ffe7e7;
		}

		main table tr:nth-child(1) {
			background: #fff;
		}

		main table td:first-child,
		main table th:first-child {
			border-radius: 10px 0 0 10px;
		}

		/*td테두리 첫번쨰와 마지막만 둥글게 하기위해서*/
		main table td:last-child,
		main table th:last-child {
			border-radius: 0 10px 10px 0;
		}

		main table th {
			font-size: 24px;
		}

		main table td {
			font-size: 20px;
		}

		main table th,
		main table td {
			width: 350px;
			font-weight: bold;
			text-align: center;
			vertical-align: middle;
			height: 73px;
		}

		main table tr:nth-child(n+2):hover {
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
		<h3>건강검진 병원조회</h3>
		<hr>
		<div id="addr">
			<div id="address_search">지역
				<select id="sido">
					<option disabled selected>시/도</option>
				</select><!--//#sido-->
				<select id="sigugun">
					<option disabled selected>시/구/군</option>
				</select><!--//#sigugun-->
				<select id="dong">
					<option disabled selected>동</option>
				</select><!--//#dong-->
				<button><i class="xi-search xi-2x"></i></button>
			</div><!--address_search-->
		</div><!--//#addr-->
		<hr>
		<table>
			<tr>
				<th>병원명</th>
				<th>진료시간</th>
				<th>주소</th>
				<th>연락처</th>
			</tr>
			<tr>
				<td>땡땡 병원</td>
				<td>00:00 ~ 00:00</td>
				<td>전라북도 전주시 완산구 땡땡로 77</td>
				<td>010-0000-1234</td>
			</tr>
			<tr>
				<td>땡땡 종합병원</td>
				<td>00:00 ~ 00:00</td>
				<td>전라북도 전주시 덕진구 땡땡땡로 88</td>
				<td>010-0000-1234</td>
			</tr>
		</table>
	</main>
		<%@include file="../includes/footer.jsp"%>
</body>


</html>