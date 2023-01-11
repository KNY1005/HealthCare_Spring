<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헌혈 유의사항</title>
<!--파비콘-->
<link rel="icon" type="image/png" sizes="16x16"
	href="${path }/resources/image/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${path }/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path }/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
<style>
#main {
	margin: 0 auto 0;
	width: 1320px;
	height: 1000px;
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
.sub_nav_menu li:nth-child(1){
    color:red;
} 

#main h2 {
	font-size: 35px;
	font-weight: bold;
}

#main #warning {
	border: 1px solid #000;
	margin-top: 20px;
	margin-bottom: 20px;
	border-radius: 10px;
	padding: 20px;
	overflow: auto;
	width: 1320px;
	height: 600px;
}

#warning span {
	font-size: 25px;
	font-weight: bold;
}

#warning p {
	font-size: 20px;
	line-height: 30px;
}


#main h3{
	font-size: 30px;
	font-weight: bold;
}
#main #member_info {
	border: 1px solid #000;
	margin-top: 20px;
	border-radius: 10px;
	padding: 20px;
	width: 1320px;
	height: 100px;
	display: flex;
	align-items: center;
	font-weight: bold;
	text-align: center;
	justify-content: center;
	font-size: 20px;
}

#main #member_info input {
	height: 40px;
	font-size: 20px;
	margin:0 20px 0;
	border: 1px solid #000;
	border-radius: 10px;
	padding-right: 40px;
	width:100px;
}

#member_info button{
	background-color: #FF9797;
	text-align: center;
	width: 130px;
	height: 40px;	
	border:none;
	border-radius: 10px;
	color: #fff;
	font-size: 20px;
	
}

#member_info button:hover {
	border-radius: 10px;
	transition: .2s;
	box-shadow: inset 3px 3px 5px #c57171;
	cursor: pointer;
}

#main a {
	margin-top: 20px;		
	float: right;
	background-color: #FF9797;
	text-align: center;
	width: 230px;
	height: 40px;
	padding-top: 20px;
	border-radius: 10px;
	color: #fff;
	font-size: 20px;
}
#main a:hover {
	border-radius: 10px;
	transition: .2s;
	box-shadow: inset 3px 3px 5px #c57171;
	cursor: pointer;
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
	
	<main id="main">
		<h2>헌혈 유의사항</h2>
		<div id="warning">
			<span>□ 헌혈 참여 기준 (전혈 헌혈)</span><br>
			<p>
				- 나이 : 만 16세~69세 (고교 1학년은 생일 지나면 가능)<br> - 체중 : 남자 50kg이상, 여자
				45kg 이상<br> - 다음 헌혈 가능일 : 8주 후 같은 요일<br> - 소요시간 : 약 20분<br>
				- 신분증 : 사진이 붙어 있어 본인임을 확인할 수 있는 주민등록증, 운전 면허증, 공무원증, 여권 등<br> *
				65세 이상이라면 60~64세 때 헌혈한 경험이 있어야 함.<br> <br> <span>□
					헌혈자 혜택</span><br> ○ 헌혈증서 발급 <br> ○ 헌혈 1회당 봉사활동 4시간 인정
				(www.vms.or.kr)<br> ○ 감사 기념품 증정 (영화관람권, 문화상품권, 손톱깎이세트 등)<br>
				○ 혈액검사실시: 혈액형(ABO, Rh, 비예기항체, 아형) 검사, B형간염, C형간염, HTLV, 간기능 검사, 매독,
				총단백 검사, 핵산증폭검사<br> <br> <span>□ 헌혈 전 유의사항</span><br>

				- 코로나19 백신 접종일로부터 7일간 헌혈 참여가 금지됩니다. (백신 접종 후 이상반응이 있을 경우 증상이 사라진
				날로부터 7일간 헌혈 참여가 금지)<br> - 헌혈 전날 과음은 피해 주시고 충분한 수면을 취해주시기 바랍니다.<br>
				- 오전에 헌혈에 참가하시는 분은 헌혈 당일 아침식사는 필수입니다.<br> - 코로나19 및 인플루엔자 확진 시
				완치 후 1개월이 경과해야 합니다. <br> - 외국을 여행한 경우는 귀국 후 1개월이 경과해야 헌혈이
				가능합니다. <br> - 아래 내용에 해당되는 경우 일정 기간 동안 헌혈 불가합니다.<br> <br>



				<span>ㅁ 제한일수</span><br> - 해당없음 : 고혈압약, 고지혈증약, 당뇨약, 소화제, 피임약 <br>
				- 당일 : 수면시간 4시간 미만, 전날 과음, 약국에서 구입한 감기약, 근육이완제(약물, 주사 포함)<br> -
				3일 : 진통제, 소염제, 해열제, 병원 처방 감기약<br> - 7일 : 항생제, 항응고제, 항진균제(무좀, 백선
				치료) <br> - 1개월 이상 : 내시경, 여드름 치료제, 탈모치료제, 해외여행(기본)<br> -
				6개월 이상 : 문신(눈썹포함)<br> <br> <span>□ 헌혈 후 유의사항</span><br>

				- 헌혈 직후 헌혈 장소에서 15분 이상 휴식을 취해주세요.<br> - 헌혈 후에는 평소보다 3~4컵의 물을 더
				섭취해주세요.<br> - 채혈 부위의 반창고는 최소 4시간 이상 붙여주세요.<br> - 헌혈 당일 헌혈한
				팔로 무거운 것을 들거나 심한 운동은 삼가주세요. <br> - 헌혈 당일 음주나 헌혈 후 1시간 이내 흡연은
				피해주세요. <br> - 헌혈 당일 가벼운 샤워는 가능하나, 사우나, 찜질방, 통목욕은 피해주세요. <br>
			</p>

		</div>
		<h3>본인인증</h3>
		<div id="member_info">
			<label for="name">이름</label><input name="name" maxlength='8'></input> 
			<label for="">주민번호</label><input type="text" maxlength='6'></input>-<input type="password"
				maxlength='7'></input>
			<button>확인</button>	
		</div>
		<a href="#">헌혈 예약 하러가기</a>
	</main>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>