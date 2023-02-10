<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var path = "${pageContext.request.contextPath }";

	$(document).ready(function() {
		var msg = "${msg}";
		if (msg != "") {
			alert(msg);
		}
	});

	function fnSubmit() {

		var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var tel_rule = /^\d{2,3}\d{3,4}\d{4}$/;

		if ($("#mid").val() == null || $("#mid").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#mid").focus();

			return false;
		}

		if ($("#mname").val() == null || $("#mname").val() == "") {
			alert("이름을 입력해주세요.");
			$("#mname").focus();

			return false;
		}

		if ($("#mphone").val() == null || $("#mphone").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#mphone").focus();

			return false;
		}

		if (!tel_rule.test($("#mphone").val())) {
			alert("전화번호 형식에 맞게 입력해주세요.");
			return false;
		}

		if (confirm("비밀번호를 찾으시겠습니까?")) {

			$("#createForm").submit();

			return false;
		}
	}
</script>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>비밀번호 찾기</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<form commandName="searchVo" id="createForm"
	action="${path}/member/search_result_pwd.do" method="post">
	<input type="hidden" id="me_id_yn" name="me_id_yn" value="N" />

	<body class="bg-gradient-primary">
		<div class="container">
			<!-- Outer Row -->
			<div class="row justify-content-center">
				<div class="col-xl-10 col-lg-12 col-md-9">
					<div class="card o-hidden border-0 shadow-lg my-5">
						<div class="card-body p-0">
							<!-- Nested Row within Card Body -->
							<div class="row">
								<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
								<div class="col-lg-6">
									<div class="p-5">
										<div class="text-center">
											<h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
											<p class="mb-4">We get it, stuff happens. Just enter your
												ID, name, phon number below and we'll send you a link to
												reset your password!</p>
										</div>
										<form class="user">
											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="mid" name="mid" placeholder="Enter ID...">
											</div>
											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="mname" name="mname" placeholder="Enter name...">
											</div>
											<div class="form-group">
												<input type="email" class="form-control form-control-user"
													id="mphone" name="mphone"
													placeholder="Enter phon number...">
											</div>
											<a href="javascript:void(0)"
												onclick="fnSubmit(); return false;"
												class="btn btn-primary btn-user btn-block"> Reset
												Password </a>
										</form>
										<hr>
										<div class="text-center">
											<a class="small" href="/account/register">Create an
												Account!</a>
										</div>
										<div class="text-center">
											<a class="small" href="/account/login">Already have an
												account? Login!</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</form>
</html>
