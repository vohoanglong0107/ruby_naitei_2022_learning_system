$(window).on("turbolinks:load", function () {
  $("#wordCarousel .carousel-inner .carousel-item div .form-check-input").on(
    "change",
    function () {
      const reloadTable = () => $("words-list").prop("dataTable").ajax.reload();
      const checkBox = $(this);
      if (checkBox.is(":checked")) {
        $.ajax({
          url: "/user_learn_words",
          type: "POST",
          dataType: "json",
          data: {
            word_id: checkBox.attr("data-word-id"),
          },
          success: function (response) {
            checkBox.attr("data-user-learn-word-id", response.data.id);
            reloadTable();
          },
          error: function (data) {
            toastr.error(data.message);
            checkBox.prop("checked", false);
          },
        });
      } else {
        $.ajax({
          url: `/user_learn_words/${checkBox.attr("data-user-learn-word-id")}`,
          type: "DELETE",
          dataType: "json",
          success: function () {
            reloadTable();
          },
          error: function (data) {
            toastr.error(data.message);
            checkBox.prop("checked", true);
          },
        });
      }
    }
  );
});
