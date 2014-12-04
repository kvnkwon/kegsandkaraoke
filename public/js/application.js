$(document).ready(function () {

  $(".landing-bg").backstretch("/img/home.jpeg");

  $(".texture-form").backstretch("/img/footer_lodyas.png");

  Mousetrap.bind('enter', function () {
    $(".crowd-cheer").html("MAKE SOME NOISE!!!!!")
  }, 'keyup')

  $('.new-sesh').submit(function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: "POST",
      url: $target.attr("action"),
      data: $target.serialize()
    }).done(function(response) {
      $('.testing').html("<li>" + response + "</li>")
    })

  });
});
