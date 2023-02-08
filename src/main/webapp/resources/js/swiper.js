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