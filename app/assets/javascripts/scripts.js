$(document).ready(function() {
  fadeFlashNotices(); 
  categoryClick(); 
  showCriteriaDetails();
  preventLinkDefault();
  toggleUserEmailForm(); 
  hideUserEmailForm();
  
  function fadeFlashNotices() {
    $('.alert-box').fadeIn(800).delay(3000).fadeOut(800);
  }

  function categoryClick() {
   $('.category-button').click(function(e) {
     var clicked = $(e.currentTarget).attr('class').split(/\s+/).pop();
     $('.criteria-group').toggle("slow").not('.' + clicked + '-group').delay(200).hide();
   }); 
  }
  
  function showCriteriaDetails() {
    $('.results').click(function() {
      $(this).find('.result-details').fadeToggle("slow"); 
    }); 
  }
  
  function preventLinkDefault() { 
    $('a[href="#"]').click(function(e) { 
      e.preventDefault(); 
    });
  }
  
  function toggleUserEmailForm() {
    $('.footer-msg').click(function(e) {
      e.preventDefault();
      $('.email_popup').show();   
    }); 
    $('.show-container').click(function(e) {
      $('.email_popup').hide();   
    });
  } 
 
  function hideUserEmailForm() {
      }
});
