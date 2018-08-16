$(document).on('turbolinks:load', function(){
 $(function() {
   $('.tweet__right--favorite').on({
     'mouseenter':function(){
       var dummy = $(this);
       sethover = setTimeout(function(){
        dummy.find('.iine_popup').fadeIn(200);
     },500);
    },
     'mouseleave':function(){
       $('.tweet__right--favorite').find('.iine_popup').fadeOut(200);
       clearTimeout(sethover);
     }
   });
 });
});

$(document).on('turbolinks:load', function(){
 $(function() {
   $('.tweet__right--reply').on({
     'mouseenter':function(){
       var dummy = $(this);
       sethover = setTimeout(function(){
        dummy.find('.henshin_popup').fadeIn(200);
     },500);
    },
     'mouseleave':function(){
       $('.tweet__right--reply').find('.henshin_popup').fadeOut(200);
       clearTimeout(sethover);
     }
   });
 });
});
