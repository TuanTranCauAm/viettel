$("#form-delete-comment").submit(function (e) {
    e.preventDefault();
    
    var form = $(this);
    var commentid = $("#form-delete-comment input[name='commentid']").val();
    var userid = $("#form-delete-comment input[name='userid']").val();
    if (commentid=="" || userid == "") {
      $(document).Toasts("create", {
        class: "bg-danger",
        title: "Xóa",
        subtitle: "Bình luận",
        body: "Có lỗi xảy ra. Vui lòng thử lại.",
        autohide: true,
        delay: 3000,
      });
    } else {
      $.ajax({
        type: "POST",
          url: form.attr("action"),
          data: form.serialize(),
          success: function($data) {
            if ($data == "success") {
            $(document).Toasts("create", {
              class: "bg-success",
              title: "Xóa",
              subtitle: "Bình luận",
              body: "Xóa bình luận thành công. Refresh để xem thay đổi.",
              autohide: true,
              delay: 3000,
            });
            form[0].reset();
          }
          else {
            $(document).Toasts("create", {
              class: "bg-danger",
              title: "Xóa",
              subtitle: "Bình luận",
              body: "Có lỗi xảy ra. Vui lòng thử lại.",
              autohide: true,
              delay: 3000,
            });
          }
        }
      })
    }
  });