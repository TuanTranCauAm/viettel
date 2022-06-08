$("#TAB-product")
  .DataTable({
    responsive: true,
    lengthChange: false,
    autoWidth: false,
    language: {
      url: "//cdn.datatables.net/plug-ins/1.10.25/i18n/Vietnamese.json",
    },
    columnDefs: [{ orderable: false, targets: 6 }],
  })
  .buttons()
  .container()
  .appendTo("#TAB-product_wrapper .col-md-6:eq(0)");

$("#form-add-student").submit(function (e) {
  e.preventDefault();

  //Write code to check if student id is existed!
  //Camel case
  var name = $("#form-add-student input[name='name']").val();
  var price = $("#form-add-student input[name='price']").val();
  var type = $("#form-add-student input[name='type']").val();
  var description = $("#form-add-student textarea[name='description']").val();
  var content = $("#form-add-student textarea[name='content']").val();

  var url = $("#fileToUpload").val();
  var length = url.length;
  var form = $(this);
  var a = url[length - 1];
  var b = url[length - 2];
  var c = url[length - 3];
  var ext = c + b + a;
  if (name == "" || description == "" || type == "") {
    $(document).Toasts("create", {
      class: "bg-danger",
      title: "Quản lý",
      subtitle: "Library",
      body: "Bạn phải nhập đầy đủ thông tin",
    });
  }
  else if (type != 1 && type != 2 && type != 3) {
    $(document).Toasts("create", {
      class: "bg-danger",
      title: "Quản lý",
      subtitle: "Library",
      body: "Loại sản phẩm chỉ bao gồm 1, 2 và 3",
    });
  } else {
    if (price < 1000) {
      $(document).Toasts("create", {
        class: "bg-danger",
        title: "Quản lý",
        subtitle: "Library",
        body: "Bạn phải nhập giá lớn hơn 1000 đồng",
      });
    } else {
        $(document).Toasts("create", {
          class: "bg-success",
          title: "Quản lý",
          subtitle: "Library",
          body: "Bạn Thêm mới thành công",
        });
        form.unbind("submit").submit();
        setTimeout(function () {
        }, 1000);
    }
  }

  //     if (data.status == "FOUND") alert("Đã tồn tại mã số sinh viên này!");
});


$(".btn-edit").click(function (e) {
  var id = $(this).data("id");
  var name = $(this).data("name");
  var type = $(this).data("type");
  var price = $(this).data("price");
  var description = $(this).data("description");
  var content = $(this).data("content");
  var img = $(this).data("img");
//   console.log(content);
  $("#EditStudentModal input[name='id']").val(id);
  $("#EditStudentModal input[name='name']").val(name);
  $("#EditStudentModal input[name='type']").val(type);
  $("#EditStudentModal input[name='price']").val(price);
  $("#EditStudentModal textarea[name='description']").val(description);
  $("#EditStudentModal textarea[name='content']").val(content);
  $("#EditStudentModal input[name='imggg']").val(img);
  $("#EditStudentModal").modal("show");
});

$(".btn-delete").click(function (e) {
  var id = $(this).data("id");
  $("#DeleteStudentModal input[name='id']").val(id);
  $("#DeleteStudentModal").modal("show");
});