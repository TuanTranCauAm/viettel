$('#TAB-news').DataTable({
    "responsive": true, "lengthChange": false, "autoWidth": false,
    language: {
        url: "//cdn.datatables.net/plug-ins/1.10.25/i18n/Vietnamese.json"
    } ,
    columnDefs: [
        { orderable: false,
             targets: 6
            }
      ]
    }).buttons().container().appendTo('#TAB-news_wrapper .col-md-6:eq(0)');
    $("#form-add-student").submit(function (e) {
        e.preventDefault();
      
        //Write code to check if student id is existed!
        //Camel case
        var form = $(this);
        var title = $("#form-add-student input[name='title']").val();
        var description = $("#form-add-student textarea[name='description']").val();
        var content = $("#form-add-student textarea[name='content']").val();
        var thumbnail = $("#form-add-student input[name='thumbnail']").val();
        var categoryid = $("#form-add-student input[name='categoryid']").val();
        if (title == "" || description == "" || content == "" || thumbnail == "" || categoryid == "") {
          $(document).Toasts("create", {
            class: "bg-danger",
            title: "Thêm",
            subtitle: "Bài viết",
            body: "Bạn phải nhập đầy đủ thông tin",
          });
        } else {
          form.unbind("submit").submit();
            $(document).Toasts("create", {
                class: "bg-success",
                title: "Thêm",
                subtitle: "Bài viết",
                body: "Bạn Thêm mới thành công",
              });
              form.unbind("submit").submit();
              setTimeout(function () {
              }, 1000);
    
        }
      });
$(".btn-edit").click(function (e) {
    var id = $(this).data("id");

    var description = $(this).data("description");
    var content = $(this).data("content");
    var title = $(this).data("title");
    var thumbnail = $(this).data("thumbnail");
    var categoryid = $(this).data("categoryid");
    console.log($(this).data());
    $("#EditStudentModal input[name='id']").val(id);
    $("#EditStudentModal textarea[name='description']").val(description);
    $("#EditStudentModal textarea[name='content']").val(content);
    $("#EditStudentModal input[name='title']").val(title);
    $("#EditStudentModal input[name='thumbnail']").val(thumbnail);
    $("#EditStudentModal input[name='categoryid']").val(categoryid);
    $('#EditStudentModal').modal('show');
});

$(".btn-delete").click(function (e) {
    var id = $(this).data("id");
    $("#DeleteStudentModal input[name='id']").val(id);
    $('#DeleteStudentModal').modal('show');
});
$(".btn-hide").click(function (e) {
    var id = $(this).data("id");
    $("#HideStudentModal input[name='id']").val(id);
    $('#HideStudentModal').modal('show');
});
