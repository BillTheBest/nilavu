$(document).ready(function(){
      $("#megamform").validate({
         rules: {
            check_req: {required: true}
         },
         messages: {
            check_req: "Just check the box"
         }
      });
});

//Notification alert
$(document).ready(function(){
//var count = $("#events ul").children().length;
var count = $("#events li").length;

if (count > 0) {
               $('#notification').removeClass('badge badge-success').addClass('badge badge-alert');
            }

});

$(document).ready( function(){

    $('.app_config').click( function(event){

    	$('.config_menu').hide();
		$('.app_config').removeClass('config_acive');
    	cls = this.id;
    	// $('.app_config').removeClass('config_acive');
        event.stopPropagation();
        $('.'+cls).toggle();
        $(this).toggleClass('config_acive');
    });

    $(document).click( function(){
        $('.config_menu').hide();
        $('.app_config').removeClass('config_acive');
    });
});

// Remove alert message on clicking the close button
$(".c_remove").click(function(){
    $('.c_remove_main').hide();
});


    $(".default .jCarouselLite").jCarouselLite({
        btnNext: ".default .next",
        btnPrev: ".default .prev",
        start: 2,
        scroll: 3
    });

// LOAD cloud-1 by default
