$(window).on("turbolinks:load", function () {
  $("#wordCarousel .carousel-inner .carousel-item div .form-check-input").on(
    "change",
    function () {
      const checkBox = $(this);
      if (checkBox.is(":checked")) {
        $.ajax({
          url: checkBox.attr("data-check-href"),
          type: "POST",
          dataType: "json",
          data: {
            word_id: checkBox.attr("data-word-id"),
          },
          success: function (data) {
            checkBox.attr("data-uncheck-href", data.url);
          },
          error: function (data) {
            alert(data);
          },
        });
      } else {
        $.ajax({
          url: checkBox.attr("data-uncheck-href"),
          type: "DELETE",
          dataType: "json",
          success: function (data) {
            checkBox.attr("data-uncheck-href", "");
          },
          error: function (data) {
            alert(data);
          },
        });
      }
    }
  );
});
