$(document).ready(function () {
  //--------- change color value of the form text/password inputs -----

  const textInputs = $("input[type='textbox']");
  const passwordsInputs = $("input[type='password']");
  //--------- Login screen swicth -----

  $("button").click(function (event) {
    //  prevent buttons in form to reload
    event.preventDefault();
  });

  $("a").click(function (event) {
    //  prevent 'a' links in form to reload
    event.preventDefault();
  });

  $("#sign_up").click(function () {
    // when click Sign Up button, hide the Log In elements, and display the Sign Up elements
    $("#title-login").toggleClass("hidden", true);
    $("#login-fieldset").toggleClass("hidden", true);
    $("#login-form-submit").toggleClass("hidden", true);
    $("#lost-password-link").toggleClass("hidden", true);
    $("#sign_up").toggleClass("active-button", false);
    $("#log_in").removeAttr("disabled");

    $("#title-signup").toggleClass("hidden", false);
    $("#signup-fieldset").toggleClass("hidden", false);
    $("#signup-form-submit").toggleClass("hidden", false);
    $("#log_in").toggleClass("active-button", true);
    $("#sign_up").prop("disabled", true);
  });

  $("#log_in").click(function () {
    // when click Log In button, hide the Sign Up elements, and display the Log In elements
    $("#title-login").toggleClass("hidden", false);
    $("#login-fieldset").toggleClass("hidden", false);
    $("#login-form-submit").toggleClass("hidden", false);
    $("#lost-password-link").toggleClass("hidden", false);
    $("#sign_up").toggleClass("active-button", true);
    $("#log_in").prop("disabled", true);

    $("#title-signup").toggleClass("hidden", true);
    $("#signup-fieldset").toggleClass("hidden", true);
    $("#signup-form-submit").toggleClass("hidden", true);
    $("#log_in").toggleClass("active-button", false);
    $("#sign_up").removeAttr("disabled");
  });
  
  	var checkIdFlag = false;
	var checkIdVal = "";
	function checkId(){
		var idval = $("input[name=mid]").val();
		
		$.ajax({
			url : "checkId.do",
			type: "post",
			data: "mid="+idval,
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
		$(".join").submit(function() {
			
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
	
});


