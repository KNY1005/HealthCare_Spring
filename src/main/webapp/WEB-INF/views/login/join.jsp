<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.1.min.js"></script>
<script>
	var checkIdFlag = false;
	var checkIdVal = "";
	function checkId(){
		var idval = $("#id").val();
		
		$.ajax({
			url : "checkId.do",
			type: "post",
			data: "id="+idval,
			success:function(data){
				if(data == 1){
					alert("중복된 id입니다.");
					checkIdFlag = false;
					checkIdVal = "";
				}else{
					alert("사용할 수 있는 id입니다.");
					checkIdFlag = true;
					checkIdVal = idval;
				}
			}
		});
	}
	
	$(function() {
		$("form").submit(function() {
			
			if(!checkIdFlag){
				alert("아이디 중복확인을 하세요.");
				return false;
			}else if($("id").val() == ""){
				alert("아이디를 입력하세요")
				return false;
			}else if($("name").val() == ""){
				alert("이름을 입력하세요")
				return false;
			}else if($("password").val() == ""){
				alert("패스워드를 입력하세요")
				return false;
			}else if($("addr").val() == ""){
				alert("주소를 입력하세요")
				return false;
			}else if($("phone").val() == ""){
				alert("연락처를 입력하세요")
				return false;
			}else{
				return true;
			}
			
		});
	})
	
	function blurId(obj){
		var val = obj.value;
		
		if(checkIdFlag && val != checkIdVal){
			checkIdFlag = false;
		}
	}
</script>
<body>
	<h2>회원가입 페이지</h2>
	<form action="join.do" method="post">
		아이디  : <input type="text" name="mid" id="mid" onblur="blurId(this)"> <button type="button" onclick="checkId()">중복체크</button>
		<!-- 아이디가 데이터베이스에 존재하는지 확인 / ajax활용 -->
		<br>
		이름 : <input type="text" name="mname" id="mname">
		<br>
		비밀번호 : <input type="password" name="mpwd" id="mpwd">
		<br>
		주민등록번호 : <input type="text" name="mnumber" id="mnumber">
		<br>
		연락처 : <input type="text" name="mphone" id="mphone">
		<br>
		이메일 : <input type="text" name="memail" id="memail">
		<br>
		<button type="submit">회원가입</button>
	</form>
</body>
</html>