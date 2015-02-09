$(document).ready(function() {
  var smooth = 400;
  fadeFlashNotices(); 
  categoryClick(); 
  showCriteriaDetails();
  preventLinkDefault();
  toggleUserEmailForm(); 
  closeEmailModal();
  
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
    $('.criteria-details').click(function() {
      $(this).closest('.results').find('.result-details').fadeToggle(smooth); 
    }); 
  }
  
  function preventLinkDefault() { 
    $('a[href="#"]').click(function(e) { 
      e.preventDefault(); 
    });
  }
  
  function toggleUserEmailForm() {
    $('.footer-msg').click(function(e) {
      $('.email_popup').fadeToggle(smooth);   
      e.stopPropagation();
      closeEmailModal();
    }); 
  } 
 
  function closeEmailModal() {
    $(document).click(function(e) {
      var modal = $('.email-inner'); 
      var form = $('#user_email');
      if( !$(modal).is(e.target) && !$(form).is(e.target)) {
        fadePopup();
      } 
    });

    $('.close-popup').click(function(e) {
      fadePopup();
    });
  }

  function fadePopup() {
    $('.email_popup').fadeOut(smooth);   
  }
});
