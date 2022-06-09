/*$("#tab-user")
	.DataTable({
		// dom: "Bfrtip", //Thêm dom vào thì nó sẽ hiện đồng thời giữa language và bottom
		responsive: true,
		lengthChange: false,
		autoWidth: false,
		language: {
			url: "//cdn.datatables.net/plug-ins/1.10.25/i18n/Vietnamese.json",
		},
	})

$(".btn-edit").click(function (e) {
	var fname = $(this).data("fname");
	var lname = $(this).data("lname");
	var gender = $(this).data("gender");
	var phone = $(this).data("phone");
	var img = $(this).data("img");
	var day = $(this).data("day");
	var month = $(this).data("month");
	var year = $(this).data("year");
	// console.log(email, fname, lname, gender, age, phone);
	$("#EditUserModal input[name='fname']").val(fname);
	$("#EditUserModal input[name='lname']").val(lname);
	if (gender)
		$('#EditUserModal #Nam').prop("checked", true); //Search checked input radio jquery
	else
		$('#EditUserModal #Nu').prop("checked", true);
	$("#EditUserModal input[name='day']").val(day);
	$("#EditUserModal input[name='month']").val(month);
	$("#EditUserModal input[name='year']").val(year);
	$("#EditUserModal input[name='phone']").val(phone);
	$("#EditUserModal input[name='img']").val(img);
	$('#EditUserModal').modal('show');
})


$(".btn-delete").click(function (e) {
	//var phone = $(this).data("phone");
	//$("#DeleteUserModal input[name='phone']").val(phone);
	//$("#DeleteUserModal input[name='fname']").val(phone);
	//$('#DeleteUserModal').modal('show');
})*/