$(document).on('turbolinks:load', function() {
  $(function() {
    // $(".userpanel-popup").on("mouseover", function(e) {
    //   $(this).find('.popup').show();
    //   });
    // $(".userpanel-popup").on("mouseout", function(e) {
    //   $('.popup').hide();


    $(".card-body-title").on(
    {
      'click': function()
      {
        setTimeout(function()
        {
          $(this).find('.card-body-title').css(
          {
            'color':'Red'
          },500);
        });
      }

    // $(".userpanel-popup").on({
    //   'mouseover': function() {
    //     sethover = setTimeout(function(){
    //       $(this).find('.popup').show();
    //     },500);
    //   },
      // 'mouseout': function() {
      //   $(this).find('.popup').hide();
      //   clearTimeout(sethover);
      // }
    });
  });
})
