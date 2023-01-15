
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