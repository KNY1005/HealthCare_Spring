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
	<title>건강검진 유의사항</title>
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
			margin: 100px auto;
			width: 1320px;
			height: 800px;
			display:flex;
			flex-direction:column;
		}
		
		main h2 {
			font-size: 40px;
		}

		/*유의사항 컨텐츠 박스*/
		main div {
			border: 1px solid #000;
			margin-top: 20px;
			border-radius: 10px;
			padding: 20px;
			overflow: auto;
			width: 1320px;
			height: 600px;
		}

		main div p {
			font-size: 20px;
			line-height: 30px;
		}

		/*유의사항 안에 큰글씨*/
		main div p>span {
			font-size: 25px;
		}

		/*예약하러가기 버튼*/
		main a {
			margin-top: 20px;
			background-color: #FF9797;
			text-align: center;
			width: 260px;
			height: 40px;
			padding-top: 20px;
			border-radius: 10px;
			color: #fff;
			font-size: 25px;
			margin-left:1060px;
		}

		main a:hover {
			box-shadow: inset 3px 3px 5px #c57171;
			cursor: pointer;
			transition: all 0.3s;

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
		<h2>건강검진 유의사항</h2>
		<div>
			<p>
				<span>국가건강검진 전 주의사항</span><br>
				<br>
				· 검진 하루 전 저녁식사는 8시 이전에 가볍게 드시고, 밤10시 이후로 반드시 금식 (물· 담배· 껌· 은단 포함)하십시오.<br>
				· 검진당일 아침식사는 물론 물, 껌, 담배, 우유, 주스 등도 드시지 마십시오.<br>
				· 위내시경 검사 예약된 분 안내<br>
				- 아스피린, 항응고제를 드실 경우 주치의와 상담 후 검진 7일 전부터 복용을 중단하십시오.<br>
				- 단, NOAC 계통의 항응고제는 주치의 상담 후 검진 2일 전부터 복용을 중단하십시오.<br>
				- 수면으로 예약된 분은 반드시 보호자를 동반하셔야 하며, 검사 후 자가운전은 절대 금합니다.<br>
				- 흔들리는 치아가 있을 경우 빠질 위험이 있으므로 다른 검사방법을 선택하는 것이 좋습니다.<br>
				· 혈압약을 드시는 분은 주무시기 전에 드십시오.<br>
				· 당뇨약(인슐린 포함)은 검진당일에는 투약하거나 주사하지 마십시오.(저혈당이 올 수 있기 때문입니다.)<br>
				· [검진 항목 중 채변이 있는 경우] 채변받는방법-채변용기에 성명을 반드시 기입하고 용기(파란색뚜껑)에 달려있는 스푼을 이용하여 강낭콩 크기 정도 담으시면 됩니다.<br>
				<br>
				<span>여성고객 안내</span><br>
				<br>
				· 검진 전 임신여부를 반드시 확인하시기 바랍니다. (방사선은 태아에게 매우 위험 합니다.)<br>
				· 검진은 생리 기간 중에는 가능한 피해주십시오.(자궁경부암 검사 및 대변검사 등의 결과가 부정확할 수도 있습니다.)<br>
				· 자궁경부암 검사 시 주의사항<br>
				- 자궁적출술을 받았거나 성경험이 없는 분은 검사 전에 의료진과 상담 후 검진을 받으십시오.<br>
				­- 검사 시행 48~72시간 전부터 부부관계 및 질세척을 삼가시고, 1주일 전부터는 질정이나 질크림등의 사용을 중단하셔야 보다 정확한
				검사가 이루어집니다.<br>
				- 검사후 출혈이나 통증이 발생할 수 있습니다.(자궁경부의 조직이 약하거나, 염증 또는 노화에 의한 위축이 있는 경우에 발생하며 시간이 지나면 대부분 호전되나 증상이 지속될 시에는 산부인과 진료를 권유
				드립니다.) ※ 산부인과 진료비 본인부담<br>
				<br>
				<span>검진 시 준비물</span><br>
				<br>
				· 준비물 : 신분증, 공단 검진표, 문진표(미리 작성하여 지참), 채변(해당자에 한함)<br>
				· 암검진 대상자 중 본인부담금(10%)이 있는 경우 비용이 발생할 수 있습니다. (현장 현금 결제 또는 카드 수납 가능)<br>
				· [위내시경 받는 분] 진단목적으로 조직검사 또는 헬리코박터균검사를 할 경우 추가비용이 발생할 수 있습니다.<br>
			</p>
		</div>
		<a href="medical1.do">건강검진 예약 하러가기</a>
	</main>
		<%@include file="../includes/footer.jsp"%>






</body>
</html>
