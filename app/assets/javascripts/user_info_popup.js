$(document).on('turbolinks:load', function()
{
  $(function()
  {
    $(".userpanel-popup").on(

      'mouseover',function()
      {
        var dummy = $(this);
        var timerId = setTimeout(function()
        {
          dummy.find('.popup').show();
        },1000);
      }
    );
    $(".userpanel-popup").on('mouseout', function(e)
    {
      $('.popup').hide();
      clearTimeout(timerId);
    });
  });
});


$(document).on('turbolinks:load', function()
{
  $(function()
  {
    $(".userpanel-popup").on(

      'mouseover',function()
      {
        var dummy = $(this);
        var timerId = setTimeout(function()
        {
          dummy.find('.popup').show();
        },1000);
      }
    );
  });
});





// $(document).on('turbolinks:load', function()
// {
//   $(function()
//   {
//     $(".userpanel-popup").on("mouseover", function(e)
//     {
//       $(this).find('.popup').show();
//     });
//     $(".userpanel-popup").on("mouseout", function(e)
//     {
//       $('.popup').hide();
//     });
//   });
// })



