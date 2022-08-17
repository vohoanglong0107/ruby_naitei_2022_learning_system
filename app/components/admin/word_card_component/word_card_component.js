$(window).on("turbolinks:load", function () {
  $(".flippable").on("click", function () {
    $(this).toggleClass("flipme");
  });
});
