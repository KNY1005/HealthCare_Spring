<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
	<!--파비콘-->
	<link rel="icon" type="image/png" sizes="16x16"
	href="${path }/resources/image/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${path }/resources/image/favicon/manifest.json" />
<meta name="msapplication-TileColor" content="#ffffff" />
<meta name="msapplication-TileImage"
	content="${path }/resources/image/favicon/ms-icon-144x144.png" />
<meta name="theme-color" content="#ffffff" />
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

    <script>
      var problem = 1; // 몇 번 문제인지를 설정하는 인덱스 변수
      var total = 0; // 점수를 저장하는 변수

      var test_check = null; // 문제가 모두 체크되었는지 확인하는 변수 (문제의 개수만큼 배열로 동적할당됨)
      var num_of_test = 15; // 문제의 총 개수를 저장하는 변수

      var all_problem_created = false; // 문제가 모두 만들어졌는지 여부를 확인하는 boolean 변수

      // 문자열 배열을 선언하여 각 문항들을 저장함
      // 첫 번째 데이터가 공백인 이유는 배열 인덱스 관리를 1부터 20까지 직관적으로 하기 위함
      var test_text = [
        [" "],
        ["1.38℃ 이상의 고열이 며칠이상 계속된다"],
        ["2.근육통, 관절통, 두통 등 전신 통증의 강도가 높다"],
        ["3.전신 피로도가 극심하다"],
        ["4.감기 증상이 전조증상 없이 갑자기 나타났다"],
        ["5.감기약을 며칠 동안 복용해도 낫지 않는다"],
        ["6.인후통과 같은 호흡기 증상이 있다"],
        ["7.극심한 오한을 느낀다"],
        ["8.속이 메스껍고 구토, 설사를 한다"],
        ["9."],
        ["10."],
        ["11."],
        ["12."],
        ["13."],
        ["14."],
        ["15."],
      ];

      // 문제의 개수만큼 배열을 동적할당
      // 이 배열은 각 문제가 체크되었는지를 확인하는 용도
      function create_check_array() {
        test_check = new Array();

        for (var i = 1; i <= num_of_test + 1; i++) {
          test_check.push(false);
        }
      }

      function create_radio_button() {
        if (all_problem_created == false) {
          // 문제가 만들어져있지 않다면 -> 문제 생성
          create_check_array();
          all_problem_created = true;

          $("#radio_area").slideDown(); // 설문지를 펼침
          $(".end_btn").show(); // 종료 버튼을 표시함

          for (var i = 0; i < num_of_test; i++) {
            // 문제의 개수만큼 반복
            var newText = document.createTextNode(test_text[problem]); // 질문 텍스트를 가져와서 저장함
            document.getElementById("text_area").appendChild(newText); // 질문을 출력

            for (var j = 0; j <= 1; j++) {
              // 각 질문마다 라디오 버튼 생성 (0점 ~ 3점 총 4개)

              var radioInput = document.createElement("input"); // <input>을 만들고 변수에 지정함

              // 각 속성들을 지정함
              radioInput.setAttribute("type", "radio"); // = radioInput.type = "radio";
              radioInput.setAttribute("name", "problem" + problem);
              radioInput.setAttribute("value", "answer" + j);

              document.getElementById("btn_area").appendChild(radioInput); // 속성을 지정한 <input>을 출력 (라디오 버튼 출력)
            }
            problem++; // 각 문제의 출력이 끝나면 다음 문제로 넘어감

            // 문제 출력이 끝나고 나면 줄바꿈
            // 텍스트와 라디오 버튼에 각각 따로 지정해야 레이아웃 오류가 발생하지 않음
            var hr1 = document.createElement("hr");
            document.getElementById("text_area").appendChild(hr1);

            var hr2 = document.createElement("hr");
            document.getElementById("btn_area").appendChild(hr2);
          }
        } else {
          // 문제가 만들어져 있다면 -> 생성하지 않음
          alert("진행 중인 진단이 있습니다.");
        }
      }

      function check_gloomy() {
        // 총점 체크
        total = 0;

        for (var i = 1; i <= problem; i++) {
          // 문제의 개수만큼 반복
          var radio_btn = document.getElementsByName("problem" + i); // 문제의 개수만큼 라디오 버튼을 저장함

          for (var j = 0; j < radio_btn.length; j++) {
            // 저장된 라디오 버튼의 체크 여부 확인
            if (radio_btn[j].checked) {
              // 버튼이 체크되었다면 해당 점수만큼을 총점에 더함
              total += j;

              // 배열에 표시
              test_check[i] = true; // 해당 문제 체크 여부를 저장함
            }
          }
        }

        if (all_problem_check() == true) {
          // test_check 배열을 통해 모든 문제가 체크되었는지 확인함
          alert("총점 : " + total); // 총점 표시

          // 각 점수의 구간에 따라 우울증의 정도를 출력
          if (total >= 0 && total <= 20) {
            alert("감기");
          } else if (total >= 21 && total <= 40) {
            alert("독감");
          } else if (total >= 41 && total <= 60) {
            alert("코로나");
          }
        } else {
          // 체크되지 않은 문제가 있으면 오류 출력
          alert("확인하지 않은 문항이 있습니다.");
        }
      }

      // test_check 배열을 통해 모든 문제가 체크되었는지 확인함
      function all_problem_check() {
        for (var i = 1; i < num_of_test + 1; i++) {
          if (test_check[i] == false) {
            return false;
          }
        }
        return true;
      }

    </script>
    <style>

.header {
  width: 100%;
  height: 100%;
  position: absolute;
  text-align:center;
  background: linear-gradient(60deg, rgba(84,58,183,1) 0%, rgba(0,172,193,1) 100%);
  color:white;
}
.logo {
  width:50px;
  fill:white;
  padding-right:15px;
  display:inline-block;
  vertical-align: middle;
}

.inner-header {
  height:65vh;
  width:100%;
  margin: 0;
  padding: 0;
}

.flex { /*Flexbox for containers*/
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.waves {
  position:relative;
  width: 100%;
  height:15vh;
  margin-top: 920px;
  margin-bottom:-7px; /*Fix for safari gap*/
  min-height:200px;
  max-height:150px;
}

.content {
  position:relative;
  height:20vh;
  text-align:center;
  background-color: white;
}

/* Animation */

.parallax > use {
  animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;
}
.parallax > use:nth-child(1) {
  animation-delay: -2s;
  animation-duration: 7s;
}
.parallax > use:nth-child(2) {
  animation-delay: -3s;
  animation-duration: 10s;
}
.parallax > use:nth-child(3) {
  animation-delay: -4s;
  animation-duration: 13s;
}
.parallax > use:nth-child(4) {
  animation-delay: -5s;
  animation-duration: 20s;
}
@keyframes move-forever {
  0% {
   transform: translate3d(-90px,0,0);
  }
  100% { 
    transform: translate3d(85px,0,0);
  }
}
/*Shrinking for mobile*/
@media (max-width: 768px) {
  .waves {

    height:50px;
    min-height:40px;
  }
  .content {
    height:30vh;
  }
  h1 {
    font-size:24px;
  }
}

      body{
        margin: 0; padding: 0;
        overflow: hidden;
      }

      #radio_area {
        width: 600px;
        height: 650px;
        backdrop-filter: blur(10px);
        background-color: rgba(255, 255, 255, 0.5);
        box-shadow: 2px 7px 15px 8px rgba(0,0,0,0.3);
        padding: 20px;
        display: none;
        border-radius: 15px;
      }

      #text_area {
        width: 80%;
        float: left;
        display: block;
        color: rgb(15, 15, 15);
        height: 600px;
        box-sizing: border-box;
        font-weight: bold;
      }

      #btn_area {
        width: 20%;
        float: right;
        text-align: center;
        display: block;
      }

      .display_score {
        float: right;
        font-size: 0.7em;
        text-align: center;
        color: rgb(0, 0, 0);
        margin-right: 30px;
      }

      .end_btn {
        display: none;
        border: none;
        background: rgb(255, 121, 121);
        font-size: 15px;
      border-radius: 15px;
      color: #fff;
      width: 120px;
      height: 30px;
        
      }
/**/
      hr {
        border-bottom: none;
        border: 1px solid rgb(255, 171, 171);
      }
      .main_box{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
      }

       .main_box h2{
        margin-bottom: -20px;
        text-align: center;
        font-size: 50px;
        color: #fff;
       }
      body{
        background-image: "";
      }
      #start_btn{
        position: absolute;
        top: 0;
        left: 50%;
        transform: translate(-50%);

        background: rgb(255, 121, 121);
        font-size: 15px;
        border-radius: 15px;
        color: #fff;
        width: 100px;
        height: 30px;
        border: none;
        line-height: 10px;
      }

      .btn_box{
        display: flex;
        flex-direction: row;
        width: 300px;
      }
      
      .btn_box button{
        
        margin-right: 20px;
      }
    </style>
  </head>

  <body>
    <div class="header">

    <!--Waves Container-->
    <div>
    <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
    viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
    <defs>
    <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
    </defs>
    <g class="parallax">
    <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
    <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
    <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
    <use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
    </g>
    </svg>
    </div>
    <!--Waves end-->

</div>
    <main>
      <div class="main_box">
        <h2>호흡기질환 자가진단</h2>
        <button id="start_btn" onclick="create_radio_button()">진단 시작</button>
        <br /><br />
        <div id="radio_area">
          <div class="display_score">
              답변 방법<br>
            아니오 / 예
          </div>
          <br /><br />
          <div id="text_area"></div>
          <!-- 문제 출력 div -->
          <div id="btn_area"></div>
          <!-- 라디오 버튼 출력 div -->
        </div>
        <br />
        <div class="btn_box">
          <button  id="end_btn" class="end_btn" onclick="check_gloomy()">결과 보기</button>
          <button class="end_btn" onclick="check_gloomy()" class="back_btn">메인화면으로</button>
        </div>
      </body>
      </div>
    </main>
</html>
