<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예방접종 유의사항</title>
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
	main h2{font-size:40px; margin-bottom: 20px;}
	main div{border: 1px solid #000; border-radius:10px; padding:20px; overflow:auto; width:1320px; height:600px;}
	main div p{font-size:20px; line-height:30px;}
	main div p>span{font-size:25px;}

	main a{margin-top:20px; position:relative; float:right; background-color:#FF9797; text-align:center; 
		width:270px; height:40px; padding-top:15px; border-radius:10px; color:#fff; font-size:25px; text-decoration: none;}
	main a:hover {
	box-shadow: inset 3px 3px 5px #c57171;
	cursor: pointer;
	transition: box-shadow 0.1s linear;
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
	</style>
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
		<h2>예방접종 유의사항</h2>
		<div>
			<p>
			<span>접종 전 주의사항</span><br>
			<br>
			· 아이의 건강상태를 가장 잘 알고 있는 사람이 데리고 옵니다.<br>
			· 접종 전날 목욕을 시키고, 깨끗한 옷을 입혀서 데리고 옵니다.<br>
			· 집에서 아이의 체온을 측정하고 열이 없는 것을 확인하고 방문합니다.<br>
			· 가능하면 예방접종을 하지 않을 아이는 데리고 방문하지 않습니다.<br>
			· 모자보건수첩 또는 아기수첩을 지참하고 방문합니다.<br>
			<br>
			<span>접종 후 주의사항</span><br>
			<br>
			· 접종 후 20~30분간 접종기관에 머물러 아이의 상태를 관찰합니다.<br>
			· 귀가 후 적어도 3시간 이상 주의 깊게 관찰합니다.<br>
			· 접종당일과 다음날은 과격한 운동을 하지 않습니다.<br>
			· 접종부위에 발적, 통증, 부종이 생기면 찬 물수건을 대 줍니다.<br>
			· 접종부위는 청결하게 합니다.<br>
			· 아이는 반드시 바로 눕혀 재웁니다.<br>
			· 접종 후 최소 3일간은 특별한 관심을 가지고 관찰하며 고열, 경련이 있을 때에는 곧 의사 진찰을 받도록 합니다.<br>
			<br>
			<span>예방접종의 금기사항과 주의사항</span><br>
			<br>
			금기사항 : 해당 백신을 접종받을 경우 중증 이상반응이 발생할 가능성이 높은 경우<br>
			주의사항 : 이상반응 빈도 또는 이상반응의 중등도가 증가하거나 면역반응이 감소할 수 있는 경우<br>
			<br>
			-예방접종의 영구적인 금기사항<br>
			1) 백신의 성분에 대해 또는 이전 백신 접종 후에 아나필락시스와 같은 심한 알레르기 반응이 있었던 경우 해당 백신 금기<br>
			2) 백일해 또는 백일해 포함 백신 접종 후 7일 이내에 원인을 알 수 없는 뇌증(encephalopathy)이 발생한 경우 백일해 또는 백일해 포함 백신 금기<br>
			3) 중증복합면역결핍 또는 장중첩증의 병력이 있는 경우 로타바이러스 백신 금기<br>
			<br>
			-생백신의 일시적인 금기사항<br>
			1) 임신<br>
			2) 면역저하자<br>
			<br>
			-일시적인 주의사항<br>
			1) 중등도 또는 심한 급성기 질환은 모든 백신의 접종 시 주의를 요함<br>
			2) 최근에 항체 함유 혈액제제를 투여받은 경우에는 MMR과 수두 함유 백신 등 주사용 생백신의 접종 일정에 주의를 요함<br>
			<br>
			<span>다음의 경우 백신 접종의 금기 아님</span><br>
			<br>
			· 미열, 상기도 감염증, 감기, 경미한 설사 등의 경미한 급성 질환이 있는 경우<br>
			· 질환에 노출되거나 회복기에 있는 경우<br>
			· 가족 내 임신부 또는 면역저하 환자가 있는 경우<br>
			· 모유수유 중인 경우(두창 백신 제외)<br>
			· 미숙아<br>
			· 백신에 포함되지 않은 성분에 대한 알레르기가 있는 경우<br>
			· 백신 성분에 대해 아나필락시스가 아닌 알레르기 반응이 있는 경우<br>
			· 면역억제와 관련이 없는 이상반응에 대한 가족력이 있는 경우<br>
			· 경련 또는 영아돌연사증후군의 가족력이 있는 경우<br>
			<br>
		</p>
		</div>
		<a href="#">예방접종 예약 하러가기</a>
	</main>
	<%@include file="../includes/footer.jsp"  %>
</body>
</html>