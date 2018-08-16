$(document).on('turbolinks:load', function(){
 $(function() {
   $('.userpanel-popup').on({
     'mouseenter':function(){
       var dummy = $(this);
       sethover = setTimeout(function(){
         dummy.find('.popup').fadeIn(200);
       },1000);
     },
     'mouseleave':function(){
       $('.userpanel-popup').find('.popup').fadeOut(200);
       clearTimeout(sethover);
     }
   });
 });
});
