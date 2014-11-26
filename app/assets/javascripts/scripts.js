$(document).ready(function() {
  fadeFlashNotices(); 
  categoryClick(); 

  function fadeFlashNotices() {
    $('.alert-box').fadeIn(800).delay(3000).fadeOut(800);
  }

  function categoryClick() {
   $('.category-button').click(function(e) {
     var clicked = $(e.currentTarget).attr('class').split(/\s+/).pop();
     $('.switch.radius').toggle("slow").not('.' + clicked + '-group').delay(200).hide();
   }); 
  }
});
