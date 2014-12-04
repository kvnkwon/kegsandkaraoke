$(document).ready(function () {

  $(".landing-bg").backstretch("/img/home.jpeg");

  $(".texture-form").backstretch("/img/footer_lodyas.png");

  Mousetrap.bind('enter', function () {
    $(".crowd-cheer").html("MAKE SOME NOISE!!!!!")
  }, 'keyup')
});
