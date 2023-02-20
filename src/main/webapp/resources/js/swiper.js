window.onload = function () {

var swiper = new Swiper(".mySwiper", {
			slidesPerView: 3,
			spaceBetween: 200,
			freeMode: true,
			autoplay: {//자동으로 슬라이드됨.
				delay: 10000,//현재슬라이드가 보여지는 시간(5000ms=5초)
				disableOnInteraction: false//상호작용후 다시 자동재생 실행
			},
		})

 //nav script - start
  $(document).ready(function () {
    //브라우저가 열렸을 때 이 기능을 수행함
    $(".nav").hover(
      () => {
        //.nav 클래스 명을 가진 엘리먼트(=요소)가 마우스로 호버되면 아래 함수 수행하라
        $("#sliding_menu").stop().slideDown(600); //아이디가 sliding_menu라는 엘리먼트를 sliDown(시간)함수로 표시 / 1000이 1초 /stop함수는 누적되는 큐(queue) 제거
      },
      function () {
        //마우스가 nav를 떠나면 아래 명령을 수행
        $("#sliding_menu").stop().slideUp(600); //마우스가 nav를 떠나면 slideUp함수로 드롭다운 메뉴를 다시 숨김
      }
    );
  });
  //nav script - end





  //프로필 서브 메뉴바
  var a1, a2;
  var onHoverText = false;
  var onHoverBMenu = false;

  function a2_over() {
    onHoverText = true;
    a1.style.display = "block";
  }

  function a2_out() {
    onHoverText = false;

    setTimeout(() => {
      if (!onHoverText && !onHoverBMenu) {
        a1.style.display = "none";
      }
    }, 1000);
  }

  function a1_over() {
    onHoverBMenu = true;
  }

  function a1_out() {
    onHoverBMenu = false;

    setTimeout(() => {
      if (!onHoverText && !onHoverBMenu) {
        a1.style.display = "none";
      }
    }, 1000);
  }

  function init() {
    a1 = document.getElementById("profli_menu");
    a2 = document.getElementsByClassName("profli_btn")[0];
    a1 = document.querySelector("#profli_menu");
    a2 = document.querySelector(".profli_btn");

    a1.addEventListener("mouseover", a1_over);
    a1.addEventListener("mouseout", a1_out);

    a2.addEventListener("mouseover", a2_over);
    a2.addEventListener("mouseout", a2_out);
  }

  init();
  
		
	
};