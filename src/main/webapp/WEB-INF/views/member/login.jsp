<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인하러가기!</h2>
	<form action="login.do" method="post"> <!-- 데이터베이스에 있는 데이터를 실질적으로 바꿀때 post사용 / 매크로돌려서 패스워드 맞추는걸막기위해?-->
		아이디 : <input type="text" name="mid">
		<br>
		비밀번호 : <input type ="password" name="mpwd" >
		<br>
		<button>로그인</button>
	</form>
</body>
</html>