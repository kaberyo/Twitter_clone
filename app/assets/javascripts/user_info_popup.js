$(document).on('turbolinks:load', function() {
  $(function() {
    $(".userpanel-popup").on("mouseover", function(e) {
      $(this).find('.popup').show();
      });
    $(".userpanel-popup").on("mouseout", function(e) {
      $('.popup').hide();
    });
  });
})
