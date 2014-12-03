$(document).ready(function () {

  $(".landing-bg").backstretch("https://ununsplash.imgix.net/46/unsplash_52c319226cefb_1.JPG?q=75&fm=jpg&s=72d1a0318ab967123bb38fc959042808");

  $(".texture-form").backstretch("/img/footer_lodyas.png");

  $('.delete-form').submit(function(event){
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: "DELETE",
      url: $target.attr("action")
    }).done(function(response) {
    })
  });
});
