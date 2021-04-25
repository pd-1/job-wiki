$(function(){
  $('.s_01 .accordion_one .accordion_header').click(function(){
    $(this).next('.accordion_inner').slideToggle();
    $(this).toggleClass("open");
  });
});