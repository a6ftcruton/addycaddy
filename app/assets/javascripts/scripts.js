//('#compare').click(function() {
// alert("Clicked Button");
//);
$(document).ready(function() {
 fadeFlashNotices(); 
 
 function fadeFlashNotices() {
   $('.flash').hide().delay(400).fadeIn(800).delay(4000).fadeOut(800);
 }
});
