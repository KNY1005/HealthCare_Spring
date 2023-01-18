$(document).ready(function () {
  slider();
});

function slider() {
  var winW = window.innerWidth; //화면 가로사이즈
  var swiper = undefined;
  var viewNum = ""; //슬라이드 개수 (옵션)
  var loopChk = ""; //무한반복 체크
  var slideNum = $(".slider .swiper-slide").length; //슬라이드 총 개수
  var slideInx = 0; //현재 슬라이드 index

  //디바이스 체크
  var winWChk = "";
  $(window).on("load resize", function () {
    winW = window.innerWidth;
    if (winWChk != "mo" && winW <= 768) {
      //모바일 버전으로 전환할 때
      winWChk = "mo";
      sliderAct();
    }

    if (winWChk != "pc" && winW >= 769) {
      //PC 버전으로 전환할 때
      winWChk = "pc";
      sliderAct();
    }
  });

  function sliderAct() {
    //슬라이드 초기화
    if (swiper != undefined) {
      swiper.destroy();
      swiper = undefined;
    }

    //slidesPerView 옵션 설정
    if (winW > 768) {
      //PC 버전
      viewNum = 4;
    } else {
      //mobile 버전
      viewNum = 2;
    }

    //loop 옵션 체크
    if (slideNum > viewNum) {
      loopChk = true;
    } else {
      loopChk = false;
    }

    swiper = new Swiper(".slider .inner", {
      slidesPerView: "auto",
      initialSlide: slideInx,
      loop: loopChk,
      centeredSlides: true,
      navigation: {
        nextEl: $(".slider .swiper-next"),
        prevEl: $(".slider .swiper-prev"),
      },
      on: {
        activeIndexChange: function () {
          slideInx = this.realIndex; //현재 슬라이드 index 갱신
        },
      },
    });
  }
}

//서브메뉴
$(document).ready(function () {
  $(".menu-v1").mouseover(function () {
    $(this).children(".submenu").stop().slideDown(600);
  });
  $(".menu-v1").mouseleave(function () {
    $(this).children(".submenu").stop().slideUp(600);
  });
});

//전체 선택
function selectAll(selectAll) {
  const checkboxes = document.querySelectorAll('input[type="checkbox"]');

  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  });
  
  
  
   $(document).ready(function(){
        $(".menu-v1").mouseover(function(){
            $(this).children(".submenu").stop().slideDown(600);
        });
        $(".menu-v1").mouseleave(function(){
            $(this).children(".submenu").stop().slideUp(600);
        });
        
    });


    function selectAll(selectAll)  {
    const checkboxes 
     = document.querySelectorAll('input[type="checkbox"]');
  
     checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked
     })
	}
	
}
