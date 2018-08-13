$(document).on('turbolinks:load', function() {
  $(function() {
    $(".userpanel-popup").on("mouseover", function(e) {
      console.log("マウスオーバーされました");
      $(this).find('.popup').show();
      });
    $(".userpanel-popup").on("mouseout", function(e) {
      console.log("マウスアウトされました");
      $('.popup').hide();
    });
  });
})
