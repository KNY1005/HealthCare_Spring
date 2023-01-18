window.onload = function () {
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
    a2 = document.getElementsByClassName("btn")[0];
    a1 = document.querySelector("#profli_menu");
    a2 = document.querySelector(".btn");

    a1.addEventListener("mouseover", a1_over);
    a1.addEventListener("mouseout", a1_out);

    a2.addEventListener("mouseover", a2_over);
    a2.addEventListener("mouseout", a2_out);
  }

  init();

	 // Created for an Articles on:
    // https://www.html5andbeyond.com/bubbling-text-effect-no-canvas-required/

    jQuery(document).ready(function ($) {
      // Define a blank array for the effect positions. This will be populated based on width of the title.
      var bArray = [];
      // Define a size array, this will be used to vary bubble sizes
      var sArray = [4, 6, 8, 10];

      // Push the header width values to bArray
      for (var i = 0; i < $(".bubbles").width(); i++) {
        bArray.push(i);
      }

      // Function to select random array element
      // Used within the setInterval a few times
      function randomValue(arr) {
        return arr[Math.floor(Math.random() * arr.length)];
      }

      // setInterval function used to create new bubble every 350 milliseconds
      setInterval(function () {
        // Get a random size, defined as variable so it can be used for both width and height
        var size = randomValue(sArray);
        // New bubble appeneded to div with it's size and left position being set inline
        // Left value is set through getting a random value from bArray
        $(".bubbles").append(
          '<div class="individual-bubble" style="left: ' +
            randomValue(bArray) +
            "px; width: " +
            size +
            "px; height:" +
            size +
            'px;"></div>'
        );

        // Animate each bubble to the top (bottom 100%) and reduce opacity as it moves
        // Callback function used to remove finsihed animations from the page
        $(".individual-bubble").animate(
          {
            bottom: "100%",
            opacity: "-=0.7",
          },
          3000,
          function () {
            $(this).remove();
          }
        );
      }, 350);
    });

};
