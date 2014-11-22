$(document).ready(function() {
  fadeFlashNotices(); 
 
  function fadeFlashNotices() {
    $('.alert-box').fadeIn(800).delay(3000).fadeOut(800);
  }
});
